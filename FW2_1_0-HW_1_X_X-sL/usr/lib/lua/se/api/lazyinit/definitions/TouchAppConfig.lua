LJ ;@usr/lib/lua/se/api/lazyinit/definitions/TouchAppConfig.lua  F \]  3   3 : 3- 3 3 3 :3 3 :3	 :
3 :3 3 3 :3 3 :3 :3 :
3 3	 3
 :
	3
 3 3 ::
3 :

3 3 :: 
3! 3" :#:$
3% :
3& :'
3( :)
:
*	:	#:+:*:#:,:*:#:.3/ :30 31 32 :34 33 :536 :7:*:#:839 ::3; 3< :3> 3= :?3@ :A3B :C3D :E:*: :* H  screensaver description3Screensaver timeout in seconds, `0` = disabledminimum 	typeinteger
titleScreensaver timeoutformat
int32dropdown_rooms_menu 
titleDropdown rooms menu	typebooleanmain_screen default
titleShow main screendescriptionKFlag to show the main screen in the application `true` or not `false`.	typeboolean
theme   defaultÿÿÿÿminimumÿÿÿÿdescription|Number of theme from *themes* list. The numbering of themes array starts from zero. The value `-1` means default theme.	typeinteger
titleDefault themeformat
int32  
thememain_screen 	typeobjectversion descriptionApp version number
titleVersionformat
float	typenumberthemes	path description	TODO	typestring	name   descriptionTheme name	typestring  	name 	typeobject description6List of custom themes defined by the application.	type
array descriptionPage title	typestringfloors  
roomswidgetspropertiesuid minLength pattern^[0-9a-f]+$descriptionGUnique 32 character alpha-numeric string identifier of the widget.	typestring	type descriptionWidget type	typestring descriptionWidget title	typestringsystems
items 	typestring description List of engineering systems	type
arraysettings 	typeobject description2Widget settings - depends on the widget type.	typeobject descriptionJPosition (order) of widget in the list of widgets on the room screen.minimumformat
int32	typeintegerobjects  additionalProperties formatknx_group_address	typestring descriptionEObjects settings for the widget - depends on the type of widget.	typeobject  uid
title	type 	typeobject descriptionWidgets list	type
array descriptionNPosition (order) of room in the sorted room menu list. Sort is ascending.minimum format
int32	typeinteger description;Title/name of the room displayed/used on page and menu
titleRoom name	typestring
floor   format
int32	typeinteger  
floor
titlewidgets
order 	typeobject descriptionRooms list	type
arrayn format
int32	typeinteger
order descriptionPPosition (order) of floor in the sorted floor menu list. Sort is ascending.minimum format
int32	typeinteger
title   descriptionFloor title	typestring  
title
rooms 	typeobject descriptionFloors list	type
arrayrequired  floors
titleversionsettings 	typeobject

 !$%)*/035567:=>?DEHHIJMMNORSVW\]^_`abcdegjloqqrssttuvwy~   