LJ B@usr/lib/lua/se/api/lazyinit/definitions/KnxConnectionSettings.lua�  4 <= [3   3 : 3 3 3 ::3 :	3
 :3 :3 :3 :3 :3 :3 3 ::3 3 ::3 3 ::3 3  ::!3" :#3$ :%3& 3' :(:)3* 3+ :(:,3- 3. :(:/30 31 :(:2:3 H  propertiesga_ip_list formatknx_group_address	typestring description'IP > TP filter: Group address list	type
arrayga_tp_list formatknx_group_address	typestring description'TP > IP filter: Group address list	type
arrayia_ip_list formatknx_individual_address	typestring description,IP > TP filter: Individual address list	type
arrayia_tp_list
items formatknx_individual_address	typestring description,TP > IP filter: Individual address list	type
arrayfilter_int description4TP > IP filter: Apply filter to virtual objectsdefault	typebooleanfilter_tun description.IP > TP filter: Apply filter to tunnelingdefault	typebooleania_ip_policy  nad descriptionIP > TP filter: SRC policy	typestringga_ip_policy  nad description%IP > TP filter: DST group policy	typestringia_tp_policy  nad descriptionTP > IP filter: SRC policy	typestringga_tp_policy  nad description%TP > IP filter: DST group policy	typestringqueuesize descriptionMaximum telegrams in queueminimummaximum�	typeintegerdefaultdformat
int32ttl descriptionMulticast TTLminimummaximumd	typeintegerdefaultformat
int32
mcast descriptionMulticast IPformat	ipv4	typestring
knxip descriptionKNX IP features	typebooleaneibaddr descriptionKNX addressformatknx_individual_address	typestringtpuarts_ack descriptionACK all group telegrams	typeboolean
cpath descriptionTunneling router IP	typestring
cmode  	enum  tpuartsipipt	iptn description	Mode	typestringrequired  
cmodeeibaddr
knxip
mcast 	typeobject	
"#&(++,-00125567::;=@ADFIIJKNNOPSSTUXXYZ[  