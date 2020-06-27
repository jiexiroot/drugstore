package com.jiexi.drug.pojo;

public class Carts {

  private long cartid;
  private long did;
  private long uid;
  private long cartAmount;

  public Carts(long did, long uid, long cartAmount) {
    this.did = did;
    this.uid = uid;
    this.cartAmount = cartAmount;
  }

  @Override
  public String toString() {
    return "Carts{" +
            "cartid=" + cartid +
            ", did=" + did +
            ", uid=" + uid +
            ", cartAmount=" + cartAmount +
            '}';
  }

  public Carts() {
  }

  public Carts(long cartid, long did, long uid, long cartAmount) {
    this.cartid = cartid;
    this.did = did;
    this.uid = uid;
    this.cartAmount = cartAmount;
  }

  public long getCartid() {
    return cartid;
  }

  public void setCartid(long cartid) {
    this.cartid = cartid;
  }


  public long getDid() {
    return did;
  }

  public void setDid(long did) {
    this.did = did;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }


  public long getCartAmount() {
    return cartAmount;
  }

  public void setCartAmount(long cartAmount) {
    this.cartAmount = cartAmount;
  }

}
