<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
char player = (char)session.getAttribute("player");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>
  <div class="info">
    
     <%
     int playerNum = (int)session.getAttribute("playerNum");
     if(playerNum<=66){
    	 switch (player){
    	 case 65:
    		 player = 66;
    		 break;
    	 case 66:
    		 	player = 65;
    		 	break;
    	default:
    		 		
    	 }
     	out.println("<h2>勝者：プレイヤー"+ player +"!!");
     }else{
     	out.println("<h2>敗者：プレイヤー"+ player +"!!");
     }
     
     %>
     
    <form action="index.jsp">
      <button class="btn" type="submit">先頭に戻る</button>
    </form>
  </div>
</body>
</html>