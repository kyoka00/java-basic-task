<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    //セッションクリア
    session.invalidate();
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
    <h2>条件</h2>
    <form action ="play.jsp" method="post">
    <label>石の総数</label>
    <input type="number" name="stoneNum" min="1"><br>
    <label>1度に取れる石の数</label>
    <input type ="number" name="stoneAtOnece" min ="1"><br>
    <label>プレイヤーの数</label>
    <input type="number" name="playerNum" min= "2" max="26" value="2"><br>
    <label>石の記号</label>
    <input type="text" name ="stoneChar" value="●"><br>
    <button class="btn" type="submit">始める</button>
    </form>
  </div>
</body>
</html>