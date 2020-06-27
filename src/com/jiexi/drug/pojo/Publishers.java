package com.jiexi.drug.pojo;


import java.util.List;

public class Publishers {

  private long id;
  private String name;
  private List<Cart> cartList;

  @Override
  public String toString() {
    return "Publishers{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", cartList=" + cartList +
            '}';
  }

  public Publishers() {
  }

  public Publishers(long id, String name, List<Cart> cartList) {
    this.id = id;
    this.name = name;
    this.cartList = cartList;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
