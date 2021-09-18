>BCrpytPasswordEncoder, Authentication(인증), Authorization(인가) 등 Spring Security 원리 및 로직.

## Authentication, Authorization 처리 과정 
![Untitled (3)](https://user-images.githubusercontent.com/48474613/132309045-bd279e6c-5f50-45d7-ba51-f902c0dff3f5.png)
1. 사용자가 id, pw로 로그인 요청
2. AuthenticationFilter에서 UsernamePasswordAuthenticationToken을 생성하여 Manager에게 전달
3. Manager는 등록된 Provider들을 조회하여 인증을 요구
4. Provider는 UserDetailsService를 통해 입력 받은 아이디에 대한 사용자 정보를 DB에서 조회
5. 입력 받은 비밀번호를 암호화하여 DB의 비밀번호와 매칭되는 경우 인증이 성공된 UsernameAuthenticationToken을 생성하여 Manager로 반환
6. Manager는 토큰을 Filter에게 전달
7. Filter는 전달 받은 토큰을 LoginSuccessHandler로 전송하고 SecurityContextHolder에 저장

## BCrpytPasswordEncoder
Spring Security FrameWork에서 제공하는 클래스

자바 서버 개발을 위해 필요로 한 인증, 권한 부여 및 기타 보안 기능을 제공하는 프레임워크(클래스와 인터페이스 모임)

단순하게 해시 함수를 1회만 적용했다면, 무차별 랜덤으로 대입해 보는 공격 및 사전 공격, 레인보우 테이블 등의 암호 공격에 취약하게 된다.

BCrypt는 단순히 입력을 1회 해시하는 것이 아니라 ,랜덤의 소트(salt)을 부여하여 여러번 해시를 적용하여 원래의 암호를 추측하기 어럽게 한다.


- **메서드 구성**
1. `encode(rawPW)`

 - 패스워드를 암호화 해주는 메서드

 - SHA-1 8바이트로 결합된 해쉬, 랜덤하게 생성된 솔트(salt)를 지원

 - 같은 비밀번호를 인코딩 하더라도 매번 다른 인코딩 문자열 반환

 - 반환 타입 : String

1. `matchers(rawPW, encodePW)`

 - 인코딩되지 않은 PW 와 인코딩 된 PW 일치 여부 비교

 - 반환 타입 : Boolean

1. `upgradeEncoding(encodePW)`

  - 보안 강화를 위해 인코딩 된 암호를 한번 더 인코딩

 - 반환 타입 : Boolean

   (인코딩이 필요한 경우 true, 필요하지 않은 경우 false, 기본 구현에는 항상 false)

  - encode 메서드를 통해 암호화된 PW들은 upgradeEncoding을 사용했을 때 모두 기본적으로 false 반환


* pom.xml에 추가
``` java
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-security</artifactId>
</dependency>
<dependency>
	<groupId>org.springframework.security</groupId>
	<artifactId>spring-security-taglibs</artifactId>
</dependency>
```

### 어노테이션

1. `@Configuration`

자바로 진행하는 설정 클래스에 붙이는 어노테이션.

Spring Bean으로 만들고 Spring 프로젝트가 시작될 때 Spring Security 설정 내용에 반영되도록 한다.

1. `@EnableWebSecurity`

Spring Security 활성화

1. `@Bean`

Spring IoC 컨테이너가 관리하는 자바 객체

ApplicationContext가 알고 있는 객체 

즉, ApplicationContext가 만들어서 그 안에 담고 있는 객체

예를 들어, 기존의 자바  프로그래밍에서는 class를 직접 생성하고 new를 입력하여 원하는 객체를 직접 생성한 후에 사용

하지만, Spring에서는 직접 생성한 객체가 아니라 Spring에 의하여 관리 당하는 자바 객체를 사용한다.

이렇게 Spring에 의하여 생성되고 관리되는 자바 객체를 Bean이라고 한다.

보통 Singleton으로 존재 

 + Singleton : 어떤 클래스가 최소 한번만 메모리를 할당하고(Static) 그 메모리에 객체를 만들어 사용하는 디자인 패턴

1. `@Autowired`

의존성을 주입

(IoC 컨테이너에 bean으로 등록이 되어야 의존성 주입을 할 수 있다)

## WebSecurityConfigurerAdapter

- security dependency를 추가한 이후 basic한 security를 설정 및 구현하는 클래스
- HttpSecurity라는 세부적인 보안 기능을 설정할 수 있는 API를 제공하는 클래스를 생성
