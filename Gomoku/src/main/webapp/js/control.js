var websocket;
var state = document.getElementById("divgst");
var firstbutton = document.getElementById("joinRoom");
var secondbutton = document.getElementById("createRoom");
try {
    websocket = new WebSocket("ws://172.31.76.16:8080/echo");
} catch (err) {
    state.innerHTML = "error when open webSocket ";
}

var canvas = document.getElementById('chessBoard');
var ctx = canvas.getContext('2d');
var startGame=false;
//庄家还是玩家
//0:White  1:Black
var nowCol;
//gape and line num
var blkWidth = 40;
var bgCol = '#F8CE9D';
var oldx=-1;
var oldy=-1;
var aiPlayer = false;

function DrawLine(x1, y1, x2, y2, w, color) {
    ctx.beginPath();
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    ctx.lineWidth = w;
    ctx.strokeStyle = color;
    ctx.stroke();
}

function DrawPoint(x, y, r, color) {
    ctx.beginPath();
    ctx.arc(x, y, r, 0, Math.PI * 2, true);
    ctx.fillStyle = color;
    ctx.fill();
}

function Initialize() {
    // clear px on canvas
    ctx.clearRect(0, 0, 640, 640);
    oldx=-1;//没有上一颗棋子
    oldy=-1;
    // draw line
    for (var i = 1; i <= 15; i++) {
        DrawLine(blkWidth, blkWidth * i, blkWidth * 15, blkWidth * i, 2, "black");
        DrawLine(blkWidth * i, blkWidth, blkWidth * i, blkWidth * 15, 2, "black");
    }
    // center point
    DrawPoint(blkWidth * 4, blkWidth * 4, 6, "black");
    DrawPoint(blkWidth * 12, blkWidth * 4, 6, "black");
    DrawPoint(blkWidth * 8, blkWidth * 8, 6, "black");
    DrawPoint(blkWidth * 4, blkWidth * 12, 6, "black");
    DrawPoint(blkWidth * 12, blkWidth * 12, 6, "black");
}

// get mouse x y
function getLocation(x, y) {
    var bbox = canvas.getBoundingClientRect();
    return {
        x: (x - bbox.left) * (canvas.width / bbox.width),
        y: (y - bbox.top) * (canvas.height / bbox.height)
    };
}

function Inside(x, y) {
    if (x < 1 || x > 15) return false;
    if (y < 1 || y > 15) return false;
    return true;
}


function getBlk(loc) {//获取鼠标
    var x, y, nx, ny;
    x = loc.x - 20;
    y = loc.y - 20;
    nx = Math.ceil(x / blkWidth);//向上取整
    ny = Math.ceil(y / blkWidth);
    return {x: nx, y: ny};
}


//col: 0-White 1-Black
//type: 0-Old 1-New
function DrawPiece(x, y, col, type) {
    var img;
    if (col == 0 && type == 0) img = document.getElementById('white');
    else if (col == 0 && type == 1) img = document.getElementById('white-n');
    else if (col == 1 && type == 0) img = document.getElementById('black');
    else if (col == 1 && type == 1) img = document.getElementById('black-n');
    ctx.drawImage(img, blkWidth * x - 18, blkWidth * y - 18);
}

$("#msg").keydown(function(e){//enter
    if(e.keyCode==13){
        $("#btnSend").click();
    }
});

canvas.onclick = function (e) {
    var location = getLocation(e.clientX, e.clientY);
    var nowP = getBlk(location);
    if (Inside(nowP.x, nowP.y) && startGame==true){
        if(aiPlayer==false){
            websocket.send("1s"+nowP.x+"s"+nowP.y);
        }else {
            websocket.send("7s"+nowP.x+"s"+nowP.y);
        }
    }else if(startGame==false){
        state.innerHTML="游戏未开始";
    }else if(Inside(nowP.x, nowP.y)==false){
        state.innerHTML="不能在此处落子";
    }
}

websocket.onopen = function (evnt) {
};

$("#btnSend").bind("click", function () {//聊天发送
    var text = $("#msg").val();
    if(""==text){
        state.innerHTML="不能发送空信息";
        return;
    }
    $("#msg").val("");
    websocket.send("8"+text);
});

$("#joinRoom").bind("click", function () {//加入房间功能
    if ($("#joinRoom").html() == "加入房间") {
        if ($("#roomId").html() == "未进入房间") {
            websocket.send("j" + $("#roomNumber").val());//加入房间指令
        }
        else {
            state.innerHTML = "你已经加入房间，不能加入其他房间";
        }
    } else if ($("#joinRoom").html() == "准备") {
        websocket.send("3");
        firstbutton.innerHTML="取消准备";
        state.innerHTML="已准备";
    }else if ($("#joinRoom").html() == "取消准备") {
        websocket.send("4");
        firstbutton.innerHTML="准备";
        state.innerHTML="请准备";
    }else if ($("#joinRoom").html() == "开始游戏") {
        websocket.send("0");
    }else if ($("#joinRoom").html() == "认输") {
        var mes = confirm("确定认输吗？");
        if(mes==true){
            if(aiPlayer==false){
                websocket.send("5");
            }else {
                websocket.send("9");
            }
        }
    }else if ($("#joinRoom").html() == "人机对弈") {
        aiPlayer=true;
        console.log("6"+$("#roomId").html())
        websocket.send("6"+$("#roomId").html());
    }

});

$("#createRoom").bind("click", function () {//创建房间功能
    if ($("#createRoom").html() == "随机创建房间") {
        console.log("createRoom");
        if ($("#roomId").html() == "未进入房间") {
            websocket.send("c");//创建房间指令
        }
        else {
            state.innerHTML = "你已经加入房间，不能创建其他房间";
        }
    }else if ($("#createRoom").html() == "退出房间") {
        if (startGame==true) {
           var mes = window.confirm("你正在游戏中，确定退出房间吗?");
           if(mes==true){
               window.location.reload();
           }
        }
        else {
            window.location.reload();
        }
    }

});

$(function () {
    websocket.onopen = function (evnt) {
    };
    websocket.onmessage = function (evnt) {
        var data = evnt.data;
        data = htmlEncodeJQ(data);
        console.log(data);
        if (data[0] == "o") {
            //用于判断在线人数
            $("#online").html(data.slice(1));//解析服务器在线人数
        } else if (data[0] == "3") {
            $("#roomPerson").html(data.slice(1));//解析房间在线人数
        }
        else if (data[0] == "d") {
            nowCol=0;//庄家
        }
        else if (data[0] == "p") {
            nowCol=1;//玩家
        }
        else if (data[0] == "m") {
            state.innerHTML = data.slice(1);//message
        }else if (data[0] == "e") {
            Initialize();
            startGame=true;
            firstbutton.innerHTML="认输";
            secondbutton.style.visibility="hidden";
        }else if (data[0] == "h") {
            var text = $("#chattext").val();
            console.log(text);
            var msg = data.slice(1);
            if(nowCol==0){
                if(msg[0]=="1"){
                    var str = '<div class="answer">';
                    str += '<div class="heard_img left"><img src="images/black.png"></div>';
                    str += '<div class="answer_text"><p>' + msg.slice(1) + '</p><i></i>';
                    str += '</div></div>';
                    $("#chattext").append(str);
                }if(msg[0]=="0"){
                    var str = '<div class="question">';
                    str += '<div class="heard_img right"><img src="images/white.png"></div>';
                    str += '<div class="question_text"><p>' + msg.slice(1) + '</p><i></i>';
                    str += '</div></div>';
                    $("#chattext").append(str);
                }
            }
            else if(nowCol==1){
                if(msg[0]=="1"){
                    var str = '<div class="answer">';
                    str += '<div class="heard_img left"><img src="images/white.png"></div>';
                    str += '<div class="answer_text"><p>' + msg.slice(1) + '</p><i></i>';
                    str += '</div></div>';
                    $("#chattext").append(str);
                }if(msg[0]=="0"){
                    var str = '<div class="question">';
                    str += '<div class="heard_img right"><img src="images/black.png"></div>';
                    str += '<div class="question_text"><p>' + msg.slice(1) + '</p><i></i>';
                    str += '</div></div>';
                    $("#chattext").append(str);
                }
            }
            var scolldiv = document.getElementById("scolldiv");//自动下拉
            scolldiv.scrollTop = scolldiv.scrollHeight;
        }
        else if (data[0] == "0") {//游戏中的判定
            firstbutton.innerHTML = "开始游戏";
            firstbutton.style.visibility="visible";
            state.innerHTML = data.slice(1);
        } else if (data[0] == "7") {
            firstbutton.style.visibility = "visible";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility = "visible";
            firstbutton.innerHTML = "准备";
            state.innerHTML = data.slice(1);
            document.getElementById("roomNumber").innerHTML="";
            document.getElementById("divchatboard").style.visibility="visible";
            state.innerHTML = data.slice(1);
        }else if (data[0] == "u") {
            firstbutton.style.visibility = "visible";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility = "visible";
            firstbutton.innerHTML = "准备";
            state.innerHTML = data.slice(1);
            document.getElementById("roomNumber").innerHTML="";
            document.getElementById("divchatboard").style.visibility="visible";
            state.innerHTML = data.slice(1);
        } else if (data[0] == "2") {
            state.innerHTML = data.slice(1);
            // secondbutton.style.visibility = "hidden";
            firstbutton.style.visibility="visible";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility="visible";
            firstbutton.innerHTML = "人机对弈";
        } else if (data[0] == "r") {
            $("#roomId").html(data.slice(1));
        } else if (data[0] == "0") {
            state.innerHTML = data.slice(1);
            firstbutton.style.visibility = "visible";
            firstbutton.innerHTML = "开始游戏";
        } else if (data[0] == "1") {
            state.innerHTML = data.slice(1);
            firstbutton.style.visibility = "hidden";
        } else if (data[0] == "8") {
            state.innerHTML = data.slice(1);
        } else if (data[0] == "9") {
            if(startGame==true){
                state.innerHTML = "对方退出房间，你赢了";
                //window.alert(data.slice(1));
                startGame=false;
            }else {
                state.innerHTML = "对方退出房间";
            }
            document.getElementById("divchatboard").style.visibility="hidden";
            firstbutton.style.visibility="visible";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility="visible";
            firstbutton.innerHTML = "人机对弈";
        } else if (data[0] == "6") {
            state.innerHTML = data.slice(1);
            //window.alert(data.slice(1));
            startGame=false;
            aiPlayer=false;
            firstbutton.innerHTML="准备";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility="visible";
        }else if (data[0] == "y") {
            state.innerHTML = data.slice(1);
            //window.alert(data.slice(1));
            startGame=false;
            aiPlayer=false;
            firstbutton.innerHTML="人机对弈";
            secondbutton.innerHTML="退出房间";
            secondbutton.style.visibility="visible";
        }else if (data[0] == "q") {
            if(startGame==true){
                state.innerHTML = data.slice(1);
                //window.alert(data.slice(1));
                startGame=false;
                firstbutton.innerHTML="准备";
                secondbutton.innerHTML="退出房间";
                firstbutton.style.visibility="visible";
                secondbutton.style.visibility="visible";
            }
        } else if (data[0] == "5") {
            state.innerHTML = data.slice(1);
        }else if (data[0] == "c") {//庄家落子
            var point= data.split("s");
            var x = parseInt(point[1],10);
            var y = parseInt(point[2],10);
            console.log(x);
            console.log(y);
            if(oldx!=-1){
                DrawPiece(oldx, oldy, 1, 0);
            }
            DrawPiece(x, y, 0, 1);
            oldx=x;
            oldy=y;
        }else if (data[0] == "f") {//玩家落子
            var point= data.split("s");
            var x = parseInt(point[1],10);
            var y = parseInt(point[2],10);
            console.log(x);
            console.log(y);
            if(oldx!=-1){
                DrawPiece(oldx, oldy, 0, 0);
            }
            DrawPiece(x, y, 1, 1);
            oldx=x;
            oldy=y;
        }

    };
    websocket.onerror = function (evnt) {
    };
    websocket.onclose = function (evnt) {
    };
});

function htmlEncodeJQ ( str ) {
    return $('<span/>').text( str ).html();
}


function htmlDecodeJQ ( str ) {
    return $('<span/>').html( str ).text();
}
