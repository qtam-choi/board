package kr.co.olivar.board.config;

import kr.co.olivar.board.common.interceptor.CommonInterceptor;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Bean
    public CommonInterceptor commonInterceptor() {
        return new CommonInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        /*
        registry.addInterceptor(commonInterceptor())
                .addPathPatterns("/board/**") // 적용할 url
                .addPathPatterns("/account/list")
                .excludePathPatterns("/account") // 제외할 url
                .excludePathPatterns("/home"); // 제외할 url

        */
        WebMvcConfigurer.super.addInterceptors(registry);
    }

    @Bean
    MappingJackson2JsonView jsonView(){
        return new MappingJackson2JsonView();
    }



    /**
     * Embedded Server Error page
     * @return
     */
    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> embeddedTomcatServerFactory() {
        return factory -> {
            factory.addErrorPages(
                    new ErrorPage(HttpStatus.BAD_REQUEST, "/error/errorCode500.jsp"),
                    new ErrorPage(HttpStatus.UNAUTHORIZED, "/error/errorCode500.jsp"),
                    new ErrorPage(HttpStatus.FORBIDDEN, "/error/errorCode500.jsp"),
                    new ErrorPage(HttpStatus.NOT_FOUND, "/error/errorCode404.jsp"),
                    new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/errorCode500.jsp"));
        };
    }


}
