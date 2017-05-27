
package table;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class TestTable {
 BufferedImage image;
 void createImage(String fileLocation) {
  try {
   FileOutputStream fos = new FileOutputStream(fileLocation);
   BufferedOutputStream bos = new BufferedOutputStream(fos);
   JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bos);
   encoder.encode(image);
   bos.close();
  } catch (Exception e) {
   e.printStackTrace();
  }
 }

 public void graphicsGeneration() {
  //实际数据行数+标题+备注
  int totalrow = 6;
  int totalcol = 5;
  int imageWidth = 1024;
  int imageHeight = totalrow*40+20;
  int rowheight = 40;
  int startHeight = 10;
  int startWidth = 10;
  int colwidth = (int)((imageWidth-20)/totalcol);
  
  image = new BufferedImage(imageWidth, imageHeight,BufferedImage.TYPE_INT_RGB);
  Graphics graphics = image.getGraphics();
  
  graphics.setColor(Color.WHITE);
  graphics.fillRect(0,0, imageWidth, imageHeight);
  graphics.setColor(new Color(220,240,240));

  //画横线
  for(int j=0;j<totalrow-1;j++){
   graphics.setColor(Color.black);
   graphics.drawLine(startWidth, startHeight+(j+1)*rowheight, imageWidth-5, startHeight+(j+1)*rowheight);
  }
  //末行
  graphics.setColor(Color.black);
  graphics.drawLine(startWidth, imageHeight-90, imageWidth-5, imageHeight-90);
  
 
  //画竖线
  for(int k=0;k<totalcol;k++){
   graphics.setColor(Color.black);
   graphics.drawLine(startWidth+k*colwidth, startHeight+rowheight, startWidth+k*colwidth, imageHeight-50);
  }
  //末列
  graphics.setColor(Color.black);
  graphics.drawLine(imageWidth-5, startHeight+rowheight,imageWidth-5, imageHeight-50);
  
  //设置字体
  Font font = new Font("华文楷体",Font.BOLD,20);
  graphics.setFont(font);
  
  //写标题
  String title = "标题写在这里";
  graphics.drawString(title, imageWidth/3+startWidth, startHeight+rowheight-10);
  
  font = new Font("华文楷体",Font.BOLD,18);
  graphics.setFont(font);
  
  //写入表头
  String[] headCells = {"编号","名称","年龄","性别","体重"};
  for(int m=0;m<headCells.length;m++){
   graphics.drawString(headCells[m].toString(), startWidth+colwidth*m+5, startHeight+rowheight*2-10);
  }
 
  //设置字体
  font = new Font("华文楷体",Font.PLAIN,16);
  graphics.setFont(font);
  String[][] cellsValue = {{"101","xiaozhang","13","M","55"},
         {"102","xiaowang","14","F","53"},
         {"103","xiaoli","15","M","58"}};
  //写入内容
  for(int n=0;n<cellsValue.length;n++){
   String[] arr = cellsValue[n];
   for(int l=0;l<arr.length;l++){
    graphics.drawString(cellsValue[n][l].toString(), startWidth+colwidth*l+5, startHeight+rowheight*(n+3)-10);
   }
  }
  
  font = new Font("华文楷体",Font.BOLD,18);
  graphics.setFont(font);
  graphics.setColor(Color.RED);
  
  //写备注
  String remark = "备注：备注写在这里。";
  graphics.drawString(remark, startWidth, imageHeight-30);
 
  createImage("D:\\1.jpg");
 }

 public static void main(String[] args) {
  TestTable cg = new TestTable();
  try {
   cg.graphicsGeneration();
  } catch (Exception e) {
   e.printStackTrace();
  }
 }

}