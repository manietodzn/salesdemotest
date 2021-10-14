$PBExportHeader$salesdemo.sra
$PBExportComments$Generated Application Object
forward
global type salesdemo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
String gs_host = "http://localhost:16561"
Int gi_service_type = 1  //DataStore: 1, ModelStore: 2, SqlModelMapper: 3

//Service Type
Constant Int WEBAPI_DATASTORE = 1
Constant Int WEBAPI_MODELSTORE = 2
Constant Int WEBAPI_SQLMODELMAPPER = 3
Boolean gb_expand = True

String gs_msg_title = "Sales CRM Demo"


end variables

global type salesdemo from application
string appname = "salesdemo"
string displayname = "SalesDemo"
string themepath = "C:\Program Files (x86)\Appeon19\Shared\PowerBuilder\theme190"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "21.0.0.1288"
boolean manualsession = false
boolean unsupportedapierror = false
end type
global salesdemo salesdemo

forward prototypes
public function integer of_getserviceurl ()
end prototypes

public function integer of_getserviceurl ();String ls_file

ls_file = "apisetup.ini"

IF Not FileExists(ls_file) Then
	MessageBox("Error", "Apisetup.ini does not exist.")
Else
	gs_host = "http://" + Trim(ProfileString(ls_file, "Setup", "URL", ""))
	gi_service_type = ProfileInt(ls_file, "Setup", "ModelType", 3)
End IF

IF Isnull(gs_host) OR gs_host = '' Then Return -1
Return 1
end function

on salesdemo.create
appname="salesdemo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on salesdemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;String  ls_theme

MessageBox ( "Ejercicio de prueba" , "Git" )

ls_theme = ProfileString("apisetup.ini", "Setup", "Theme", "Flat Design Blue")
IF ls_theme <> "Do Not Use Themes" THEN
	applytheme(GetCurrentDirectory( ) + "\Theme\" + ls_theme)
END IF

IF of_getserviceurl() = 1 Then
	open(w_main)
Else
	open(w_setup)
End IF
end event

