//package com.Estore.configuration;
//
//import javax.crypto.spec.SecretKeySpec;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
//import org.springframework.security.oauth2.jwt.JwtDecoder;
//import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
//import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
//import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//@EnableMethodSecurity
//public class SecurityConfig {
//    @Value("${jwt.signerKey}")
//    private String signerKey;
//
//    @Autowired
//    private CustomJwtDecoder customJwtDecoder;
//
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http.authorizeHttpRequests(request -> 
//        request.requestMatchers(HttpMethod.POST,
//         "/user", "/auth/login", "auth/introspect","acc/login", "acc/register"
//        )      
//        .permitAll()
//        .requestMatchers(HttpMethod.GET, "/test", "/product/list_by_category/**", "/product/detail/**", "acc/login", "acc/register")
//        .permitAll()
//        .requestMatchers("/WEB-INF/**","/static/**").permitAll()
//        .anyRequest().authenticated());
//
//        http.oauth2ResourceServer(oauth2 -> 
//            oauth2.jwt(t -> 
//                    t.decoder(jwtDecoder())));
//
//        http.csrf(t -> t.disable());
//
//
//
//         http.oauth2ResourceServer(oauth2 
//         -> oauth2.jwt(t -> t.decoder(customJwtDecoder)
//         .jwtAuthenticationConverter(jwtAuthenticationConverter()))
//         .authenticationEntryPoint(new JWTAuthenticationEntryPoint())
//         );
//        return http.build();
//    }
//
//    @Bean   // Chuyen SCOPE -> ROLE
//    JwtAuthenticationConverter jwtAuthenticationConverter() 
//    {
//    	JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();
//    	jwtGrantedAuthoritiesConverter.setAuthorityPrefix("");
//    	JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
//    	jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(jwtGrantedAuthoritiesConverter);
//    	return jwtAuthenticationConverter;
//    }
//
//    @Bean
//    JwtDecoder jwtDecoder() 
//    {
//         SecretKeySpec secretKeySpec = new SecretKeySpec(signerKey.getBytes(), "HS512");
//         return NimbusJwtDecoder
//            .withSecretKey(secretKeySpec)
//            .macAlgorithm(MacAlgorithm.HS512)
//            .build();
//    }
//}
