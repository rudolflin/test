/*package quartz;

import java.io.File;
import java.io.FileFilter;

public class FileExtensionFileFilter implements FileFilter {
	 
    private String extension;   //�ļ���׺
 
    public FileExtensionFileFilter(String extension) {
        this.extension = extension;
    }
 
    @Override
    public boolean accept(File pathname) {//ֻ����ָ����׺���ļ�
 
        //���file�Ǹ�Ŀ¼
        if(pathname.isDirectory()) return false;
 
        // Lowercase the filename for easier comparison
        String LCaseFilename = pathname.getName().toLowerCase();    //�ļ���ת��ΪСд
 
        return (pathname.isFile() && (LCaseFilename.indexOf(extension) > 0));
    }
}*/