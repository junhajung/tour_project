> AOP(Aspect Oriented Programming)란?  
관점 지향 프로그래밍  
어떤 로직을 기준으로 핵심적인 관점, 부가적인 관점으로 나누어서 보고 그 관점을 기준으로 각각 모듈화 하겠다는 것  

## AOP 주요 개념
 - Aspect : 흩어진 관심사를 모듈화 한 것. 주로 부가 기능을 모듈화 함

 - Target : Aspect를 적용하는 곳 

 - Advice : 실직적으로 어떤 일을 해야할지에 대한 것

 - JointPoint : Advice가 적용될 위치 , 다양한 시점에 적용가능

## Session
세션은 쿠키와 다르게 사용자의 정보가 서버에 저장된다.  
세션을 클라이언트마다 개별적으로 유지하기 위해 HttpSession 객체가 생성될 때 요청을 보내온 클라이언트 정보, 요청시간 정보 등을 조합한 세션 ID가 부여되며 이 세션 ID가 쿠키 기술로 저장된다.

''' java
@Component
@Aspect
public class UrlAspect {

	// 모든 controller를 방문시 수행
	@Around("execution(* com.example.controller.*Controller.*(..))")
	public Object sessionLog(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//request 객체 가져오기
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		//session 객체 가져오기
		HttpSession httpSession = request.getSession();
		
		//controller 수행시 표시되는 url정보를 가져옴.
		//ex) 127.0.0.1:9090/ROOT/member/main?userid=aaaa
		String path = request.getServletPath(); // /member/main
		String query = request.getQueryString(); // userid=aaaa
			
		//제거할 url정보
		if(!path.startsWith("/user/login") && !path.startsWith("/user/logout")
				&& !path.startsWith("/tour_image") && !path.startsWith("/stay_image") && !path.startsWith("/activity_image")
				&& !path.startsWith("/food_image") && !path.startsWith("/naver_image")) {
			//세션에 url정보를 추가함.
			if(query == null) {
				httpSession.setAttribute("CURRENT_URL", path);
			}
			else {
				httpSession.setAttribute("CURRENT_URL", path + "?" + query);
			}	
		}
		return joinPoint.proceed();
	}
}
'''

1. @Component를 붙여 Spring Bean으로 등록한다.
2. @Around는 특정 타겟 메서드를 감싸서 특정 Advice를 실행한다는 의미이다.

    @Around("execution(* com.example.controller.*Controller.*(..))") 

    → com.example.controller.*Controller 아래의 패키지 경로의 Controller 객체의 모든 메서드에 이 Aspect를 적용

3. HttpServletRequest 객체의 getSession() 메소드를 활용하여 클라이언트가 가지고 있는 세션 ID와 동일한 세션 객체를 찾아서 주소값을 반환
4. getServletPath를 활용하여 /servletpath/index.jsp를 들고온다.
5. getQueryString을 활용하여 쿼리를 얻어온다.

    ex) type=1

6. 들고온 servletpath가 특정 url이 아닌 부분에 대해서 session을 set 해준다.
