package com.jj.amp;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jj.dao.AcademyDao;
import com.jj.dao.AcademyStyleDao;
import com.jj.dao.ClassDao;
import com.jj.dao.CouponDao;
import com.jj.util.FileUploadPath;
import com.jj.vo.AcademyStyleVo;
import com.jj.vo.AcademyVo;
import com.jj.vo.ClassVo;
import com.jj.vo.CouponVo;
import com.jj.vo.MessageVo;


@Controller
public class adminController {
	@Autowired
	CouponVo couponVo;
	@Autowired
	CouponDao couponDao;
	@Autowired
	ClassVo classVo;
	@Autowired
	ClassDao classDao;
	@Autowired
	AcademyDao academyDao;
	@Autowired
	AcademyStyleDao academyStyleDao;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		/* 관리자 페이지 */
		
		return "academy/admin/admin";
	}
	@RequestMapping(value = "/rim", method = RequestMethod.GET)
	public String rim(Locale locale, Model model) {
		/* 관리자_강사/수강생 관리 */
		
		return "academy/admin/rim";
	}
	@RequestMapping(value = "/classList", method = RequestMethod.GET)
	public String classList(Locale locale, Model model, int academyidx) {
		/* 관리자_수강 정보 관리 */
		
		// 강의실 목록 조회하기
		List<ClassVo> room_list = classDao.adminRoomList(academyidx);
				
		// 강사 목록 조회하기
		List<ClassVo> teacher_list = classDao.adminTeacherList(academyidx);
				
		/*
		 * for(int i=0; i<room_list.size(); i++) { System.out.println("asdasd >>> " +
		 * teacher_list.get(i)); }
		 */
				
				
		model.addAttribute("room_list", room_list);
		model.addAttribute("teacher_list", teacher_list);
		
		return "academy/admin/classList";
	}

	
	/* 결제관리 */
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)
	public String paymentList(Locale locale, Model model,int academyidx) {
		ArrayList<ClassVo> list=(ArrayList<ClassVo>)classDao.getPaymentList(academyidx);
		
		model.addAttribute("list",list);
		return "academy/admin/paymentList";
	}
	
	
	
	
	/* 쿠폰 관리 */ /* 실제 동작 코트는 쿠폰컨트롤러에 있음 */
	@RequestMapping(value = "/couponList", method = RequestMethod.GET)
	public String couponList(Locale locale, Model model) {
		/* 관리자_쿠폰 관리 */
		
		return "academy/admin/couponList";
	}
	@RequestMapping(value = "/couponList_kit", method = RequestMethod.GET)
	public String couponList_kit(int academyidx,Model model) {
		ArrayList<CouponVo> list=(ArrayList<CouponVo>) couponDao.adminCouponList(academyidx);
		model.addAttribute("list",list);
		return "academy/admin/couponList_kit";
	
	}

	
	
	@RequestMapping(value = "admin_class_list.do")
	public String admin_class_list(Model model, HttpSession session , int academyidx){
		
		int adminidx = (Integer)session.getAttribute("idx");
		System.out.println("academyidx >>!!>>>> " + academyidx);
		System.out.println("adminidx >>!!>>>> " + adminidx);
		
		List<ClassVo> adminClassList = new ArrayList<ClassVo>();
		
		if(-academyidx == adminidx) {
			
			adminClassList = classDao.adminClassList(academyidx);
			model.addAttribute("adminClassList", adminClassList);
			
		}else {
			return "redirect:academyMain?academyidx="+academyidx;
		}
		
		return "academy/admin/admin_classList_kit";
	} // admin_class_list()
	
	
	
	 @RequestMapping(value="admin_class_insert.do") 
	 public void admin_class_insert(Model model, int academyidx,
			 									 String name, 
			 									 String time,
			 									 String s_date,
			 									 String e_date,
			 									 String price,
			 									 String limited,
			 									 String kategori,
			 									 int roomidx,
			 									 int teacheridx) {

		 Map<String, Object> map_class_insert = new HashMap<String, Object>();
		 
		 map_class_insert.put("academyidx", academyidx);
		 map_class_insert.put("name", name);
		 map_class_insert.put("time", time);
		 map_class_insert.put("s_date", s_date);
		 map_class_insert.put("e_date", e_date);
		 map_class_insert.put("price", price);
		 map_class_insert.put("limited", limited);
		 map_class_insert.put("kategori", kategori);
		 map_class_insert.put("roomidx", roomidx);
		 map_class_insert.put("teacheridx", teacheridx);
		 
		 classDao.adminClassInsert(map_class_insert);
		 
	 }
	 
	 
	
	// 관리자 - 수강 폐지
	@RequestMapping(value="academy_admin_class_delete")
	@ResponseBody
	public String academy_admin_class_delete(Model model, String[] class_idx_list, int academyidx) {
		
		for(int i=0; i<class_idx_list.length; i++) {
			System.out.println(class_idx_list[i] + " >>> " + i + "번쨰 값");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("academyidx", academyidx);
		map.put("class_idx_list", class_idx_list);
		
		int result = classDao.deleteclass(map);
		
		if(result > 0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	
	// 관리자 수강관리 수정
		@RequestMapping(value="admin_class_update")
		@ResponseBody
		public String admin_class_update(Model model,
										int classidx,
										String class_name,
										String class_category,
										String class_date_s,
										String class_date_e,
										String class_time_date,
										String class_price,
										String select_room,
										String select_teacher,
										String class_limit) {
			
			Map<String, Object> class_update_map = new HashMap<String, Object>();
			class_update_map.put("classidx", classidx);
			class_update_map.put("class_name", class_name);
			class_update_map.put("class_category", class_category);
			class_update_map.put("class_date_s", class_date_s);
			class_update_map.put("class_date_e", class_date_e);
			class_update_map.put("class_time_date", class_time_date);
			class_update_map.put("class_price", class_price);
			class_update_map.put("select_room", select_room);
			class_update_map.put("select_teacher", select_teacher);
			class_update_map.put("class_limit", class_limit);
			
			int result = classDao.admin_class_update(class_update_map);
			
			if(result >0) {
				return "true";
			}else {
				return "false";
			}
			
		}
	
	
		/* 플랫폼 관리 */
		@RequestMapping(value = "/admin_platform", method = RequestMethod.GET)
		public String admin_platform(Locale locale, Model model,int academyidx) {
			/* 관리자_플랫폼 관리 */
			model.addAttribute("academyName",academyDao.selectName(academyidx));
			model.addAttribute("banner_style",academyStyleDao.select_banner(academyidx));
			return "academy/admin/admin_platform";
		}
		
		
		
		@RequestMapping(value = "/save_banner.do") 
		@ResponseBody
		public boolean saveBanner( @RequestParam("file1") MultipartFile file,HttpSession session,int academy,int top_img_size,String font_col,String hover_col,String back_col,int top_font_size,int font) throws Exception { 

		     String directory1 = (new FileUploadPath()).getDirectory()+ "amp\\src\\main\\webapp\\resources\\IMG\\academy_style";
			 String directory2 = (new FileUploadPath()).getDirectory()+ ".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\amp\\resources\\IMG\\academy_style";

			 
			String con = StringUtils.cleanPath(new String(file.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));//사용자의 첨부파일 이름	 
			
			//파일 이름 생성을 위한 랜덤 문자열
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 20; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}

			//이름 생성
		    String filename = "Top"+academy+"Img"+temp+con.substring(con.lastIndexOf("."));	     
		    String filepath1 = Paths.get(directory1, filename).toString();
		    String filepath2 = Paths.get(directory2, filename).toString();
 
		    // 두경로에 대한 파일 저장
		    BufferedOutputStream stream =
		        new BufferedOutputStream(new FileOutputStream(new File(filepath1)));
		    stream.write(file.getBytes());
		    stream = new BufferedOutputStream(new FileOutputStream(new File(filepath2)));
		    stream.write(file.getBytes());
		    stream.close();
		   
		    //db저장
		    AcademyStyleVo academyStyleVo=new AcademyStyleVo();
		    academyStyleVo.setAcademy(academy);
		    academyStyleVo.setTop_img(filename);
		    academyStyleVo.setTop_img_size(top_img_size);
		    academyStyleVo.setFont_col(font_col);
		    academyStyleVo.setBack_col(back_col);
		    academyStyleVo.setHover_col(hover_col);
		    academyStyleVo.setTop_font_size(top_font_size);
		    academyStyleVo.setFont(font);
		    
			AcademyStyleVo hasInfo = academyStyleDao.select_banner(academy); /* 파일이 있나 없나 확인 , 기존 이미지 삭제를 위한 파일 정보 불러옴 */
			if(hasInfo != null) {
				   filename=hasInfo.getTop_img();
				    if(filename!=null) {//기존 이미지 파일이 존재시 삭제 과정 진행
					    filepath1 = Paths.get(directory1, filename).toString();
					    filepath2 = Paths.get(directory2, filename).toString();
					    File deleteFile1 = new File(filepath1);
					    File deleteFile2 = new File(filepath2);
					    if(deleteFile2.exists()) {
				    		 while(true) {
					    		 if(deleteFile2.delete()) {
									 System.out.println("삭제완료");
									 break;
								 }else {
									 System.out.println("파일 삭제 실패");
									 try {
						                    Thread.sleep(100);
						                } catch(InterruptedException e) {
						                    e.printStackTrace();
						                } catch(Exception e) {
						                	
						                }
						                //파일 삭제를 실패한 경우 다시 실행
						              
								 }
				    		}
				    	}
						if (deleteFile1.exists()) {	
							 while(true) {
								 if(deleteFile1.delete()) {
									 System.out.println("삭제완료");
									 break;
								 }else {
									 System.out.println("파일 삭제 실패");
									 try {
						                    Thread.sleep(100);
						                } catch(InterruptedException e) {
						                    e.printStackTrace();
						                } catch(Exception e) {
						                	
						                }
						                //파일 삭제를 실패한 경우 다시 실행
						       
								 }	
							 }
						}
				    	
				    		
				    }
				academyStyleDao.update_banner(academyStyleVo);
			}else{
		    	academyStyleDao.save_banner(academyStyleVo);
		    }
		    
		  
		    return true;
		    
		}
		
		
		@RequestMapping(value = "/save_notImg_banner.do") 
		@ResponseBody
		public boolean saveNotImgBanner(int academy,int top_img_size,String font_col,String hover_col,String back_col,int top_font_size,int font) throws Exception {    
			System.out.println(font);
		    //db저장
		    AcademyStyleVo academyStyleVo=new AcademyStyleVo();
		    academyStyleVo.setAcademy(academy);
		    academyStyleVo.setTop_img_size(top_img_size);
		    academyStyleVo.setFont_col(font_col);
		    academyStyleVo.setBack_col(back_col);
		    academyStyleVo.setHover_col(hover_col);
		    academyStyleVo.setTop_font_size(top_font_size);
		    academyStyleVo.setFont(font);
		    
		    if(academyStyleDao.select_banner(academy)!=null) {
		    	academyStyleDao.update_notImg_banner(academyStyleVo);
		    }else {
		    	academyStyleDao.save_notImg_banner(academyStyleVo);
		    }
		    
		  
		    return true;
		    
		}
		
		
		@RequestMapping(value = "/save_main.do") 
		@ResponseBody
		public boolean saveMain( @RequestParam("file2") MultipartFile file,int academy,int main_size) throws Exception { 
		     String directory1 = (new FileUploadPath()).getDirectory()+ "amp\\src\\main\\webapp\\resources\\IMG\\academy_style";
			 String directory2 = (new FileUploadPath()).getDirectory()+ ".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\amp\\resources\\IMG\\academy_style";

			 
			String con = StringUtils.cleanPath(new String(file.getOriginalFilename().getBytes("8859_1"), StandardCharsets.UTF_8));//사용자의 첨부파일 이름	 
			
			//파일 이름 생성을 위한 랜덤 문자열
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 20; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}

			//이름 생성
		    String filename = "Main"+academy+"Img"+temp+con.substring(con.lastIndexOf("."));	     
		    String filepath1 = Paths.get(directory1, filename).toString();
		    String filepath2 = Paths.get(directory2, filename).toString();
 
		    // 두경로에 대한 파일 저장
		    BufferedOutputStream stream =
		        new BufferedOutputStream(new FileOutputStream(new File(filepath1)));
		    stream.write(file.getBytes());
		    stream = new BufferedOutputStream(new FileOutputStream(new File(filepath2)));
		    stream.write(file.getBytes());
		    stream.close();
		   
		    //db저장
		    AcademyStyleVo academyStyleVo=new AcademyStyleVo();
		    academyStyleVo.setAcademy(academy);
		    academyStyleVo.setMain_img(filename);
		    academyStyleVo.setMain_size(main_size);

		    
			AcademyStyleVo hasInfo = academyStyleDao.select_banner(academy); /* 파일이 있나 없나 확인 , 기존 이미지 삭제를 위한 파일 정보 불러옴 */
			if(hasInfo != null) {
				   filename=hasInfo.getMain_img();
				    if(filename!=null) {//기존 이미지 파일이 존재시 삭제 과정 진행
					    filepath1 = Paths.get(directory1, filename).toString();
					    filepath2 = Paths.get(directory2, filename).toString();
					    File deleteFile1 = new File(filepath1);
					    File deleteFile2 = new File(filepath2);
					    if(deleteFile2.exists()) {
				    		 while(true) {
					    		 if(deleteFile2.delete()) {
									 System.out.println("삭제완료");
									 break;
								 }else {
									 System.out.println("파일 삭제 실패");
									 try {
						                    Thread.sleep(100);
						                } catch(InterruptedException e) {
						                    e.printStackTrace();
						                } catch(Exception e) {
						                	
						                }
						                //파일 삭제를 실패한 경우 다시 실행
						              
								 }
				    		}
				    	}
						if (deleteFile1.exists()) {	
							 while(true) {
								 if(deleteFile1.delete()) {
									 System.out.println("삭제완료");
									 break;
								 }else {
									 System.out.println("파일 삭제 실패");
									 try {
						                    Thread.sleep(100);
						                } catch(InterruptedException e) {
						                    e.printStackTrace();
						                } catch(Exception e) {
						                	
						                }
						                //파일 삭제를 실패한 경우 다시 실행
						       
								 }	
							 }
						}
				    	
				    		
				    }
				academyStyleDao.update_main(academyStyleVo);
			}else{
		    	academyStyleDao.save_main(academyStyleVo);
		    }
		    
		  
		    return true;
		    
		}
		
		
		@RequestMapping(value = "/save_notImg_main.do") 
		@ResponseBody
		public boolean saveNotImgMain(int academy,String main_img,int main_size) throws Exception {    
		    //db저장
		    AcademyStyleVo academyStyleVo=new AcademyStyleVo();
		    academyStyleVo.setAcademy(academy);
		    academyStyleVo.setMain_size(main_size);
		    
		    if(academyStyleDao.select_banner(academy)!=null) {
		    	academyStyleDao.update_notImg_main(academyStyleVo);
		    }else {
		    	academyStyleDao.save_notImg_main(academyStyleVo);
		    }
		    
		  
		    return true;
		    
		}
}


































