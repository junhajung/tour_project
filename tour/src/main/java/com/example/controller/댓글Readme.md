``` javascript
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
	$(function(){
		$('.first_update').click(function(){
			$('.my_reply').show(); $('.reply_list').hide(); $('.db_update').show(); $('.first_update').hide();
		});
		$('.reply_list').click(function(){
			$('.my_reply').hide(); $('.db_update').hide(); $('.first_update').show();
		});
	});
</script> 

<script>
	$(document).ready(function(){
		$(".reply_list").trigger("click");
	});
</script>
```

$().show(); → display 속성을 block 
$().hide(); → display 속성을 none

## $(document).ready()
![Untitled (1)](https://user-images.githubusercontent.com/48474613/132308494-bdfd88be-76a5-44a7-991e-b569055a0844.png)
문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하는 함수.

웹 실행 순서 

1. $(document).ready(function(
2. $(window).load(function(

즉, reply_list class 부분의 코드를 click상태로 실행되도록 함.

                                                                                                출처  [https://docu94.tistory.com/37](https://docu94.tistory.com/37)

## 댓글수정
``` jsp
<c:forEach var="list" items="${replylist}">
   <div class="input-group mb-3">

   	  <div class="reply_list">
	     	내용 : ${list.reply} <br/>
	     	작성자 : ${list.userid} <br/>	
	     	작성시간 : <fmt:formatDate value="${list.createdDate}" pattern="yyyy/MM/dd HH:mm"/>
      </div>

	     <form action="${pageContext.request.contextPath}/reply/reply_update" method="post" id="reply_update"> 	  	
	     	<div class="my_reply">
	        	<security:authorize access="isAuthenticated()">
	        		<security:authorize access="hasAuthority('user')">
	            <security:authentication property="principal.username" var="user_id"/>
	            	 <c:if test="${user_id eq list.userid}" >
	            	
				           	내용 : <input type="text" value="${list.reply}" name="update_reply" > 
				           	<input type="hidden" value="${list.id}" name="id">
				           	<input type="hidden" value="${list.name}" name="name">
				           	<br/>
				           	작성자 : ${list.userid}
				           	<br/>
				           	작성시간 : <fmt:formatDate value="${list.createdDate}" pattern="yyyy/MM/dd HH:mm"/>
			           </c:if>
		         </security:authorize>
					   </security:authorize>
	     	</div>
	   	
	   	<div style="float:right;">
	       	<security:authorize access="isAuthenticated()">

	       		 <security:authorize access="hasAuthority('user')">
	             <security:authentication property="principal.username" var="user_id"/>
	              <c:if test="${user_id eq list.userid}" >
	               	<a href="${pageContext.request.contextPath}/reply/reply_delete?id=${list.id}&name=${list.name}" style="color:black;">삭제</a>
	               	<a href="javascript:void(0);" style="color:black;" class="first_update">수정</a>
	               	<input type="submit" value="수정" class="db_update" style="color:black; background-color:transparent;  border:0px transparent solid; cursor: pointer;">
	              </c:if>
		         </security:authorize>
	         
	           <security:authorize access="hasAuthority('admin')">
	           		<a href="${pageContext.request.contextPath}/reply/reply_delete?id=${list.id}&name=${list.name}" style="color:black; ">삭제</a>
	           </security:authorize>

	      	</security:authorize>
	     	</div>
		  </form>
   </div>
</c:forEach>
```

1. JSP에서 Controller로 form 형식으로 해당 주소에 데이터들을 보냄
2. value로 보낸 수정하는 댓글 내용 (update_reply), 댓글 주소 (name), 댓글 기본키 (id) 를 보냄

## MongoDB 속 Tour Column
![Untitled (2)](https://user-images.githubusercontent.com/48474613/132308693-d7afce85-ee11-4c82-9224-76e8a4877337.png)

```java
@Autowired
private MongoTemplate mTemplate;

@RequestMapping(value = "/reply_update")
	public String reply_update(Model model, 
			@ModelAttribute Reply reply,
			Principal principal,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "id") String id,
			@RequestParam(value = "update_reply") String update_reply) throws UnsupportedEncodingException {
		
		String userid = principal.getName();
		
		if(tRepository.findByName(name) != null) {
			Query query = new Query(new Criteria("_id").is(id).and("userid").is(userid));
			Update update = new Update();
			update.set("reply", update_reply);
			mTemplate.upsert(query, update, reply.getClass());
			return "redirect:/tour_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
}
```
1. MongoTemplate Bean을 @Autowired를 통해 주입 받는다.
2. DB속 _id 칼럼과 jsp에서 받아온 id값이 일치하고 AND DB속 userid 칼럼과 jsp에서 받아온 userid가 일치하면 Reply Update


## MongoTemplate, Repository 차이
1. Repository

Spring에서 제공. CRUD 또는 naming convention에 맞는 간단한 쿼리를 선언하여 동적으로 제공될 수 있는 쿼리를 사용

1. MongoTemplate

Spring에서 지원하는 Query Derivation으로 구현될 수 없을 수준의 복잡한 쿼리들에 대해서 custom interface(fragment)를 생성하여 MongoTemplate를 사용하여 직접 구현
