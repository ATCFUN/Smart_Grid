LJศ  
  *  3   4 7% > 4   >D 7	 >  TH BN๗% H unknown	find
pairs/proc/cpuinforeadfileio MT7688ramipsMX6	imx6MXSmxsOC8	at91GenuineIntelx86N   %    % $4 7 @ existsio.control/usr/lib/opkg/info/ฒ  	 j*  +  >     T% H T  T% H 4 7% > 7% %	 >  
 T T% H T% H 4 7% >  T8  T 7% %	 > T 7% %	 > 3 6 T + % >  T % $T+ % >  T % $T+ % >  T % $T
+ % >  T % $T   T % $T % $H  ภภ (i.MX6) (i.MX28) V3genohm-scada-lmwall-v3 V2 CNgenohm-scada-lmwall-v2cn V2genohm-scada-lmwall-v2 + Extgenohm-scada-lm5ex 		RCTLReactor Lite
LM5GMLM5 Reactor GM
LM5M3LM5 Lite
LM5RDLM5 Reactor Dimmer
LM5M4LM5 M4LM WallLM Wall (Ambient)
LM5RALM5 Reactor IOLM2 Re:actorReactor v1
LMBLEBluetooth Repeateri%.MX6UL i%.MX28 mxsLogicMachine/lib/genohm-scada/brandBluetooth RepeaterLM Wall (Ambient)	LMWAramips%z+	gsub/proc/device-tree/modelreadfileioLM2 (AT91)	at91Load Balancerx86W   +   >    T% H T  T% H TH  G   ภ
i.MX6	imx6i.MX28mxsฎ 	  44   7  % > 5  4     T %  0 )1  1 1 1 4  7%	 >  T	 >5
 4  7%	 >5 T >5
 4  7% >5 % 4 74
 >% 4 74 >% $0  H H   + '</b><br>'
            + $TR('upgrade_hint')
      }
    ],
    upload: true,
    callback: function(r) {
      FlashSYS.closeWindow('upgrade');

      if (r.toInt() == 1) {
        var st = 300;
        FlashSYS.hideNotifyWindow();
        MochaUI.Modal.modalOverlay.addClass('FSUpgradeFader');

        FlashSYS.Fader.start({
          title: $TR('upgrade_wait'),
          ticker: st.toString(),
          tickerPrefix: $TR('upgrade_remaining')
        });

        FlashSYS.reflashTicker(st);
        FlashSYS.watchdogIgnore = true;

        FlashSYS.load({ module: 'upgrade', action: 'start' });
      }
      else {
        FlashSYS.notifyWindow($TR('upgrade_invalid'), 'error');
      }
    },
    submitEl: win.footerEl
  });

  FlashSYS.setCache('upgrade', { window: win });
})();
- + '</b><br>'
            + 'SW: <b>' + encode	jsonโ(function() {
  var win = FlashSYS.newWindow({
    id: 'upgrade',
    title: $TR('upgrade'),
    width: 300,
    height: 180,
    padding: 5,
    canReload: false,
    type: 'modal'
  });

  FlashSYS.reflashTicker = function(tickTimer) {
    if (tickTimer >= 0) {
      FlashSYS.Fader.step(tickTimer.toString())
      FlashSYS.reflashTicker.delay(1000, FlashSYS, --tickTimer);
    }
    else {
      FlashSYS.Fader.stop();
      window.location.reload();
    }
  }

  new FlashSYS.Form(win.contentEl, {
    module: 'upgrade',
    saveModule: 'upgrade',
    saveAction: 'save',
    trPrefix: 'upgrade_',
    elements: [
      { type: 'file', name: 'fwfile', accept: '.img' },
      {
        type: 'notice',
        text: 'HW: <b>' + /lib/genohm-scada/versionswreadfilehw/lib/amatilinea/version    @FlashSYS.notifyWindow($TR('upgrade_unsupported'), 'error');res/lib/upgrade/platform.shexistsio 