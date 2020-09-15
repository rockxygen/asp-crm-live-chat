<%
' Dim Chat Sistem

Set crmChat = New Chat_Class

Class Chat_Class
		
	' Online/Offline Status
	
	function color_status(id)

		set kontrol = conn.execute("select onlinezamani from crm_uyeler where id='"&cint(id)&"'")

			if kontrol.eof then
				color_status = "bg.jpg"
			else
				if kontrol("onlinezamani") >= songirisi then
					color_status = "online.jpg"
				else
					color_status = "offline.jpg"
				end if
			end if

	end function

	' User Avatar
	
	function avatar(id, string)

	end function

	' Hack Kontrol
	
	function editText(gelen)
		temizmetin = replace(gelen, "'", "’")
		editText = temizmetin
	end function
	
	function outText(gelen)
		temizmetin = replace(gelen, "'", "’")
		temizmetin = replace(temizmetin, chr(13), "<br>")
		outText = temizmetin
	end function
	
	function hControl(string)
			 hControl=replace(string, "'", "")
			 hControl=replace(string, "*", "")
			 hControl=replace(string, "=", "")
			 hControl=replace(string, "%", "")
			 hControl=replace(string, "#", "")
			 hControl=replace(string, "<", "")
			 hControl=replace(string, ">", "")
			 hControl=replace(string, "|", "")
			 hControl=replace(string, ";", "")
			 hControl=replace(string, "?", "")
			 hControl=replace(string, "/", "")
			 hControl=replace(string, "\", "")
			 hControl=replace(string, "(", "")
			 hControl=replace(string, ")", "")
			 hControl=replace(string, "!", "")
			 hControl=replace(string, "-", "")
			 hControl=replace(string, "&", "")
			 hControl=replace(string, "Chr(34)", "")
			 hControl=replace(string, "Chr(39)", "")
	end function
	
End Class
%>