package com.spring.footprint.domain;

public class ExchangeRate {
   private String country;		//����
   private double exchange;		//ȯ����
   private String wDate;		//��¥		w_date
   private String unit;			//ȭ�����
   
   public String getCountry() {
      return country;
   }
   public void setCountry(String country) {
      this.country = country;
   }
   public double getExchange() {
      return exchange;
   }
   public void setExchange(double exchange) {
      this.exchange = exchange;
   }
   public String getwDate() {
      return wDate;
   }
   public void setwDate(String wDate) {
      this.wDate = wDate;
   }
   public String getUnit() {
      return unit;
   }
   public void setUnit(String unit) {
      this.unit = unit;
   }
   
   public ExchangeRate(String country, double exchange, String wDate, String unit) {
      this.country = country;
      this.exchange = exchange;
      this.wDate = wDate;
      this.unit = unit;
   }
   
   public ExchangeRate(String country, double exchange, String unit) {
      this.country = country;
      this.exchange = exchange;
      this.unit = unit;
   }
   
   public ExchangeRate() {}
   
   @Override
   public String toString() {
      return "ExchangeRate [country=" + country + ", exchange=" + exchange + ", wDate=" + wDate + ", unit=" + unit+ "]";
   }
 
}