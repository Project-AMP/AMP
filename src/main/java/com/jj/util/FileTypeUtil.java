package com.jj.util;

public class FileTypeUtil {

	String img[]= {"jpg","jpeg","gif","png"};
	String video[]= {"mp4","mkv","mp3","webm","ogg"};
	
	public String getFileType(String type) {
		if(type!=null) {
			for(int i=0;i<img.length;i++) {
				if(type.equalsIgnoreCase(img[i]))
				return "img";
			}
			for(int i=0;i<video.length;i++) {
				if(type.equalsIgnoreCase(video[i]))
				return "video";
			}
		
			
		}
		return "";
	}
}
