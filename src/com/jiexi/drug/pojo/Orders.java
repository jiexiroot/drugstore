package com.jiexi.drug.pojo;

import java.sql.Timestamp;

/**
 * @author GOU
 * @Date 2020-06-22 0:35
 */
public class Orders {
    private int orderid;
    private int did;
    private int type;
    private int buyAmount;
    private java.sql.Timestamp shopdate;
    private String drugName;
    private String shopName;
    private String approval;
    private int publisherId;
    private String spec;
    private String model;
    private String imgurl;
    private float price;
    private int stockAmount;
    private String Name;

    public Orders() {
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getBuyAmount() {
        return buyAmount;
    }

    public void setBuyAmount(int buyAmount) {
        this.buyAmount = buyAmount;
    }

    public Timestamp getShopdate() {
        return shopdate;
    }

    public void setShopdate(Timestamp shopdate) {
        this.shopdate = shopdate;
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

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStockAmount() {
        return stockAmount;
    }

    public void setStockAmount(int stockAmount) {
        this.stockAmount = stockAmount;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderid=" + orderid +
                ", did=" + did +
                ", type=" + type +
                ", buyAmount=" + buyAmount +
                ", shopdate=" + shopdate +
                ", drugName='" + drugName + '\'' +
                ", shopName='" + shopName + '\'' +
                ", approval='" + approval + '\'' +
                ", publisherId=" + publisherId +
                ", spec='" + spec + '\'' +
                ", model='" + model + '\'' +
                ", imgurl='" + imgurl + '\'' +
                ", price=" + price +
                ", stockAmount=" + stockAmount +
                ", Name='" + Name + '\'' +
                '}';
    }

    public Orders(int orderid, int did, int type, int buyAmount, Timestamp shopdate, String drugName, String shopName, String approval, int publisherId, String spec, String model, String imgurl, float price, int stockAmount, String name) {
        this.orderid = orderid;
        this.did = did;
        this.type = type;
        this.buyAmount = buyAmount;
        this.shopdate = shopdate;
        this.drugName = drugName;
        this.shopName = shopName;
        this.approval = approval;
        this.publisherId = publisherId;
        this.spec = spec;
        this.model = model;
        this.imgurl = imgurl;
        this.price = price;
        this.stockAmount = stockAmount;
        Name = name;
    }
}
