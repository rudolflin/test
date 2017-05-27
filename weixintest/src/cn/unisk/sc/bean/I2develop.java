package cn.unisk.sc.bean;
//2I2C用户有效发展日报
public class I2develop extends BaseBean{
	 private Double orderD; //当日有效发展量
	 private Double orderM; //当月累计有效发展量
	 private double ratioCM;//月环比
	 private double  lackM;//当月缺口
	 private double ratioFM;//当月缺口
	 private double ritioGoal;//当月挑战目标完成率
	public Double getOrderD() {
		return orderD;
	}
	public void setOrderD(Double orderD) {
		this.orderD = orderD;
	}
	public Double getOrderM() {
		return orderM;
	}
	public void setOrderM(Double orderM) {
		this.orderM = orderM;
	}
	public double getRatioCM() {
		return ratioCM;
	}
	public void setRatioCM(double ratioCM) {
		this.ratioCM = ratioCM;
	}
	public double getLackM() {
		return lackM;
	}
	public void setLackM(double lackM) {
		this.lackM = lackM;
	}
	public double getRatioFM() {
		return ratioFM;
	}
	public void setRatioFM(double ratioFM) {
		this.ratioFM = ratioFM;
	}
	public double getRitioGoal() {
		return ritioGoal;
	}
	public void setRitioGoal(double ritioGoal) {
		this.ritioGoal = ritioGoal;
	}
	 
	
	
	
	
	
	

}
