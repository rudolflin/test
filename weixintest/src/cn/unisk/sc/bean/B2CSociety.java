package cn.unisk.sc.bean;
//B2C社会电子渠道用户发展日报
public class B2CSociety extends BaseBean{
	private double   devD ;//当日发展
	private double    devMT;//当月累计发展
	private double    ratioMC;//月环比
	private double    lackGoal;//目标缺口
	private double    ratioFM;//当月完成率
	public double getDevD() {
		return devD;
	}
	public void setDevD(double devD) {
		this.devD = devD;
	}
	public double getDevMT() {
		return devMT;
	}
	public void setDevMT(double devMT) {
		this.devMT = devMT;
	}
	public double getRatioMC() {
		return ratioMC;
	}
	public void setRatioMC(double ratioMC) {
		this.ratioMC = ratioMC;
	}
	public double getLackGoal() {
		return lackGoal;
	}
	public void setLackGoal(double lackGoal) {
		this.lackGoal = lackGoal;
	}
	public double getRatioFM() {
		return ratioFM;
	}
	public void setRatioFM(double ratioFM) {
		this.ratioFM = ratioFM;
	}
	
	
	

}
