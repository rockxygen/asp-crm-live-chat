<%

	' veritabanı bağlantısı
	
	set conn = Server.CreateObject("ADODB.connection")
		dsn = "DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;UID=root;pwd=;db=crm_chat;"
		conn.Open dsn
		conn.Execute("SET NAMES 'utf8'")
		conn.Execute "SET CHARACTER SET utf8"
		' conn.Execute "SET COLLATION_CONNECTION = 'utf8_turkish_ci'"
		
	' session değerleri
	
	session("kullanici") = "rockxygen"

	session_user = session("kullanici")
	session_avat = session("resim")
	session_uids = cint(session("id"))
	
	' online güncellemesi
	
	'conn.execute("update crm_uye_tablo set onlinezamani = now() where id='"&session_uids&"'")
	'songirisi	= dateadd("n", -10, now())
	
	

%>
<!--#include file="../class.chat.asp"-->