package cn.unisk.sc.bean;
//2I2C业务用户累计转化率日报
public class I2Conver extends BaseBean{
	private double  totalCon;//累计转化率
	private double  ratioCD;//转化率日环比
	private double  lackGoal;//与目标值差距
	public double getTotalCon() {
		return totalCon;
	}
	public void setTotalCon(double totalCon) {
		this.totalCon = totalCon;
	}
	public double getRatioCD() {
		return ratioCD;
	}
	public void setRatioCD(double ratioCD) {
		this.ratioCD = ratioCD;
	}
	public double getLackGoal() {
		return lackGoal;
	}
	public void setLackGoal(double lackGoal) {
		this.lackGoal = lackGoal;
	}
	
}
