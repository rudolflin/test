package cn.unisk.sc.bean;
//B2C社会电子渠道效能日报
public class B2CSocEfficiency extends BaseBean{
		 private double     ratioOD     ;//当月日均开张率
		 private double     ratioOFD     ;//日均开张完成率
		 private double      numD    ;//当月日均产能
		 private double      ratioNFD   ;//日均产能完成率
		public double getRatioOD() {
			return ratioOD;
		}
		public void setRatioOD(double ratioOD) {
			this.ratioOD = ratioOD;
		}
		public double getRatioOFD() {
			return ratioOFD;
		}
		public void setRatioOFD(double ratioOFD) {
			this.ratioOFD = ratioOFD;
		}
		public double getNumD() {
			return numD;
		}
		public void setNumD(double numD) {
			this.numD = numD;
		}
		public double getRatioNFD() {
			return ratioNFD;
		}
		public void setRatioNFD(double ratioNFD) {
			this.ratioNFD = ratioNFD;
		}
		

}
