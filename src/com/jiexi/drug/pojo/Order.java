package com.jiexi.drug.pojo;


import java.sql.Timestamp;

public class Order {

  private long orderid;
  private long uid;
  private long amount;
  private long type;
  private java.sql.Timestamp shopdate;
  private long did;
  private long cid;

  @Override
  public String toString() {
    return "Order{" +
            "orderid=" + orderid +
            ", uid=" + uid +
            ", amount=" + amount +
            ", type=" + type +
            ", shopdate=" + shopdate +
            ", did=" + did +
            ", cid=" + cid +
            '}';
  }

  public Order() {
  }

  public Order(long uid, long amount, long type, long did, long cid) {
    this.uid = uid;
    this.amount = amount;
    this.type = type;
    this.did = did;
    this.cid = cid;
  }

  public Order(long orderid, long uid, long amount, long type, Timestamp shopdate, long did, long cid) {
    this.orderid = orderid;
    this.uid = uid;
    this.amount = amount;
    this.type = type;
    this.shopdate = shopdate;
    this.did = did;
    this.cid = cid;
  }

  public long getOrderid() {
    return orderid;
  }

  public void setOrderid(long orderid) {
    this.orderid = orderid;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }


  public long getAmount() {
    return amount;
  }

  public void setAmount(long amount) {
    this.amount = amount;
  }


  public long getType() {
    return type;
  }

  public void setType(long type) {
    this.type = type;
  }


  public java.sql.Timestamp getShopdate() {
    return shopdate;
  }

  public void setShopdate(java.sql.Timestamp shopdate) {
    this.shopdate = shopdate;
  }


  public long getDid() {
    return did;
  }

  public void setDid(long did) {
    this.did = did;
  }


  public long getCid() {
    return cid;
  }

  public void setCid(long cid) {
    this.cid = cid;
  }

}
