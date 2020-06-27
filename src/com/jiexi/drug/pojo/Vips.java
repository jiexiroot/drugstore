package com.jiexi.drug.pojo;

/**
 * @author GOU
 * @Date 2020-06-22 21:14
 */
public class Vips {


    private int uid;
    private int lid;
    private int mid;
    private float points;
    private String levelName;

    public int getUid() {
        return uid;
    }

    @Override
    public String toString() {
        return "Vips{" +
                "uid=" + uid +
                ", lid=" + lid +
                ", mid=" + mid +
                ", points=" + points +
                ", levelName='" + levelName + '\'' +
                '}';
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public float getPoints() {
        return points;
    }

    public void setPoints(float points) {
        this.points = points;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    public Vips() {
    }

    public Vips(int uid, int lid, int mid, float points, String levelName) {
        this.uid = uid;
        this.lid = lid;
        this.mid = mid;
        this.points = points;
        this.levelName = levelName;
    }
}
