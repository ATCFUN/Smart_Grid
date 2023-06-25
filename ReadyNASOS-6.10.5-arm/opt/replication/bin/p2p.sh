#-------------------------------------------------------------------------
#  Copyright 2010-2012, NETGEAR
#  All rights reserved.
#-------------------------------------------------------------------------

P2P_SERVICE=/etc/init.d/leafp2p
P2P_CLIENT=/opt/p2p/bin/p2pnetclient
P2P_ZERO=0
P2P_51=-51
P2P_501=-501
P2P_300=-300
P2P_400=-400
P2P_LAN_CASE=2
P2P_RELAY_CASE1=4
P2P_RELAY_CASE2=5
P2P_UNDOC=-1000

CONNECT_TYPE_UNDEFINED=1
CONNECT_TYPE_LOCAL=2
CONNECT_TYPE_LAN=3
CONNECT_TYPE_P2P=4
CONNECT_TYPE=$CONNECT_TYPE_UNDEFINED

DATA_IP=""
TASK_IP=""
MINE_IP=""

#
# arg:
#
p2p_restart()
{
    sleep 10
    return $OK

    #log_warn "Restart p2p service"
    #${P2P_SERVICE} stop
    #${P2P_SERVICE} start
    #sleep 60
}

p2p_reset_var()
{
    P2PNET_LOCAL_IP=""
    P2PNET_RETVAL=""
    P2PNET_PEER=""
    P2PNET_PEER_IP=""
    P2PNET_PEER_HOST_IP=""
    P2PNET_CONN_TRY=""
    P2PNET_CONN_PROTO=""
    P2PNET_CONN_DIR=""
    P2PNET_CONN_METHOD=""
    P2PNET_CONN_ROLE=""
    P2PNET_CONN_INITIATOR=""
    P2PNET_CONN_ENCTYPE=""
}

#
# arg: <output.array>
#
p2p_parse_output()
{
    local out=($1)
    for line in ${out[@]}
    do
	case "${line%%=*}" in
	    "p2pnet_local_ip")
		P2PNET_LOCAL_IP=${line#p2pnet_local_ip=}
		log_dbg "p2pnet_local_ip: ${P2PNET_LOCAL_IP}"
		;;
	    "p2pnet_retval")
		P2PNET_RETVAL=${line#p2pnet_retval=}
		log_dbg "p2pnet_retval: ${P2PNET_RETVAL}"
		;;
	    "p2pnet_peer")
		P2PNET_PEER=${line#p2pnet_peer=}
		log_dbg "p2pnet_peer: ${P2PNET_PEER}"
		;;
	    "p2pnet_peer_ip")
		P2PNET_PEER_IP=${line#p2pnet_peer_ip=}
		log_dbg "p2pnet_peer_ip: ${P2PNET_PEER_IP}"
		;;
	    "p2pnet_peer_host_ip")
		P2PNET_PEER_HOST_IP=${line#p2pnet_peer_host_ip=}
		log_dbg "p2pnet_peer_host_ip: ${P2PNET_PEER_HOST_IP}"
		;;
	    "p2pnet_conn_try")
		P2PNET_CONN_TRY=${line#p2pnet_conn_try=}
		log_dbg "p2pnet_conn_try: ${P2PNET_CONN_TRY}"
		;;
	    "p2pnet_conn_proto")
		P2PNET_CONN_PROTO=${line#p2pnet_conn_proto=}
		log_dbg "p2pnet_conn_proto: ${P2PNET_CONN_PROTO}"
		;;
	    "p2pnet_conn_dir")
		P2PNET_CONN_DIR=${line#p2pnet_conn_dir=}
		log_dbg "p2pnet_conn_dir: ${P2PNET_CONN_DIR}"
		;;
	    "p2pnet_conn_method")
		P2PNET_CONN_METHOD=${line#p2pnet_conn_method=}
		log_dbg "p2pnet_conn_method: ${P2PNET_CONN_METHOD}"
		log_inf "Connection method: ${P2PNET_CONN_METHOD}"
		;;
	    "p2pnet_conn_role")
		P2PNET_CONN_ROLE=${line#p2pnet_conn_role=}
		log_dbg "p2pnet_conn_role: ${P2PNET_CONN_ROLE}"
		;;
	    "p2pnet_conn_initiator")
		P2PNET_CONN_INITIATOR=${line#p2pnet_conn_initiator=}
		log_dbg "p2pnet_conn_initiator: ${P2PNET_CONN_INITIATOR}"
		;;
	    "p2pnet_conn_enctype")
		P2PNET_CONN_ENCTYPE=${line#p2pnet_conn_enctype=}
		log_dbg "p2pnet_conn_enctype: ${P2PNET_CONN_ENCTYPE}"
		;;
	    *)
		log_dbg "Unknown p2net output: ${line}"
		;;
	esac
    done
}

#
# arg: <net.id> <peer.name>
#
p2p_connect_try()
{
    p2p_reset_var

    local peer_alias="${2%_*}"
    log_inf "p2p connect to ${peer_alias} in ${1} network"

    local out=$(${P2P_CLIENT} connect ${1} ${2} | tr -d '\r')
    p2p_parse_output "${out}"
    [ -z "${P2PNET_RETVAL}" ] && P2PNET_RETVAL=${P2P_UNDOC}
}

#
# arg: <net.id> <peer.name>
#
p2p_connect()
{
    local my_name=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Username)

    p2p_set_local_ip || {
	log_err "Unable to get p2p local ip address"
	return $ERROR
    }

    MINE_IP="${P2PNET_LOCAL_IP}"

    [ "x${2}" == "x${my_name}" ] && {
	CONNECT_TYPE=$CONNECT_TYPE_LOCAL
	DATA_IP="${P2PNET_LOCAL_IP}"
	TASK_IP="${P2PNET_LOCAL_IP}"
	return $OK
    }

    p2p_connect_try "${1}" "${2}"

    [ ${P2PNET_RETVAL} -eq ${P2P_51} ] && {
	p2p_restart
	p2p_connect_try "${1}" "${2}"
    }

    [ ${P2PNET_RETVAL} -eq ${P2P_400} ] && {
	p2p_restart
	p2p_connect_try "${1}" "${2}"
    }

    [ ${P2PNET_RETVAL} -eq ${P2P_300} ] && {
	p2p_connect_try "${1}" "${2}"
    }

    [ ${P2PNET_RETVAL} -lt ${P2P_ZERO} ] && {
	local peer_alias="${2%_*}"
	log_err "Unable to connect to ${peer_alias}"
	log_err "Connect error code: ${P2PNET_RETVAL}"
	case ${P2PNET_RETVAL} in
	${P2P_51})
	    log_err "Please check source device is online and Replicate service is running"
	    ;;
	${P2P_501})
	    log_err "Please check network connection between devices"
	    ;;
	esac
	return $ERROR
    }

    TASK_IP="${P2PNET_PEER_IP}"

    if [ ${P2PNET_CONN_METHOD} -eq ${P2P_LAN_CASE} ];
    then
	CONNECT_TYPE=$CONNECT_TYPE_LAN
	DATA_IP="${P2PNET_PEER_HOST_IP}"
    else
	CONNECT_TYPE=$CONNECT_TYPE_P2P
	DATA_IP="${P2PNET_PEER_IP}"
    fi

    [[ ${P2PNET_CONN_METHOD} -eq ${P2P_RELAY_CASE1} || ${P2PNET_CONN_METHOD} -eq ${P2P_RELAY_CASE2} ]] && {
	log_warn "Using a relayed connection, consider setting up port forwarding"
    }
    return $OK
}

#
#arg: <net.id> <peer.name>
#
p2p_disconnect()
{
    local my_name=$(rxml ${REMOTE_CONFIG} /Configuration/AccountInformation/Username)
    [ "x${2}" == "x${my_name}" ] && return $OK

    local peer_alias="${2%_*}"
    log_inf "p2p disconnect with ${peer_alias} in ${1} network"
    ${P2P_CLIENT} disconnect ${1} ${2}
    return $OK
}

#
#arg: -
#
p2p_set_local_ip_try()
{
    p2p_reset_var
    local out=$(${P2P_CLIENT} getlocalip | tr -d '\r')
    p2p_parse_output "${out}"
    [ -z "${P2PNET_RETVAL}" ] && P2PNET_RETVAL=${P2P_UNDOC}
}

#
#arg: -
#
p2p_set_local_ip()
{
    p2p_set_local_ip_try
    [ ${P2PNET_RETVAL} -lt ${P2P_ZERO} ] && {
	p2p_restart
	p2p_set_local_ip_try
    }
    [ ${P2PNET_RETVAL} -lt ${P2P_ZERO} ] && {
	log_err "Unable to get local p2p address"
	return $ERROR
    }
    LOCAL_IP="${P2PNET_LOCAL_IP}"
    return $OK
}
