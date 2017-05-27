package cn.unisk.sc.bean;
//B2C计费收入监控日报
public class B2CMonitor extends BaseBean{
	private double    uCountD   ;  //当日计费用户数
	private double    moneyD     ;  //日计费收入
	private double    uCountM	     ;  //当月计费用户数
	private double     moneyM    ;  //当月计费收入
	private double      uCountMC   ;  //月累计环比 用户数
	private double       moneyMC  ;  // 月累计环比 收入
	public double getuCountD() {
		return uCountD;
	}
	public void setuCountD(double uCountD) {
		this.uCountD = uCountD;
	}
	public double getMoneyD() {
		return moneyD;
	}
	public void setMoneyD(double moneyD) {
		this.moneyD = moneyD;
	}
	public double getuCountM() {
		return uCountM;
	}
	public void setuCountM(double uCountM) {
		this.uCountM = uCountM;
	}
	public double getMoneyM() {
		return moneyM;
	}
	public void setMoneyM(double moneyM) {
		this.moneyM = moneyM;
	}
	public double getuCountMC() {
		return uCountMC;
	}
	public void setuCountMC(double uCountMC) {
		this.uCountMC = uCountMC;
	}
	public double getMoneyMC() {
		return moneyMC;
	}
	public void setMoneyMC(double moneyMC) {
		this.moneyMC = moneyMC;
	}
	

}
