package com.jiexi.drug.util;

/**
 * @author GOU
 * @Date 2020-06-20 21:56
 */
public class StringToInt {

    public static int[] strArrayToIntArray(String[] a){
        int[] b = new int[a.length];
        for (int i = 0; i < a.length; i++) {
            b[i] = Integer.parseInt(a[i]);
        }

        return b;
    }
}
