package com.mywebapp.utils;

import java.util.Locale;

public class NumberFormat {

    public static String formatCurrency(int value) {

        Locale locale = new Locale("vi", "VN");
        java.text.NumberFormat formatter = java.text.NumberFormat.getCurrencyInstance(locale);

        return formatter.format(value);
    }

    public static void main(String[] args) {
        Locale locale = new Locale("vi", "VN");
        java.text.NumberFormat formatter = java.text.NumberFormat.getCurrencyInstance(locale);
        System.out.println(formatter.format(100000000));
    }
}
