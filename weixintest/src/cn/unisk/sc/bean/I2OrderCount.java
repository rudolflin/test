package cn.unisk.sc.bean;
//2I2C订单规模日报
public class I2OrderCount extends BaseBean{
	private Double orderD; //当日订单数
	private Double orderM; //月累计订单数
	private Double orderDC; //日订单数环比
	private Double orderDM; //当月累计订单月环比
//	private String rank; //排名
//	private String city; //城市
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
	public Double getOrderDC() {
		return orderDC;
	}
	public void setOrderDC(Double orderDC) {
		this.orderDC = orderDC;
	}
	public Double getOrderDM() {
		return orderDM;
	}
	public void setOrderDM(Double orderDM) {
		this.orderDM = orderDM;
	}
	/*public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}*/
	
}
