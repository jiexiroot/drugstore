package com.jiexi.drug.pojo;


public class Member {

  private long id;
  private long userId;
  private double points;
  private long levelsId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public double getPoints() {
    return points;
  }

  public void setPoints(double points) {
    this.points = points;
  }


  public long getLevelsId() {
    return levelsId;
  }

  public void setLevelsId(long levelsId) {
    this.levelsId = levelsId;
  }

  public Member(long id, long userId, double points, long levelsId) {
    this.id = id;
    this.userId = userId;
    this.points = points;
    this.levelsId = levelsId;
  }

  public Member() {
  }
}
