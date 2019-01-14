package gobang.rooms;

import gobang.core.GameRoom;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

@Service
public class RoomHandler {
    private HashMap<String, GameRoom> NumberIndexRoom = new HashMap<String, GameRoom>();
    private HashMap<WebSocketSession, String> sessionNumber = new HashMap<WebSocketSession, String>();

    public void creatRoom(WebSocketSession session) throws IOException, InterruptedException {
        // 创建房间
        int number = creatRoomNumber();
        session.sendMessage(new TextMessage("r" + number));
        GameRoom gameRoom = new GameRoom();
        System.out.println(gameRoom);
        gameRoom.setGameNumber(number + "", session);
        NumberIndexRoom.put(number + "", gameRoom);
        sessionNumber.put(session, number + "");
    }

//	public String getAllRoom(){
//		String rooms = "";
//		for(String key:NumberIndexRoom.keySet()){
//			rooms = rooms+NumberIndexRoom.get(key).gameNumber+"s";
//		}
//		System.out.println("rooms:");
//		return rooms;
//	}

    private int creatRoomNumber() {
        // 创建唯一的房间号
        Random random = new Random();
        int nextInt;
        while (true) {
            nextInt = random.nextInt(900000) + 100000;
            if (NumberIndexRoom.get(nextInt) == null) {
                return nextInt;
            }
        }
    }

    public void receiveMessage(WebSocketSession session, String request) throws
            IOException, InterruptedException {
        // TODO Auto-generated method stub
        // 信息接收，判断是对房间操作还是对游戏对局操作
        if (request.startsWith("c")) {// 创建房间请求
            creatRoom(session);
            session.sendMessage(new TextMessage("2成功创建房间"));
        } else if (request.startsWith("6")) {//人机对战请求
            String roomNum = request.substring(1);
            GameRoom room = NumberIndexRoom.get(roomNum);
            if(room.roomOnline==1){
                room.roomOnline = room.roomOnline +1;
            }
            System.out.println("获得房间");
            System.out.println(room.getGameNumber());
            session.sendMessage(new TextMessage("32"));
            session.sendMessage(new TextMessage("m游戏开始,你的回合"));
            session.sendMessage(new TextMessage("e"));
            System.out.println("发送请求");
            room.game.init();// 游戏初始化
            System.out.println("初始化");
            room.game.dealer.setMyTurn(true);
            room.game.player.setMyTurn(false);
        } else if (request.startsWith("j")) {// 加入房间请求
            String roomNum = request.substring(1);
            if ("".equals(roomNum)) {
                boolean flag = false;
                for (String key : NumberIndexRoom.keySet()) {
                    System.out.println("room" + key);
                    GameRoom ranRoom = NumberIndexRoom.get(key);
                    System.out.println("ranRoom" + ranRoom.getGameNumber());
                    System.out.println("ranRoomOnline" + ranRoom.getRoomOnline());
                    if (!(ranRoom.getRoomOnline() >= 2)) {
                        joinRoom(session, ranRoom.getGameNumber());
                        flag = true;
                        break;
                    }
                }
                if (flag == false) {
                    session.sendMessage(new TextMessage("m没有可以进入的房间"));
                }
            } else {
                joinRoom(session, roomNum);
            }
        } else {// 对房间内游戏对局进行请求
            GameRoom gameRoom2 = NumberIndexRoom.get(sessionNumber.get(session));
            gameRoom2.receive(session, request);
        }
    }

    private void joinRoom(WebSocketSession session, String number) throws IOException, InterruptedException {
        // TODO Auto-generated method stub
        // 加入房间
        GameRoom gameRoom = NumberIndexRoom.get(number);
        System.out.println(gameRoom + "房间");
        if (gameRoom == null) {
            session.sendMessage(new TextMessage("8房间不存在"));
        } else {
            if (gameRoom.getRoomOnline() >= 2) {
                session.sendMessage(new TextMessage("8房间人数已满"));
            } else {
                gameRoom.joinRoom(session);
                sessionNumber.put(session, number);
                gameRoom.broadCast("32");//房间人数
                gameRoom.broadCast("r" + number);//房间号码
                session.sendMessage(new TextMessage("p"));
                gameRoom.playerToDealer("d");
            }
        }
    }

    public void error(WebSocketSession session) throws IOException, InterruptedException {
        // TODO Auto-generated method stub
        // session异常
        String number = sessionNumber.get(session);
        if (number == null)// 还未加入房间，不用处理异常
            return;
        GameRoom gameRoom = NumberIndexRoom.get(number);
        if (gameRoom.getRoomOnline() == 1) {
            // 如果房间只有一个人，直接删除房间
            NumberIndexRoom.remove(number);
        } else {
            // 房间两个人，移除异常的session
            gameRoom.removeSession(session);
        }
        //session.sendMessage(new TextMessage("31"));
        sessionNumber.remove(session);// session的房间号移除
    }

}
