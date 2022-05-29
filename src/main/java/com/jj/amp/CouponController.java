package com.jj.amp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jj.dao.CouponDao;
import com.jj.vo.CouponVo;


@Controller
public class CouponController {
	@Autowired
	CouponVo couponVo;
	@Autowired
	CouponDao couponDao;

	@RequestMapping(value = "/makeCoupon", method = RequestMethod.GET)
	public void makeCoupon(String name,int academy,String s_date,String e_date,String u_date,int num,String mod,double sale) {
		/* 관리자 페이지 */
		//랜덤 문자열
		
		if(mod!=null&&mod.equals("false")) {//통합발행
			CouponVo couponVo1=new CouponVo();
			couponVo1.setName(name);
			couponVo1.setAcademy(academy);
			couponVo1.setS_date(s_date);
			couponVo1.setE_date(e_date);
			couponVo1.setU_date(u_date);
			couponVo1.setNum(num);
			couponVo1.setCode(makeCode());
			couponVo1.setSale(sale/100);
			couponDao.makeCoupon1(couponVo1);
		}else if(mod.equals("true")){//개별발행
			CouponVo couponVo1=new CouponVo();
			couponVo1.setName(name);
			couponVo1.setAcademy(academy);
			couponVo1.setS_date(s_date);
			couponVo1.setE_date(e_date);
			couponVo1.setU_date(u_date);
			couponVo1.setSale(sale/100);
			for(int i=0;i<num;i++) {
				couponVo1.setCode(makeCode());	
				couponDao.makeCoupon2(couponVo1);
			}
	
		}
	
	}

	@RequestMapping(value = "/deleteCoupon", method = RequestMethod.GET)
	public void deleteCoupon(int idx) {
		couponDao.deleteCoupon(idx);
		
	}
	@RequestMapping(value = "/isCoupon", method = RequestMethod.GET)
	@ResponseBody    
	public String isCoupon(String code,int academyidx,HttpSession session) {
		/*리턴타입
		 * 1.false:코드가 일치하지 않음 
		 * 2.finished:만료된 쿠폰 
		 * 3.have:이미 가지고 있음 
		 * 4.쿠폰번호:쿠폰등록가능
		 */
		int member=(int)session.getAttribute("idx");
		Map< String,String> map= new HashMap<String, String>();
		map.put("academyidx",academyidx+"");
		map.put("code",code);
		
		ArrayList<CouponVo> list=(ArrayList<CouponVo>)couponDao.isCoupon(map);
		if(list.size()==0) {
			return "false";
		}else if(list.get(0).getFinished()==1) {
			System.out.println("finished");
			return "finished";
		}else {
			int coupon =list.get(0).getIdx();
			map=new HashMap<String, String>();
			map.put("coupon",coupon+"");
			map.put("member", member+"");
			if(couponDao.hasCoupon(map)!=0){
				System.out.println("have");
				return "have";
			}
			System.out.println("good");
			return coupon+"";
		}
	
		
	}
	@RequestMapping(value = "/addCoupon", method = RequestMethod.GET)
	public void addCoupon(int idx,HttpSession session) {
		int member=(int)session.getAttribute("idx");
		Map map=new HashMap<String,Integer>();
		map.put("coupon",idx);
		map.put("member", member);
		couponDao.addCouponMember(map);
		
		
	}
	public String makeCode() {
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
		return temp.toString();
	}

}
