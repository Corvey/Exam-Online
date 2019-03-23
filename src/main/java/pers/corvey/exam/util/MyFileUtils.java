package pers.corvey.exam.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import pers.corvey.exam.exception.FileNotPermitException;

public class MyFileUtils {

	private static final String UPLOAD_FILE_PATH = "E://uploadFile";
	private static final String DATE_FORMAT = "YYYY-MM-dd";
	private static final String[] PERMIT_FILENAME_EXTENSION = {
			".txt", ".doc", ".docx", ".xls", "xlsx", ".pdf"
	};
	
	public static File saveFile(MultipartFile file) throws IOException, 
		FileNotPermitException {
		
		String filenameExtension = getFilenameExtension(file.getOriginalFilename());
		if (!isPermit(filenameExtension)) {
			throw new FileNotPermitException("服务器不允许上传类型为'" 
					+ filenameExtension + "'的文件");
		}
		String dateStr = getYearMonthDayString();
		File dir = new File(UPLOAD_FILE_PATH, dateStr);
		String fileName = createFileName();
		File dest = new File(dir, fileName + filenameExtension);
		org.apache.commons.io.FileUtils
			.copyInputStreamToFile(file.getInputStream(), dest);
		return dest;
	}
	
	public static boolean isPermit(String filename) {
		String filenameExtension = getFilenameExtension(filename);
		for (String permitExtension : PERMIT_FILENAME_EXTENSION) {
			if (permitExtension.equals(filenameExtension)) {
				return true;
			}
		}
		return false;
	}
	
	private static String createFileName() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	// XXX 无扩展名时未处理
	private static String getFilenameExtension(String filename) {
		int index = filename.lastIndexOf(".");
		return filename.substring(index);
	}
	
	private static String getYearMonthDayString() {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		return sdf.format(new Date());
	}
}
