package gobang.player;

/*Player*/
public class Player {

	String username;
	String password;
	boolean isReady = false;
	boolean myTurn = false;
	int playerNum = 0;

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

	public void setPlayerNum(int playerNum) {
		this.playerNum = playerNum;
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

	public int getPlayerNum() {
		return playerNum;
	}
}
