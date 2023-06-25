// Editor: Jean-Marie Stawikowski - HUB/WEB - 22/12/2003
// Copyright � 2004 Schneider Electric, All Rights Reserved.

function index() {
    indexLanguage('');
}

function indexLanguage(url) {
    if (isPocketPC()) {
        window.location.replace(url + 'header.htm');
    } else {
        otherPlatforms(url);
    }
    document.title = config.titleHtml;
}

function otherPlatforms(url) {
    if (window.top.location.search && window.top.mainTop) {
        //Fixes PCR #: PEP0300706R
        var substr = window.top.location.search.substring(1).toLowerCase();
        if (substr.match(/^\w{0,}:?\/\//)) {
            window.top.location = '/index.htm';
        } else {
            document.write(
                '<frameset onload="window.top.mainTop.panel.framesetLoaded();" cols="156,*" frameborder="no" border="0" framespacing="0" >' +
                '<frame name="panel" id="panel" src="' + window.top.location.pathname.replace("index.htm", "menu.htm") + '" scrolling="auto" noresize marginwidth="0" frameborder="no" />' +
                '<frame name="main" id="main" src="' + encodeURI(substr) + '" scrolling="auto" noresize marginwidth="0" frameborder="no"/>');
        }
    } else {
        document.write(
            '<frameset rows="78,*" cols="*" frameborder="no" border="0" framespacing="0">' +
            '<frame name="header" id="header" src="' + encodeURI(url) + 'header.htm" scrolling="no" noresize marginwidth="0" frameborder="no" />' +
            '<frame name="mainTop" id="mainTop" src="' + encodeURI(url) + 'home/index.htm" scrolling="auto" noresize marginwidth="0" frameborder="no" />');
    }

    document.write(
        '<noframes><body><p>This page uses frames, but your browser does not support them.</p></body></noframes>' +
        '</frameset>');
}