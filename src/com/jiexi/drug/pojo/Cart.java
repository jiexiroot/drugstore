package com.jiexi.drug.pojo;

import java.util.List;

public class Cart {

    private long cartid;
    private long did;
    private long uid;
    private long cartAmount;
    private String drugName;
    private String shopName;
    private String approval;
    private long publisherId;
    private String spec;
    private String model;
    private String imgurl;
    private double price;
    private long amount;
    private String name;



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

    public Cart(long cartid, long did, long uid, long cartAmount, String drugName, String shopName, String approval, long publisherId, String spec, String model, String imgurl, double price, long amount, String name) {
        this.cartid = cartid;
        this.did = did;
        this.uid = uid;
        this.cartAmount = cartAmount;
        this.drugName = drugName;
        this.shopName = shopName;
        this.approval = approval;
        this.publisherId = publisherId;
        this.spec = spec;
        this.model = model;
        this.imgurl = imgurl;
        this.price = price;
        this.amount = amount;
        this.name = name;
    }

    public Cart() {
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartid=" + cartid +
                ", did=" + did +
                ", uid=" + uid +
                ", cartAmount=" + cartAmount +
                ", drugName='" + drugName + '\'' +
                ", shopName='" + shopName + '\'' +
                ", approval='" + approval + '\'' +
                ", publisherId=" + publisherId +
                ", spec='" + spec + '\'' +
                ", model='" + model + '\'' +
                ", imgurl='" + imgurl + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", name='" + name + '\'' +
                '}';
    }

    public long getCartid() {
        return cartid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
