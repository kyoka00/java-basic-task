<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
String player = (String)session.getAttribute("player");
	switch (player) {
	case "A":
		player = "B";
		break;
	case "B":
		player = "A";
		break;
	default:

	}
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
    <h2>
      勝者：プレイヤー<%= player %>！！
    </h2>
    <form action="index.jsp">
      <button class="btn" type="submit">先頭に戻る</button>
    </form>
  </div>
</body>
</html>