package org.jasig.portal.resourceserver;

import java.util.List;
import java.util.ArrayList;
import java.util.stream.Stream;

import javax.servlet.Filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.util.StringUtils;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.filter.CorsFilter;


@Configuration
@PropertySources({
        @PropertySource(value = "file://${portal.home}/global.properties", ignoreResourceNotFound = true),
        @PropertySource(value = "file://${portal.home}/resource-server.properties", ignoreResourceNotFound = true)
})
public class CorsFilterConfiguration {

    private static final Logger log = LoggerFactory.getLogger(CorsFilterConfiguration.class);

    @Autowired
    private Environment env;


    @Bean
    public FilterRegistrationBean<Filter> corsFilter() {
        FilterRegistrationBean<Filter> filterRegistrationBean = new FilterRegistrationBean<Filter>();
        filterRegistrationBean.setFilter(new CorsFilter(request -> {
            String origin = request.getHeader(HttpHeaders.ORIGIN);

            if (!StringUtils.hasText(origin)) {
                // Not a CORS request.
                return null;
            }

            final List<String> allowedOrigins = (List<String>)this.env.getProperty("cors.allowed.origins", List.class);
            final List<String> allowedHttpMethods = (List<String>)this.env.getProperty("cors.allowed.methods", List.class);
            //final List<String> allowedHttpHeaders =this.env.getProperty("cors.allowed.headers", "Origin,Accept,Authorization,X-Requested-With,Content-Type,Access-Control-Request-Method,Access-Control-Request-Headers");
            //final List<String> exposedHeaders = this.env.getProperty("cors.exposed.headers", null);
            //final boolean supportsCredentials = this.env.getProperty("cors.support.credentials", "true");
            //final long preflightMaxAge = this.env.getProperty("cors.preflight.maxage", "1800");
            //final boolean decorateRequest = this.env.getProperty("cors.request.decorate", "true");

            log.info("origin = {}", origin);

            if (!allowedOrigins.contains(origin)) {
                //CORS not allowed
                log.info("Not allowed origin {} from autorized {} !", origin, allowedOrigins);
                return null;
            }

            CorsConfiguration configuration = new CorsConfiguration();

            configuration.addAllowedOrigin(origin);

            String accessControlRequestHeaders = request.getHeader(HttpHeaders.ACCESS_CONTROL_REQUEST_HEADERS);
            if (StringUtils.hasText(accessControlRequestHeaders)) {
                Stream.of(accessControlRequestHeaders.split(",")).map(String::trim).distinct()
                        .forEach(configuration::addAllowedHeader);
            }

            configuration.addExposedHeader("*");

            configuration.setAllowCredentials(true);

            configuration
                    .setAllowedMethods(allowedHttpMethods);

            return configuration;
        }));
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.setOrder(Integer.MIN_VALUE); // Ensure first execution
        return filterRegistrationBean;
    }
}
