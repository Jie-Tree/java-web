<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>javaweb-五子棋</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/mycss.css">
    <link rel="stylesheet" type="text/css" href="css/chess.css">
    <link rel="stylesheet" type="text/css" href="css/chat.css">
</head>
<body background="images/bg.jpg"
      style="background-repeat: no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<br>
<nav class="navbar navbar-inverse ">
    <div class="container ">
        <!--<div class="navbar-header">-->
            <!--<span class="navbar-brand">-->
                <!--五子棋-->
            <!--</span>-->
        <!--</div>-->
        <div class= navbar-collapse" id="navbar-collapse">
            <!--<ul class="nav navbar-nav navbar-right">-->
                <!--<li>-->
                    <!--<p class="navbar-text">-->
                        <!--房间号：-->
                        <!--<span id="roomId">未进入房间</span>-->
                    <!--</p>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<p class="navbar-text">-->
                        <!--房间人数：-->
                        <!--<span id="roomPerson">0</span>-->
                    <!--</p>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<p class="navbar-text">-->
                        <!--</span> 在线人数： <span-->
                            <!--id="online"></span>-->
                    <!--</p>-->
                <!--</li>-->
            <!--</ul>-->
            <form class="navbar-form" style="font-size: 25px">
                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="请输入房间号/随机加入"
                           id="roomNumber">
                </div>
                <button type="button" class="btn btn-warning " id="joinRoom">加入房间</button>
                <button type="button" class="btn btn-danger " id="createRoom">随机创建房间</button>
                    <audio controls="controls" loop="loop" class="btn" style="width:230px">
                        <source src="music/m2.mp3" type="audio/mpeg">
                        Your browser does not support the audio tag.
                    </audio>
                <span class="btn">
                        房间号：
                        <span id="roomId">未进入房间</span>
                </span>
                <span class="btn">
                        房间人数：
                        <span id="roomPerson">0</span>
                </span>
                <span class="btn">
                         在线人数：
                        <span id="online"></span>
                </span>
            </form>
        </div>
    </div>
</nav>
<br>
<div id="divbg">
    <div id="divchessboard">
        <canvas id="chessBoard" width="640px" height="640px" style="margin: 0px">
            Your browser does not support the HTML5 canvas tag.
        </canvas>
    </div>

    <div id="divinfoboard">
        <div id="divgst" class="panel panel-warning" style="line-height:50px; color: #3b382a;font-size: 20px; text-align: center;">
                请加入房间再进行游戏！
        </div>
        <!--<div id="divchatboard" style="visibility: hidden">-->
        <!--<div id="divchatboard" style="visibility: visible;" contenteditable="true" >-->
            <!--<textarea id="chattext" style="background-image: url(images/chatbg1.jpg);border: 2px cornsilk solid; border-radius: 8px; resize: none; color: black; font-size: 20px" disabled="disabled" readonly="readonly" class="chatBoard panel-warning"><font color=red>C</font><font color=blue>S</font>DN水园 </textarea>-->
            <!--<div class="inputmessage">-->
                <!--<div class="input-group">-->
                    <!--<input class="form-control" type="text" id="msg">-->
                    <!--<span class="input-group-btn">-->
                        <!--<button class="btn btn-default" id="btnSend">发送</button>-->
                        <!--</span>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->

        <div id="divchatboard" style="visibility: hidden;">
            <div id="scolldiv" class="speak_window" style="border: 2px cornsilk solid; border-radius: 8px; resize: none; position: relative; background-image: url(images/chatbg1.jpg);">
                <div class="speak_box" id="chattext">
                    <!--<div class="answer">-->
                        <!--<div class="heard_img left"><img src="images/black.png"></div>-->
                        <!--<div class="answer_text">-->
                            <!--<p>适用浏览器</p>-->
                            <!--<i></i>-->
                        <!--</div>-->
                    <!--</div>-->

                    <!--<div class="question">-->
                        <!--<div class="heard_img right"><img src="images/white.png"></div>-->
                        <!--<div class="question_text"><p>您发送的文字是：</p>-->
                            <!--<i></i>-->
                        <!--</div>-->
                    <!--</div>-->
                </div>
            </div>
            <div class="inputmessage">
                <div class="input-group">
                    <input class="form-control" type="text" id="msg">
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="btnSend">发送</button>
                        </span>
                </div>
            </div>
        </div>


    </div>
    <div style="display:none" width="0" height="0">
        <img src="images/white.png" id="white">
        <img src="images/white-n.png" id="white-n">
        <img src="images/black.png" id="black">
        <img src="images/black-n.png" id="black-n">
    </div>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/control.js"></script>
<script>
    Initialize();
</script>
</body>
</html>
