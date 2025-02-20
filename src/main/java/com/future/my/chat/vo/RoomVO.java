package com.future.my.chat.vo;

public class RoomVO {
	
	private int roomNo;
	private String roomName;
	private String memId;
	private String memNm;
	private String regDate;
	
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "RoomVO [roomNo=" + roomNo + ", roomName=" + roomName + ", memId=" + memId + ", memNm=" + memNm
				+ ", regDate=" + regDate + "]";
	}
}
