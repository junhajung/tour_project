# Javascript 음성

``` java
<script>
	var start = false; // on, off
	var check = false; // start check
	var url = document.location.href.split('?start=');
	
	if(url[1]){ // url[1]의 값이 true이면
	   start = true;
	   check = true;
	}
	var category_index = -1; // key 1,2 - category_audioFile
	var content_index = -1; // key q,w - content_audioFile
	var MAX_NUM_CATEGORY = 5;
	var MAX_NUM_CONTENT = 9; // content_audioFile의 index 수

	var flag = false; // 어느 메뉴인지 판단, false면 1,2 동작중, true면 q,w 동작중
	var flag1 = false; // Enter키 사용 유무
	var flag2 = false; // Enter키 눌렀을시 ESC를 제외한 키 작동 X
	var flag3 = false; // q,w 는 설명만 듣는 용도이기 때문에 Enter와 Escape 키 입력 방지
	var flag4 = false; // Enter키 부분에서 사용, false면 선택하시겠습니까?, true이면 move()함수 실행

	var select = new Audio('resources/sounds/선택하시겠습니까_.mp3')
	var cancel = new Audio('resources/sounds/취소하셨습니다.mp3')
	var starts = new Audio('resources/sounds/기능을+시작합니다.mp3')
	var stop = new Audio('resources/sounds/기능을+종료합니다.mp3')
	
	var category_audioFile = [
	      new Audio('resources/sounds/숙소.mp3'), 
	      new Audio('resources/sounds/인기+Top+eight.mp3'), // 추가
	      new Audio('resources/sounds/인스타그램+인기순위.mp3'), // 추가
	      new Audio('resources/sounds/맛집.mp3'),
	      new Audio('resources/sounds/액티비티.mp3')
	]

	var content_audioFile = [
	   new Audio('resources/sounds/대둔산짚핑_가격+오만오천원.mp3'),
	   new Audio('resources/sounds/대천짚라인_가격+만팔천원.mp3'),
	   new Audio('resources/sounds/영인산자연휴양림_가격+만원.mp3'),
	   new Audio('resources/sounds/강경수상레저_가격+웨이크+보드+체험+삼만원.mp3'),
	   new Audio('resources/sounds/해양레저체험교실_가격+플라이보드+육만원.mp3'),
	   new Audio('resources/sounds/천안케이블워터파크_가격+주말+한시간+사만원.mp3'),
	   new Audio('resources/sounds/스카이바이크_가격+이인+이만이천원+.mp3'),
	   new Audio('resources/sounds/대천레일바이크_가격+일인+이만원.mp3'),
	   new Audio('resources/sounds/아산레일바이크_가격+이인승+이만오천원.mp3')
	]

	window.addEventListener("keydown", (e) => {
		  const key = document.getElementById(e.key);
		  
		  if(start){
		  if(!flag2){ // Enter키를 누르지 않았다면
		  if(e.key == "1"){ 
		     flag = false; // 1 동작 = false (false면 1,2 동작중, true면 q,w 동작중)
		     flag3 = true; // category 부분이기에 Enter키 사용 허용

		     if (key) {
		        category_index++; // category_index의 초기값이 -1 이기에 0으로 증가시켜준다.
		        if (category_index <= MAX_NUM_CATEGORY - 1){
		        	if(content_index != -1){ // content_index가 초기값 -1이 아니라면 audioFile1의 음성이 나오고있다고 판단
			        	content_audioFile[content_index].pause(); 
			        	content_audioFile[content_index].currentTime = 0;
		        	}
		        	key.classList.add(category_audioFile[content_index].play());
		        }
		           
		        if (category_index == MAX_NUM_CATEGORY){
		        	if(content_index != -1){
			        	content_audioFile[content_index].pause();
			        	content_audioFile[content_index].currentTime = 0;
		        	}
		           category_index = 0; // i의 index는 4가 최대기에 5가 되었다면 0으로 초기화
		           key.classList.add(category_audioFile[category_index].play());
		        }
		        else
		           category_index = 0;
		     }
		  }
		  else if(e.key == "2"){
		     flag = false; // 2 동작 = false (false면 1,2 동작중, true면 q,w 동작중)
		     flag3 = true; // category 부분이기에 Enter키 사용 허용
		     if(key){
		        	category_index--;
		        if(category_index == -2 || category_index == -1){
		        	if(content_index != -1){
		        	content_audioFile[content_index].pause();
		        	content_audioFile[content_index].currentTime = 0;
		        	}
		           category_index = MAX_NUM_CATEGORY - 1;
		           key.classList.add(category_audioFile[category_index].play());
		        }
		        if(category_index >= 0){
		        	if(content_index != -1){
		        	content_audioFile[content_index].pause();
		        	content_audioFile[content_index].currentTime = 0;
		        	}
		           key.classList.add(category_audioFile[category_index].play());
		        }
		     }
		  }
		  else if(e.key == "q"){ 
			     flag = true; // q 동작 = true (false면 1,2 동작중, true면 q,w 동작중)
			     flag3 = false; // content 부분이기에 Enter키 동작 방지
			     if (key) {
			        content_index++;
			        if (content_index <= MAX_NUM_CONTENT - 1){
			        	if(content_index != 0){
				        	content_audioFile[content_index-1].pause();
				        	content_audioFile[content_index-1].currentTime = 0;
				        }
			           key.classList.add(audioFile1[content_index].play());
			        }
			        if (content_index == MAX_NUM_CONTENT){
			        	 content_audioFile[content_index-1].pause();
				         content_audioFile[content_index-1].currentTime = 0;
			           content_index = 0;
			           key.classList.add(content_audioFile[content_index].play());
			        }
			        else
			           content_index = 0;
			     }
			  }
			  else if(e.key == "w"){
			     flag = true; // w 동작 = true (false면 1,2 동작중, true면 q,w 동작중)
			     flag3 = false; // content 부분이기에 Enter키 동작 방지
			     if(key){
			        	content_index--;
			        if(content_index == -2 || content_index == -1){
			        	if(content_index != -2){
			        	content_audioFile[content_index+1].pause();
			        	content_audioFile[content_index+1].currentTime = 0;
			        	}
			           content_index = MAX_NUM_CONTENT - 1;
			           key.classList.add(content_audioFile[content_index].play());
			        }
			        if(content_index >= 0){
			        	content_audioFile[content_index+1].pause();
			        	content_audioFile[content_index+1].currentTime = 0;
			           key.classList.add(content_audioFile[content_index].play());
			        }
			     }
			  }
			  }
		  
		  if(flag3){ // Enter키 동작이 true면
			  if(e.key == "Enter"){
				     if(key){
				        if (flag4 == false){ // false면 선택하시겠습니까?, true이면 move()함수 실행
				           flag1 = true; // Enter키 사용했기에 true로 변경
				           flag2 = true; // Enter키 눌렀을시 ESC를 제외한 키 작동 X
				           flag4 = true; // Enter키를 눌렀으니 true로 변경
				           if(content_index != -1){
				           content_audioFile[content_index].pause();
				        	content_audioFile[content_index].currentTime = 0;
				           }
				              key.classList.add(select.play()); // 선택하시겠습니까?
				        }
				        if (flag4 == true){ // false면 선택하시겠습니까?, true이면 move()함수 실행
				           move();
				        }
				     }
				  }
			  else if(e.key == "Escape"){
			     if(key){
			        if(flag1){
			           flag1 = false;
			           flag2 = false;
			           flag4 = false;
			           if(content_index != -1){
			           content_audioFile[content_index].pause();
			        	 content_audioFile[content_index].currentTime = 0;
			           }
			           key.classList.add(cancel.play()); // 취소하셨습니다.
			        }
			     }
			  }
		  }
		  
		  
		  if(check){
		  if(e.key == "F2"){
			  if(content_index != -1){
				  content_audioFile[content_index].pause();
			      content_audioFile[content_index].currentTime = 0;
				  }
		     check = false;
		     category_index = -1;
		     content_index = -1;
		     history.replaceState({}, null, location.pathname); // 종료시 파라미터값 삭제
		     if(key) {
		    	 start = false;
		     	 key.classList.add(stop.play()); // 기능을 종료합니다.
		  	}
		  }
		  }
		  
		  }
		  if (!check){
		  if(e.key == "F2"){
		        check = true;
		     if(key) {
		    	 start = true;
		       key.classList.add(starts.play()); // 기능을 시작합니다.
		     }
		  }
		  }
		});
	
	function move(){
	   if(!flag){
		   if (category_index == 0)
		      location.href = "/ROOT/stay?start="  + start
		   else if (category_index == 1)
		      location.href = "/ROOT/popular?start="  + start
		   else if (category_index == 2)
		      location.href = "/ROOT/instagram?start="  + start
		   else if (category_index == 3)
		      location.href = "/ROOT/food?start="  + start
		   else if (category_index == 4)
		      location.href = "/ROOT/activity?start="  + start
	   }
	}
 </script>
 ```
 
 ## document.location.href
 javascript로 현재 페이지의 url을 가져온다.  

만약 뒤의 파라미터 값만 들고오고 싶을 때, **`document.location.href.split('?')`** 라고 해주면 `?` 뒤에 있는 파라미터 값만 들고 올 수 있음.  

var url = document.location.href.split('?start=');  

변수 url에 값을 담음.  
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2e6e3649-9bab-4964-9afc-9180a423b57e/Untitled.png)
url[1] = true 이면 start와 check의 값은 true 아니면 false이다.

기능 종료시 history.replaceState({}, null, location.pathname); 를 실행하여 url 파라미터 값을 지움.
