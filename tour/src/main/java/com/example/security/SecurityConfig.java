package com.example.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	//service 객체
	@Autowired
	private MyUserDetailsService userDetailsService;

	// 암호화를 위한 객체 생성
	// 환경설정에서는 @Bean을 이용하여 객체를 생성함
	// BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
	
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		
		return new BCryptPasswordEncoder();
	}


	//암호화 적용
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		//보안 적용이 안되는 url 설정
		web.ignoring().antMatchers("/css/**","/js/**", "/images/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 권한에 따른 페이지 설정
		// ex) 127.0.0.1:9092/ROOT/admin 은 admin 권한만 접근 가능
		//url이 /member 또는 /member/~~인 것은 권한이 ADMIN, MANAGER, USER 인 사용자만 가능
		//나머지는 모두 접근 가능
		http.authorizeRequests()
			.antMatchers("/admin", "/admin/*").hasAnyAuthority("ADMIN")
			.anyRequest().permitAll()
			.and()

		//로그인 환경설정
		.formLogin()
			.loginPage("/user/login")
			.loginProcessingUrl("/user/loginProcess")
			.usernameParameter("userid") // name="userid"
			.passwordParameter("userpw")
			.permitAll()
			.successHandler(new LoginSuccessHandler())
			.and()

		//로그아웃 환경설정
		.logout()
			.logoutUrl("/user/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true) // 세션삭제
			.clearAuthentication(true) //인증내용 지우기
			.permitAll() //로그인하지 않아도 접근 가능한 페이지
			.and()
		
		// 접근할수 없는 페이지에 대한 처리 403	
		.exceptionHandling()
			.accessDeniedPage("/page403") //접근불가 페이지면 /ROOT/page403으로 이동
			.and();
		
		
		 

		http.csrf().disable();
		// iframe 속성을 .disable()로 지정하니 iframe 속성 지정한 맵이 다시 뜸.
		http.headers().frameOptions().disable();
	}
	
}