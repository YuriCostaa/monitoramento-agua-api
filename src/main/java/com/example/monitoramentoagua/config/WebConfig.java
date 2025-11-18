package com.example.monitoramentoagua.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    /**
     * Este método define as regras de CORS para toda a aplicação.
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**") // Aplica a todos os endpoints "/api/..."
            .allowedOrigins("http://127.0.0.1:5500") // Permite o seu frontend
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // Métodos permitidos
            .allowedHeaders("*") // Permite todos os headers (incluindo Authorization)
            .allowCredentials(true);
    }
}