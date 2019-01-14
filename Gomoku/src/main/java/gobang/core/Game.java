package gobang.core;
import gobang.player.Player;


public class Game {
    private int chessBoardLength = 15;
    public Player dealer = new Player();
    public Player player = new Player();

    public int[][] chessBoard;

    boolean[][][] wins; //赢法数组

    int[] dealerWinArray; //p1赢法统计数组
    int[] playerWinArray; //p2赢法统计数组

    int winsCount; //赢法种数

    public Game(){
        chessBoard = new int[chessBoardLength][chessBoardLength];
        wins = new boolean[chessBoardLength][chessBoardLength][572];
        //横线赢法
        int count = 0;
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 11; j++) {
                for (int k = 0; k < 5; k++) {
                    wins[i][j + k][count] = true;
                }
                count++;
            }
        }
        //竖线赢法
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 11; j++) {
                for (int k = 0; k < 5; k++) {
                    wins[j + k][i][count] = true;
                }
                count++;
            }
        }
        //斜线赢法
        for (int i = 0; i < 11; i++) {
            for (int j = 0; j < 11; j++) {
                for (int k = 0; k < 5; k++) {
                    wins[i + k][j + k][count] = true;
                }
                count++;
            }
        }
        //反斜线赢法
        for (int i = 0; i < 11; i++) {
            for (int j = 14; j > 3; j--) {
                for (int k = 0; k < 5; k++) {
                    wins[i + k][j - k][count] = true;
                }
                count++;
            }
        }

        this.winsCount = count;
        dealerWinArray = new int[winsCount];
        playerWinArray = new int[winsCount];
    }

    public void init() {
        //游戏初始化
        for(int i=0; i<15; i++){
            for(int j=0; j<15; j++){
                chessBoard[i][j]=0;
            }
        }
        for(int i=0; i<winsCount; i++){
            dealerWinArray[i]=0;
            playerWinArray[i]=0;
        }
    }

    //庄家是否能落子
    public boolean IsDealerCanDropChess(int i, int j) {
        if(dealer.isMyTurn() && chessBoard[i][j] == 0) {
            return true;
        }else{
            return false;
        }
    }

    //玩家是否能落子
    public boolean IsPlayerCanDropChess(int i, int j) {
        if(player.isMyTurn() && chessBoard[i][j] == 0) {
            return true;
        }else{
            return false;
        }
    }

    //庄家落子,是否赢
    public boolean dealerDropChessAndISWin(int i, int j) {
        System.out.println("庄家落子："+i+"--"+j);
        dealer.setMyTurn(false);
        player.setMyTurn(true);
        chessBoard[i][j] = 1;
        for (int k = 0; k < winsCount; k++) {
            if (wins[i][j][k]) {
                dealerWinArray[k]++;
                playerWinArray[k] = 6;
                if (dealerWinArray[k] == 5) {
                    return true;
                }
            }
        }
        return false;
    }

    //玩家落子,是否赢
    public boolean playerDropChessAndISWin(int i, int j) {
        System.out.println("玩家落子："+i+"--"+j);
        player.setMyTurn(false);
        dealer.setMyTurn(true);
        chessBoard[i][j] = 2;
        for (int k = 0; k < winsCount; k++) {
            if (wins[i][j][k]) {
                playerWinArray[k]++;
                dealerWinArray[k] = 6;
                if (playerWinArray[k] == 5) {
                    return true;
                }
            }
        }
        return false;
    }

}
