package gobang.player;

public class AiPlayer extends Player {
    String username;
    String password;
    boolean isReady = false;
    boolean myTurn = false;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setReady(boolean ready) {
        isReady = ready;
    }

    public void setMyTurn(boolean myTurn) {
        this.myTurn = myTurn;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public boolean isReady() {
        return isReady;
    }

    public boolean isMyTurn() {
        return myTurn;
    }

    public int[] getAIDropPoint(boolean wins[][][], int myWin[], int computerWin[], int chessBoard[][], int count) {
        int[][] myScore = new int[15][15];
        int[][] computerScore = new int[15][15];
        int max = 0;
        int u = 0, v = 0;
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 15; j++) {
                myScore[i][j] = 0;
                computerScore[i][j] = 0;
            }
        }
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 15; j++) {
                if (chessBoard[i][j] == 0) {
                    for (int k = 0; k < count; k++) {
                        if (wins[i][j][k]) {
                            if (myWin[k] == 1) {
                                myScore[i][j] += 200;
                            } else if (myWin[k] == 2) {
                                myScore[i][j] += 400;
                            } else if (myWin[k] == 3) {
                                myScore[i][j] += 2000;
                            } else if (myWin[k] == 4) {
                                myScore[i][j] += 10000;
                            }
                            if (computerWin[k] == 1) {
                                computerScore[i][j] += 220;
                            } else if (computerWin[k] == 2) {
                                computerScore[i][j] += 420;
                            } else if (computerWin[k] == 3) {
                                computerScore[i][j] += 2100;
                            } else if (computerWin[k] == 4) {
                                computerScore[i][j] += 20000;
                            }
                        }
                    }
                    if (myScore[i][j] > max) {
                        max = myScore[i][j];
                        u = i;
                        v = j;
                    } else if (myScore[i][j] == max) {
                        if (computerScore[i][j] > computerScore[u][v]) {
                            u = i;
                            v = j;
                        }
                    }
                    if (computerScore[i][j] > max) {
                        max = computerScore[i][j];
                        u = i;
                        v = j;
                    } else if (computerScore[i][j] == max) {
                        if (myScore[i][j] > myScore[u][v]) {
                            u = i;
                            v = j;
                        }
                    }
                }
            }
        }
        int[] re = {u,v};
        return re;
    }
}