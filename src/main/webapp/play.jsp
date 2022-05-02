<%@ page import = "util.Utility" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% 
	String nums = request.getParameter("num");
	
	
    // 残数の更新処理(残数の取得、更新、保存など) 
    int totalNum;
    String player;
    String stone ="";
    
    if (session.getAttribute("totalNum")==null){
    	totalNum = 25;  // 残数用の変数。仮で25をセットしている。必要に応じて変更
    }else{
    	totalNum =(int)session.getAttribute("totalNum");
    }
    
    if (session.getAttribute("player")== null){
    	player ="A";
    }else {
    	player=(String)session.getAttribute("player");
    	
    }
    
       	  

      		if (Utility.isNullOrEmpty(nums)== false){
      			
      		int num = Integer.parseInt(nums);
      		totalNum -= num;
      		if(totalNum >=1){
      			//表示
      			stone = Utility.getStoneDisplayHtml(totalNum);
      			
      			
      			switch (player) {
      			case "A":
      				player = "B";
      				break;
      			case "B":
      				player = "A";
      				break;
      			default:

      			}
      			session.setAttribute("totalNum",totalNum);
     			 session.setAttribute("player", player);
      		}else { 
      			response.sendRedirect("finish.jsp");
      		}
      	
      		}else{
      			stone =Utility.getStoneDisplayHtml(totalNum);
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
      残り：<%= totalNum %>個
    </h2>
    <p><%= stone%></p>
  </div>
  <div class="info">
    <h2>
      プレイヤー<%=player %>の番
    </h2>

    <form action="play.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="3">
        個取る<br> ※1度に3個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>