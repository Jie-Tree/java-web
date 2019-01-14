package gobang.core;

import gobang.player.AiPlayer;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;

public class GameRoom {
    public Game game = new Game();
    public String gameNumber;// 房间号
    public int roomOnline = 0;
    public AiPlayer aiPlayer = new AiPlayer();
    private WebSocketSession playerSession;
    private WebSocketSession dealerSession;

    public void setGameNumber(String number, WebSocketSession session) throws IOException, InterruptedException {
        this.gameNumber = number;
        this.roomOnline = 1;
        dealerSession = session;
        session.sendMessage(new TextMessage("d"));
        playerToDealer("31");//房间人数
    }

    public void joinRoom(WebSocketSession session) throws IOException, InterruptedException {
        // 第二个人加入房间，可以开始游戏
        roomOnline++;
        playerSession = session;
        dealerToPlayer("7成功加入房间，请准备");//7玩家进入房间后给双方信息
        playerToDealer("u有玩家加入房间,等待对方做准备");
    }

    public int getRoomOnline() {// 返回房间人数
        return roomOnline;
    }

    public String getGameNumber() {
        return gameNumber;
    }

    public void broadCast(String message) throws IOException, InterruptedException {
        // TODO Auto-generated method stub
        // 房间消息广播
        Thread.sleep(100);
        playerSession.sendMessage(new TextMessage(message));
        dealerSession.sendMessage(new TextMessage(message));
    }

    private void beginGame() throws IOException, InterruptedException {
        // TODO Auto-generated method stub
        game.init();// 游戏初始化
        game.dealer.setMyTurn(true);
        playerToDealer("m你的回合");
        game.player.setMyTurn(false);
        dealerToPlayer("m对方回合");
        broadCast("e");//游戏开始
    }

    public void playerToDealer(String message) throws IOException, InterruptedException {
        // 发送消息给庄家
        Thread.sleep(100);
        try {
            dealerSession.sendMessage(new TextMessage(message));
        }catch (Exception e){
            //e.printStackTrace();
        }
    }

    public void dealerToPlayer(String message) throws IOException, InterruptedException {
        // 发送信息给玩家
        Thread.sleep(100);
        playerSession.sendMessage(new TextMessage(message));
    }

    public void receive(WebSocketSession session, String request) throws IOException, InterruptedException {
        String ll;
        if (session == dealerSession)
            ll = "dealer:";
        else ll = "player:";

        System.out.println(ll + request);
        // TODO Auto-generated method stub
        if (request.startsWith("0")) {//游戏开始
            if (session == dealerSession)
                beginGame();
        } else if (request.startsWith("7")) {//庄家与AI请求落子
            String[] point = request.split("s");//数字以s分割
            int x = Integer.parseInt(point[1]);
            int y = Integer.parseInt(point[2]);
            if (game.dealer.isMyTurn()) {//是否是庄家回合
                if (game.IsDealerCanDropChess(x - 1, y - 1)) {//庄家是否能下子
                    session.sendMessage(new TextMessage("cs" + x + "s" + y));
                    if (game.dealerDropChessAndISWin(x - 1, y - 1)) {//庄家落子是否赢
                        session.sendMessage(new TextMessage("6你赢了，游戏结束"));
                    } else {//AI落子
                        int []poi = aiPlayer.getAIDropPoint(game.wins, game.dealerWinArray, game.playerWinArray, game.chessBoard, game.winsCount);
                        session.sendMessage(new TextMessage("fs"+(poi[0]+1)+"s"+(poi[1]+1)));
                        if(game.playerDropChessAndISWin(poi[0], poi[1])){
                            session.sendMessage(new TextMessage("y你输了，游戏结束"));
                        }else {
                            session.sendMessage(new TextMessage("m你的回合"));
                        }
                    }
                } else {
                    session.sendMessage(new TextMessage("m不能在这个位置落子"));
                }
            } else {
                playerToDealer("5不是你的回合");//不是庄家回合
            }

        } else if (request.startsWith("1")) {//请求落子
            String[] point = request.split("s");//数字以s分割
            int x = Integer.parseInt(point[1]);
            int y = Integer.parseInt(point[2]);
            if (session == dealerSession) {
                if (game.dealer.isMyTurn()) {
                    if (game.IsDealerCanDropChess(x - 1, y - 1)) {
                        broadCast("cs" + x + "s" + y);
                        if (game.dealerDropChessAndISWin(x - 1, y - 1)) {
                            dealerToPlayer("6你输了，游戏结束");//游戏结束
                            playerToDealer("6你赢了，游戏结束");
                        } else {
                            playerToDealer("m对方回合");
                            dealerToPlayer("m你的回合");
                        }
                    } else {
                        playerToDealer("m不能在这个位置落子");
                    }
                } else {
                    playerToDealer("5不是你的回合");//不是庄家回合
                }
            }
            if (session == playerSession) {
                if (game.player.isMyTurn()) {
                    if (game.IsPlayerCanDropChess(x - 1, y - 1)) {
                        broadCast("fs" + x + "s" + y);
                        if (game.playerDropChessAndISWin(x - 1, y - 1)) {
                            dealerToPlayer("6你赢了，游戏结束");//游戏结束
                            playerToDealer("6你输了，游戏结束");
                        } else {
                            playerToDealer("m你的回合");
                            dealerToPlayer("m对方回合");
                        }
                    } else {
                        dealerToPlayer("m不能在这个位置落子");
                    }
                } else {
                    dealerToPlayer("5不是你的回合");//不是玩家回合
                }
            }
        } else if (request.startsWith("3")) {//进行准备
            if (session == playerSession) {
                playerToDealer("0玩家已经准备，可以开始游戏");
            }
        } else if (request.startsWith("4")) {//取消准备
            if (session == playerSession) {
                playerToDealer("1玩家取消准备");
            }
        } else if (request.startsWith("5")) {//认输
            if (session == dealerSession) {
                dealerToPlayer("q对方认输，你赢了，游戏结束");//游戏结束
                playerToDealer("q你输了，游戏结束");
            } else if (session == playerSession) {
                playerToDealer("q对方认输，你赢了，游戏结束");//游戏结束
                dealerToPlayer("q你输了，游戏结束");
            }
        }else if (request.startsWith("9")) {//与ai认输
                session.sendMessage(new TextMessage("y你输了，游戏结束"));
        } else if (request.startsWith("8")) {//聊天
            String msg = request.substring(1);
            if (session == dealerSession) {
                playerToDealer("h0" + msg);
                dealerToPlayer("h1" + msg);
            } else if (session == playerSession) {
                dealerToPlayer("h0" + msg);
                playerToDealer("h1" + msg);
            }
//            if (session == dealerSession) {
//                playerToDealer("h我：" + msg + "\r\n");
//                dealerToPlayer("h对方：" + msg + "\r\n");
//            } else if (session == playerSession) {
//                dealerToPlayer("h我：" + msg + "\r\n");
//                playerToDealer("h对方：" + msg + "\r\n");
//            }
        }
    }

    public void removeSession(WebSocketSession session) throws IOException, InterruptedException {
        // TODO Auto-generated method stub
        //移除异常的session
        roomOnline--;
        if (session == dealerSession)
            dealerSession = playerSession;
        playerSession = null;
        playerToDealer("9");//中途异常退出模块
        playerToDealer("31");
    }
}
