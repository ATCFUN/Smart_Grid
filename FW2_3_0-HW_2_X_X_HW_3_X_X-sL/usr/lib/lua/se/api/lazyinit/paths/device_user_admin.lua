LJ 8@usr/lib/lua/se/api/lazyinit/paths/device_user_admin.lua�    "3  3 3  :3 :2 3 ;3 ;:3	 3 :
3 ::: H  
patch  responses403 description�Admin password has not been changed.
Please check your request for either new password conditions (minimum length)
or current password validity.200   descriptionAdmin password changedparameters descriptionAdmin's current password	namecurrent_passwordrequiredinformData	typestringformatpassword descriptionAdmin's new password	namenew_passwordrequiredinformDataminLength	typestringformatpasswordconsumes  &application/x-www-form-urlencoded	tags description)Sets a new password for 'admin' useroperationIddevice.user.admin.patchsummaryAdmin password change  device
users !"  