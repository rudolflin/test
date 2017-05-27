package quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

public class SendFlowTipQuartzJob implements Job {
 
    private static Logger logger = Logger.getLogger(SendFlowTipQuartzJob.class);
    
    public void execute(JobExecutionContext context) {
        try {
			
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	logger.info("----定时器执行程序------SendFlowTipQuartzJob---start-----currTime:"+formatter.format(new Date()));
//        	FlowService.getInstance().sendFlowTip();
        	System.out.println("程序执行啦");
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
    
    public static void main(String[]args){
//  	  TODO ...
    }
    
    
}