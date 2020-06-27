package com.jiexi.drug.pojo;


import com.jiexi.drug.pojo.Categories;

import java.sql.Timestamp;
import java.util.List;

public class Drugs {

  private long id;
  private String drugName;
  private String shopName;
  private String approval;
  private long publisherId;
  private java.sql.Timestamp publishDate;
  private long categoryId;
  private String spec;
  private String model;
  private String imgurl;
  private double price;
  private long amount;
  private List<Categories> cList;

  @Override
  public String toString() {
    return "Drugs{" +
            "id=" + id +
            ", drugName='" + drugName + '\'' +
            ", shopName='" + shopName + '\'' +
            ", approval='" + approval + '\'' +
            ", publisherId=" + publisherId +
            ", publishDate=" + publishDate +
            ", categoryId=" + categoryId +
            ", spec='" + spec + '\'' +
            ", model='" + model + '\'' +
            ", imgurl='" + imgurl + '\'' +
            ", price=" + price +
            ", amount=" + amount +
            ", cList=" + cList +
            '}';
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getDrugName() {
    return drugName;
  }

  public void setDrugName(String drugName) {
    this.drugName = drugName;
  }

  public String getShopName() {
    return shopName;
  }

  public void setShopName(String shopName) {
    this.shopName = shopName;
  }

  public String getApproval() {
    return approval;
  }

  public void setApproval(String approval) {
    this.approval = approval;
  }

  public long getPublisherId() {
    return publisherId;
  }

  public void setPublisherId(long publisherId) {
    this.publisherId = publisherId;
  }

  public Timestamp getPublishDate() {
    return publishDate;
  }

  public void setPublishDate(Timestamp publishDate) {
    this.publishDate = publishDate;
  }

  public long getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(long categoryId) {
    this.categoryId = categoryId;
  }

  public String getSpec() {
    return spec;
  }

  public void setSpec(String spec) {
    this.spec = spec;
  }

  public String getModel() {
    return model;
  }

  public void setModel(String model) {
    this.model = model;
  }

  public String getImgurl() {
    return imgurl;
  }

  public void setImgurl(String imgurl) {
    this.imgurl = imgurl;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public long getAmount() {
    return amount;
  }

  public void setAmount(long amount) {
    this.amount = amount;
  }

  public List<Categories> getcList() {
    return cList;
  }

  public void setcList(List<Categories> cList) {
    this.cList = cList;
  }

  public Drugs() {
  }

  public Drugs(long id, String drugName, String shopName, String approval, long publisherId, Timestamp publishDate, long categoryId, String spec, String model, String imgurl, double price, long amount, List<Categories> cList) {
    this.id = id;
    this.drugName = drugName;
    this.shopName = shopName;
    this.approval = approval;
    this.publisherId = publisherId;
    this.publishDate = publishDate;
    this.categoryId = categoryId;
    this.spec = spec;
    this.model = model;
    this.imgurl = imgurl;
    this.price = price;
    this.amount = amount;
    this.cList = cList;
  }
}
