/*
 * 설명서
 * 
 * 	인자값:uri=url+파라미터
 * 
 * 	인자값:divName=동기화할 div의 이름   ex:( id = "abc" -> divName = "#abc")  ,  ( class = "abc" -> divName = ".abc" )
 * 
 * 	return = 통신을 통해 가져올 값이 있을때 returnData로 리턴된다. 
 * 				컨트롤러 메서드 구현시:
 * 				통신을 통해 데이터를 리턴받으려면 해당 url 컨트롤러 메서드 구현 부에서 
 * 				컨트롤러 메서드 return 값이 뷰가 아닌 데이터로 날라와야 함으로 메핑코드 뒤에 @ResponseBody를 꼭 명시해야한다.
 * 				ex: SmsController에  smsIsCode()메스드 @ResponseBody 참고
 * 
 * 
 * ajaxDo는 동기식, ajaxLoad는 비동기식으로
 * ajaxDo는 리턴을 기다렸다 다음 코드가 실행됨
 * ajaxLoad는 기다리지 않고 다음 코드와 함께 실행됨
 * 
 * 
 * from.이태현
 */

		function ajaxDo(uri,divName){	
			var returnData="false";
			$.ajax({ 
			type: 'get' , 
			url:  uri, 
			async: false, 
			success: function(data) { 	
				returnData=data		
				$(divName).html(data); 
									
			}
			}); 
			
			return returnData;
		}
		function ajaxLoad(uri,divName){
			var returnData="false";
			$.ajax({ 
			type: 'get' , 
			url:  uri, 
			async: true, 
			success: function(data) { 					
				returnData=data		
				$(divName).html(data); 				
			}
			}); 
			
			return returnData;
		}
		
		
		/* 
			관리자_수강생 및 강사관리
			선택된 목록을 배열에 담아 보내는 ajax 함수
			ajaxArray = 강사
			ajaxArray2 = 수강생
			
				
			from. 진렬
		 */ 
		function ajaxArray(uri,divName,arr){	
			var returnData="false";
			$.ajax({ 
			type: 'get' , 
			url:  uri,
			traditional : true,
			 data: {
				     'teacher_idx_list' : arr
				   },
			async: false, 
			success: function(data) { 	
				returnData=data		
				$(divName).html(data); 
									
			}
			}); 
			
			return returnData;
		}
		
		
		
		function ajaxArray2(uri,divName,arr){	
			var returnData="false";
			$.ajax({ 
			type: 'get' , 
			url:  uri,
			traditional : true,
			 data: {
				     'member_idx_list' : arr
				   },
			async: false, 
			success: function(data) { 	
				returnData=data		
				$(divName).html(data); 
									
			}
			}); 
			
			return returnData;
		}
		
		
			/* 관리자 - 수강폐지 ajax */
		function ajaxArray_class_delete(uri,divName,arr){
		
			var returnData="false";
			$.ajax({ 
			type: 'get' , 
			url:  uri,
			traditional : true,
			 data: {
				     'class_idx_list' : arr
				   },
			async: false, 
			success: function(data) { 	
				returnData=data		
				$(divName).html(data); 
									
			}
			}); 
			
			return returnData;
		
		}