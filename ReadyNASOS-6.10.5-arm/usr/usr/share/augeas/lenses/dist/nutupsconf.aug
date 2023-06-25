(*
Module: NutUpsConf
 Parses /etc/nut/ups.conf

Author: Raphael Pinson <raphink@gmail.com>
        Frederic Bohe  <fredericbohe@eaton.com>
        Arnaud Quette <arnaud.quette@gmail.com>

About: License
  This file is licensed under the GPL.

About: Lens Usage
  Sample usage of this lens in augtool

    * Print all drivers used
      > print /files//etc/nut/ups.conf/*/driver

About: Configuration files
  This lens applies to /etc/nut/ups.conf. See <filter>.
*)

module NutUpsConf =
  autoload ups_xfm

(************************************************************************
 * Group:                 UPS.CONF
 *************************************************************************)

let ups_comment  = IniFile.comment IniFile.comment_re IniFile.comment_default

let ups_sep      = IniFile.sep IniFile.sep_re IniFile.sep_default

let ups_global   = "chroot"
                 | "driverpath"
                 | "maxstartdelay"
                 | "maxretry"
                 | "retrydelay"
                 | "pollinterval"
                 | "synchronous"
                 | "user"

let ups_fields   = "driver"
                 | "port"
                 | "sdorder"
                 | "desc"
                 | "nolock"
                 | "ignorelb"
                 | "maxstartdelay"
                 | "synchronous"
                 | "CP"
                 | "CS"
                 | "ID"
                 | "LB"
                 | "LowBatt"
                 | "OL"
                 | "OffDelay"
                 | "OnDelay"
                 | "SD"
                 | "advanced_eco_mode"
                 | "advorder"
                 | "alarm_control"
                 | "authPassword"
                 | "authProtocol"
                 | "authtype"
                 | "awd"
                 | "batteryPercentage"
                 | "battery_alarm"
                 | "battery_max"
                 | "battery_min"
                 | "battery_number"
                 | "battery_open_status_check"
                 | "battext"
                 | "battvoltmult"
                 | "baud_rate"
                 | "baudrate"
                 | "bus"
                 | "bypass_alarm"
                 | "bypass_forbidding"
                 | "bypass_when_off"
                 | "cable"
                 | "cablepower"
                 | "chargetime"
                 | "community"
                 | "constant_phase_angle"
                 | "converter_mode"
                 | "daysoff"
                 | "daysweek"
                 | "dumbterm"
                 | "eco_mode"
                 | "explore"
                 | "fake_lowbatt"
                 | "flash"
                 | "frequency"
                 | "fruid"
                 | "full_update"
                 | "hb"
                 | "houroff"
                 | "houron"
                 | "idleload"
                 | "ignoresab"
                 | "input_timeout"
                 | "interruptonly"
                 | "interruptsize"
                 | "langid_fix"
                 | "lb"
                 | "limited_runtime_on_battery"
                 | "linevoltage"
                 | "load.off"
                 | "load.on"
                 | "load.status"
                 | "loadPercentage"
                 | "login"
                 | "lowbatt"
                 | "manufacturer"
                 | "max_bypass_freq"
                 | "max_bypass_volt"
                 | "max_load"
                 | "maxreport"
                 | "methodOfFlowControl"
                 | "mfr"
                 | "mibs"
                 | "min_bypass_freq"
                 | "min_bypass_volt"
                 | "mincharge"
                 | "minruntime"
                 | "model"
                 | "modelname"
                 | "nohang"
                 | "nombattvolt"
                 | "norating"
                 | "notification"
                 | "notransferoids"
                 | "novendor"
                 | "nowarn_noimp"
                 | "numOfBytesFromUPS"
                 | "offdelay"
                 | "oldmac"
                 | "ondelay"
                 | "output_pace"
                 | "output_phase_angle"
                 | "password"
                 | "pins_shutdown_mode"
                 | "pollfreq"
                 | "pollonly"
                 | "powerup"
                 | "prefix"
                 | "prgshut"
                 | "privPassword"
                 | "privProtocol"
                 | "product"
                 | "productid"
                 | "protocol"
                 | "rebootdelay"
                 | "reset_to_default"
                 | "runtimecal"
                 | "sdtime"
                 | "sdtype"
                 | "secLevel"
                 | "secName"
                 | "serial"
                 | "serialnumber"
                 | "shutdownArguments"
                 | "shutdown_delay"
                 | "shutdown_duration"
                 | "shutdown_timer"
                 | "silent"
                 | "site_fault_detection"
                 | "snmp_retries"
                 | "snmp_timeout"
                 | "snmp_version"
                 | "startdelay"
                 | "status_only"
                 | "stayoff"
                 | "subdriver"
                 | "subscribe"
                 | "testing"
                 | "testtime"
                 | "timeout"
                 | "ttymode"
                 | "type"
                 | "ups.delay.shutdown"
                 | "ups.delay.start"
                 | "upstype"
                 | "usb_set_altinterface"
                 | "usd"
                 | "use_crlf"
                 | "use_pre_lf"
                 | "username"
                 | "validationSequence"
                 | "vendor"
                 | "vendorid"
                 | "voltage"
                 | "wait"
                 | "work_range_type"
                 | "wugrace"


let ups_entry    = IniFile.indented_entry (ups_global|ups_fields) ups_sep ups_comment

let ups_title    = IniFile.indented_title IniFile.record_re

let ups_record   = IniFile.record ups_title ups_entry

let ups_lns      = IniFile.lns ups_record ups_comment

let ups_filter   = (incl "/etc/nut/ups.conf")
                . Util.stdexcl

let ups_xfm      = transform ups_lns ups_filter
