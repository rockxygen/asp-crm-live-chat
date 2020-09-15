<!--#include file="config/config.asp"-->
<%

	action = request("action")
	
	if action = "startchatsession" then
		item = ""
		
		if item <> "" then
			item = mid(item, 0, -1)
		end if
		
		response.ContentType="application/json"
%>
{
		"username": "<%=session("kullanici")%>",
		"items": [
			<%=item%>
        ]
}
<%
	elseif action="chatheartbeat" then
		set chat = conn.Execute("select * from chat where (chat.to = '"+crmChat.hControl(session_user)+"' AND recd = 0) order by id ASC")
		item = ""
		set cold = conn.Execute("select * from chat where (chat.to = '"+crmChat.hControl(session_user)+"' AND recd = 1) order by id ASC")
		
		if chat.eof then
			item = ""
		else
			set update = conn.Execute("update chat set recd = 1 where chat.to = '"+crmChat.hControl(session_user)+"' and recd = 0")
			response.ContentType="application/json"
%>
{
		"username": "<%=session_user%>",
		"items": [
<%
			do while not chat.eof		
%>
				{
					"s": "0",
					"f": "<%=chat("from")%>",
					"m": "<%=chat("message")%>"
				}
<%			
			chat.movenext
			loop
%>
        ]
}
<%
		end if
	elseif action="closechat" then
	elseif action="onlines" then
	
		' burayı online üyeler listesinden çektirmelisiniz. arkadaş olup olmadıklarını da kontrol ettirebilirsiniz.
		
		' format olarak 
		' üyeadı|avatar
		' diğer üye için arada , kullanıyorsunuz.
	
		response.write "rocksijen|kahve.jpg,cain|kahve.jpg,ahmet|kahve.jpg,aleko|kahve.jpg"
		response.end
	
	elseif action="avatar" then
	
		' gönderilen üyenin avatarını veritabanından çektirebilirsiniz.
		
		user = trim(request("user"))
	
		response.write "kahve.jpg"
		response.end
	
	elseif action="sendchat" then
		from 	= session_user
		too		= request.form("to")
		message = trim(request.form("message"))
		
		Set send = conn.Execute("insert into chat (chat.from,chat.to,message,sent) values ('"+crmChat.hControl(from)+"', '"+crmChat.hControl(too)+"','<span>"+crmChat.hControl(message)+"</span>',NOW())")
		
		response.write 1
		
	end if
	
	' Response.Write("Session: " & Session.Contents.Count)
	
' For i = LBound(session("openChatBoxes")) to UBound(session("openChatBoxes"))
' Response.Write session("openChatBoxes")(i) & "<br>"
' Next
	
	' session.Abandon

%>