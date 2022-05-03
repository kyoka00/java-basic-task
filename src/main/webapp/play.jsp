<%@ page import = "util.Utility" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String nums = request.getParameter("num");
	String stoneNums = request.getParameter("stoneNum");
	String stoneAtOneces = request.getParameter("stoneAtOnece");
	String playerNums = request.getParameter("playerNum");
	String stoneChar = request.getParameter("stoneChar");
	int stoneAtOnece;
	
	if (Utility.isNullOrEmpty(stoneAtOneces) == false){
		stoneAtOnece = Integer.parseInt(stoneAtOneces); 
		session.setAttribute("stoneAtOnece", stoneAtOnece);
	}else if(session.getAttribute("stoneAtOnece")== null){
		stoneAtOnece =2;
	}else{
		stoneAtOnece = (int)session.getAttribute("stoneAtOnece");
	}
	
	int stoneNum;
	if(stoneNums != null){
		stoneNum = Integer.parseInt(stoneNums);
		session.setAttribute("stoneNum",stoneNum);
	}else{
		stoneNum =(int)session.getAttribute("stoneNum");
	}
	
	if(stoneChar != null){
		session.setAttribute("stoneChar",stoneChar);
	}else{
		stoneChar = (String)session.getAttribute("stoneChar");
	}
	
    
    int totalNum;
    char player;
    String stone ="";
    int playerNum;
    if(playerNums != null){
    	playerNum= Integer.parseInt(playerNums) + 64;
    	session.setAttribute("playerNum",playerNum);
    }else{
    	playerNum = (int)session.getAttribute("playerNum");
    }
    
    if (session.getAttribute("totalNum")== null){
    	totalNum = stoneNum;  
    }else{
    	totalNum =(int)session.getAttribute("totalNum");
    }
    
    if (session.getAttribute("player")== null){
    	
    	player = (char)65;
    }else {
    	player=(char)session.getAttribute("player");
    }
    
       	  

      		if (Utility.isNullOrEmpty(nums)== false){
      			
      		int num = Integer.parseInt(nums);
      		totalNum -= num;
      		if(totalNum >0){
      			//表示
      			stone = Utility.getStoneDisplayHtml(totalNum, stoneChar);
      			
      			if(player< playerNum){
      		    	
      		    		player += 1;
      		    }else{
      		    	player = 65;
      		    }
      			
      			
      			session.setAttribute("totalNum",totalNum);
     			 session.setAttribute("player", player);
      		}else { 
      			response.sendRedirect("finish.jsp");
      		}
      	
      		}else{
      			stone =Utility.getStoneDisplayHtml(totalNum, stoneChar);
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
        <input type="number" name="num" min="1" max=<%= stoneAtOnece%>>
        個取る<br> ※1度に<%= stoneAtOnece %>個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>