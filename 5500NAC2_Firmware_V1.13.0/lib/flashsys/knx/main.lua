LJú  3  T4  7    > =T'4 7 'ÿ >	 T4 7 'ÿ >	 T4  7    > 7%	 %
 >>T4  7    >% 	 
 >	$	>G  -*255	gsub	bandbitinsert
table þ  _* 4  7%	 
  $	
	> T	% 	  7 %
 >  T	4 7T4 7(  4	 7
%	 
 > 4	 7	 
 4 7% > =4	 7	 
 4 7  > =4 7%	 > 2  '  	 '
 I!  T4 7 'ÿ >	 T4     >)  6 T  T T	  T4     >)  Kß4 7	 %
 @ 
concat
tableout	bandbit1min	math	copy0	bytestring	fillchar[?]newffidecodeiadecodegabuslibga	find/etc/eibd/filter_readfileio × 	 ; ¦4   % > 5  4  7  % > 5  3  2  : 2  : 5 	 1 
 5  1  5  4     T4  4 > D4	 7:4	 :BNù4 	 7  7    T 4 	 7  % : 4  4	 77>    T 4 	 7  % : 4 	 7  4 % >: 4 	 7  4 % >: 4 	 7  4 % >: 4 	 7  4 % >: 4  7  %  > 5 ! 4  7  %" >    T%  5 # 3 $ 5 % 4 !   7 & %' >    T4 ( 7 ) 4% ' %* > % + 5 , 4 !   7 & %- >    T 4 #   7 & %. >    T 4 #   7 & %/ >    T 4 ( 7 ) 4% ' % > 4  7 0 %1 >    T% 2 5 3 % 4 45 764	 >%7 45 764% >%8 43   T% %9 4,   T% %: $  0  H  ½      'tab',
      { type: 'checkbox', name: 'filter_tun' },
      { type: 'select', name: 'ia_ip_policy', values: ['n', 'a', 'd'], translate: true },
      { type: 'textarea', name: 'ia_ip_list', rows: 8 },
      { type: 'notice', text: 'knx_ia_policy_hint' },
      { type: 'select', name: 'ga_ip_policy', values: ['n', 'a', 'd'], translate: true },
      { type: 'textarea', name: 'ga_ip_list', rows: 8 },
      { type: 'notice', text: 'knx_ga_policy_hint' },
      'tab',
      { type: 'checkbox', name: 'filter_int' },
      { type: 'select', name: 'ia_tp_policy', values: ['n', 'a', 'd'], translate: true },
      { type: 'textarea', name: 'ia_tp_list', rows: 8 },
      { type: 'notice', text: 'knx_ia_policy_hint' },
      { type: 'select', name: 'ga_tp_policy', values: ['n', 'a', 'd'], translate: true },
      { type: 'textarea', name: 'ga_tp_list', rows: 8 },
      { type: 'notice', text: 'knx_ga_policy_hint' }
    ],
    submitEl: win.footerEl,
    reboot: true
  });

  FlashSYS.setCache('knx', { window: win });
  form.loadValues(data.values, data.params);
})();
Ô      { type: 'text', name: 'queuesize', validate: { required: false, integer: [ 1, 1000 ] } },
      { type: 'select', name: 'tos', values: [ 0, 1, 2, 3, 4, 5, 6, 7 ], translate: false },
      { type: 'text', name: 'key', validate: { required: false, regexp: /^[0-9a-fA-F]{32}$/ } },
      { type: 'blockStart', name: 'only_secure' },
        { type: 'checkbox', name: 'only_secure' },
      'blockEnd',
      { type: 'notice', text: 'knx_secure_hint' },
      Ê, translate: true,
        blocks: {
          def: { cpath: false, tpuarts_ack: false, only_secure: true },
          change: {
            tpuarts: { cpath: false, tpuarts_ack: true, only_secure: true },
            ipt: { cpath: true, tpuarts_ack: false, only_secure: false },
            iptn: { cpath: true, tpuarts_ack: false, only_secure: false }
          }
        }
      },
      { type: 'blockStart', name: 'cpath' },
        { type: 'text', name: 'cpath', validate: 'ipport' },
      'blockEnd',
      { type: 'blockStart', name: 'tpuarts_ack' },
        { type: 'checkbox', name: 'tpuarts_ack' },
      'blockEnd',
      { type: 'text', name: 'eibaddr', validate: { regexp: /^(1[0-5]|[0-9])\.(1[0-5]|[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/ } },
      { type: 'checkbox', name: 'knxip' },
      { type: 'text', name: 'mcast', validate: 'ipport' },
      { type: 'text', name: 'ttl', validate: { required: false, integer: [ 1, 128 ] } },
      ð;

  win = FlashSYS.newWindow({
    id: 'knx',
    title: $TR('knx'),
    width: 480,
    height: 600,
    padding: 0,
    canReload: false,
    type: 'modal'
  });

  form = new FlashSYS.Form(win.contentEl, {
    trPrefix: 'knx_',
    module: 'knx',
    tabs: ['general', 'ip_filter', 'tp_filter'],
    elements: [
      { type: 'select', name: 'cmode', values: encode	json*(function(){
  var win, form, data = mcastwifi-{ type: 'checkbox', name: 'mcastwifi' },/sys/class/net/wlan0existsLM5RDCLM5GMC
Intel
fixup5{ type: 'notice', text: 'knx_connection_hint' },	ft12insert
tableOC8	find
modes  ipipt	iptn
model/proc/device-tree/modelcpuinfo/proc/cpuinforeadfileio
ga_ipga_ip_list
ga_tpga_tp_list
ia_ipia_ip_list
ia_tpia_tp_list
cpathcheckhostiptpuarts
local
cmodeid
pairsloadfilter out configparamsvalues  cfg	eibd	inituciffirequire 