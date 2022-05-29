package com.jj.util;

public class FontUtil {
	//구글 폰트 api https://fonts.google.com/?sort=alpha&subset=korean
	
	//폰트 임포트
	private String fontImport[]= 
			{""//0기본
			,"Black+Han+Sans"//1
			,"Jua"//2
			,"Single+Day"//3
			,"Song+Myung"//4
			,"Do+Hyeon"//5
			,"Cute+Font"//6
			};
	
	//폰트 페밀리 속성
	private String font[]= 
			{""//0기본
			,"'Black Han Sans', sans-serif"//1
			,"'Jua', sans-serif"//2
			,"'Single Day', cursive"//3
			,"'Song Myung', serif"//4
			,"'Do Hyeon', sans-serif"//5
			,"'Cute Font', cursive"//6
			};
	
	//폰트마다 높이가 달라 가운데 유지를 위한 마진값(top)
	private int marginTop[]= 
			{-5//0기본
			,5//1
			,4//2
			,-2//3
			,-1//4
			,2//5
			,-3//6
			};
	
		public String fontImport() {
			String result="";
			result+="@import url('https://fonts.googleapis.com/css2?";
			for(int i=1;i<fontImport.length-1;i++) {
				if(i!=1)
				result+="&";
				result+="family="+fontImport[i];
			}
			result+="&display=swap');";
			return result;
		}
		
		public String getFont(int i) {
			return font[i];
		}
		
		public int getCount() {
			return font.length;
		}
		public double getMarginTop(int i) {
			return marginTop[i];
		}

	
	
}
