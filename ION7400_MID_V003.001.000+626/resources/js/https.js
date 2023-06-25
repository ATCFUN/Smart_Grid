/**
 * Security setup method.
 *
 * Call API method(s) and populate page contents with data.
 *
 */

var https = {

  init: function()
  {
    $('input[type=button]').button();
    $('#newSelfSigned').click(https.newSelfSigned);
    $('#eraseCustom').click(https.eraseCustom);
    $('#fileInputButton').click(https.fileUploadClick);
  },

  newSelfSigned: function()
  {
    if (confirm("$%localizedString(This will delete the custom certificate. You will be logged-out. Proceed ?)#$"))
    {
      $('#selfSignedStatus').text("$%localizedString(Certificate renewal in progress, may last up to 5 minutes)#$");
      $('#eraseCustomStatus').text('');
      $('#customStatus').text('');
      var reqObj = ({
        type: 'POST',
        url: '/api/https?command=new',
        requestArrayName: 'names',
        registerArray: ['blank'],
        returnType: 'json',
        timeout: 300000, //Generating key may last 5 mins
        successCallback: https.newSuccess,
        failCallback: https.newError
      });

      pmAjax.sendPostEmpty(reqObj);
    }
  },

  newSuccess: function()
  {
    $('#selfSignedStatus').text("$%localizedString(Successfully renewed self-signed certificate)#$");
    https.redirectToHomePage();
  },

  newError: function()
  {
    $('#selfSignedStatus').text("$%localizedString(Error renewing self-signed certificate)#$");
  },

  eraseCustom: function()
  {
    if (confirm("$%localizedString(Self-signed certificate will be used. You will be logged-out. Proceed ?)#$"))
    {
      $('#eraseCustomStatus').text("$%localizedString(Erasing custom certificate)#$");
      $('#selfSignedStatus').text('');
      $('#customStatus').text('');
      var reqObj = ({
        type: 'POST',
        url: '/api/https?command=erase',
        requestArrayName: 'names',
        registerArray: ['blank'],
        returnType: 'json',
        timeout: 30000, //File system access can be slow, allow 30s resonse time
        successCallback: https.eraseSuccess,
        failCallback: https.eraseError
      });

      pmAjax.sendPostEmpty(reqObj);
    }
  },

  eraseSuccess: function()
  {
    $('#eraseCustomStatus').text("$%localizedString(Custom certificate erased)#$");
    https.redirectToHomePage();
  },

  eraseError: function()
  {
    $('#eraseCustomStatus').text("$%localizedString(No custom certificate)#$");
  },

  fileUploadClick: function(event)
  {
    if(location.protocol != 'https:')
    {
      $('#customStatus').text("$%localizedString(HTTPS only)#$");
    }
    else
    {
      //Redirect button click to file input click
      $('#fileInput').change(https.fileUpload);
      $('#fileInputButton').click($('#fileInput').click());
    }
  },

  fileUpload: function(event)
  {
    var loaded = 0;
    var step = 100;
    var file = $('input[type=file]')[0].files[0];
    var total = file.size;
    var maxFileSizeInBytes = 10*1024; // 10KB

    if( total <= maxFileSizeInBytes )
    {
      var start = 0;
      var reader = new FileReader();
      var blob = file.slice(start,step);

      $('#customStatus').text("$%localizedString(Uploading...)#$");
      $('#selfSignedStatus').text('');
      $('#eraseCustomStatus').text('');
      reader.onload = function(e) {
        var fileChunk = new Uint8Array(reader.result);
        $.ajax({
          url: '/api/https?command=upload',
          type: 'POST',
          contentType: 'application/octet-stream',
          processData: false,
          data: fileChunk,
          headers: {Range: 'bytes ' + loaded + '-' + (loaded+fileChunk.length) + '/' + total},
          timeout: 30000, //File system access can be slow, allow 30s resonse time
          error: function(r){
            $('#customStatus').text("$%localizedString(Upload Failed)#$");
          },
          success: function(r){
            loaded += step;
            $('#customStatus').text( "$%localizedString(Uploading File)#$" + ' - ' + Math.floor((loaded/total)*100) + '%' );
            if(loaded <= total){
              blob = file.slice(loaded,loaded+step);
              reader.readAsArrayBuffer(blob);
            } else {
              loaded = total;
              $('#customStatus').text("$%localizedString(Upload Complete)#$");
              https.redirectToHomePage();
            }
          }
        })
      };
      reader.readAsArrayBuffer(blob);
    }
    else
    {
      $('#customStatus').text("$%localizedString(Upload size limit)#$"+' 10KB');
    }
  },

  redirectToHomePage: function(delay=2000)
  {
    setTimeout(function() {window.location.href = '../resources/monitoring.html';}, delay);
  }
}
