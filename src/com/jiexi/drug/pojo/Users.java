package com.jiexi.drug.pojo;


import java.sql.Timestamp;

public class Users {

  private long id;
  private String username;
  private String password;
  private String nickName;
  private String address;
  private String telphone;
  private long userRoleId;
  private long stateId;
  private java.sql.Timestamp addtime;

  public long getStateId() {
    return stateId;
  }

  public void setStateId(long stateId) {
    this.stateId = stateId;
  }

  @Override
  public String toString() {
    return "Users{" +
            "id=" + id +
            ", username='" + username + '\'' +
            ", password='" + password + '\'' +
            ", nickName='" + nickName + '\'' +
            ", address='" + address + '\'' +
            ", telphone='" + telphone + '\'' +
            ", userRoleId=" + userRoleId +
            ", stateId=" + stateId +
            ", addtime=" + addtime +
            '}';
  }

  public Timestamp getAddtime() {
    return addtime;
  }

  public void setAddtime(Timestamp addtime) {
    this.addtime = addtime;
  }

  public Users(String username, String password, String nickName, String address, String telphone) {
    this.username = username;
    this.password = password;
    this.nickName = nickName;
    this.address = address;
    this.telphone = telphone;
  }

  public Users(long id, String username, String password, String nickName, String address, String telphone, long userRoleId, long stateId, Timestamp addtime) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.nickName = nickName;
    this.address = address;
    this.telphone = telphone;
    this.userRoleId = userRoleId;
    this.stateId = stateId;
    this.addtime = addtime;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getTelphone() {
    return telphone;
  }

  public void setTelphone(String telphone) {
    this.telphone = telphone;
  }


  public long getUserRoleId() {
    return userRoleId;
  }

  public void setUserRoleId(long userRoleId) {
    this.userRoleId = userRoleId;
  }

  public Users(long id, String username, String password, String nickName, String address, String telphone, long userRoleId, long stateId) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.nickName = nickName;
    this.address = address;
    this.telphone = telphone;
    this.userRoleId = userRoleId;
    this.stateId = stateId;
  }

  public Users() {
  }


}
