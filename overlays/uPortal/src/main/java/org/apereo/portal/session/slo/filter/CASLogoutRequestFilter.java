package org.apereo.portal.session.slo.filter;

import org.apereo.portal.session.slo.storage.SLOCASMappingStorage;
import org.jasig.cas.client.util.XmlUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * This class is a custom filter that handles SLO requests from CAS
 * It extracts the corresponding session and invalidates it
 */
public class CASLogoutRequestFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(CASLogoutRequestFilter.class);

    @Autowired
    private SLOCASMappingStorage slocasMappingStorage;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        final HttpServletRequest request = (HttpServletRequest) req;
        final String logoutMessage = request.getParameter("logoutRequest");
        if(logoutMessage != null){
            logger.debug("Logout request detected : logoutMessage is {}", logoutMessage);
            final String ticket = XmlUtils.getTextForElement(logoutMessage, "SessionIndex");
            logger.debug("Extracted ticket {} from logoutMessage", ticket);
            slocasMappingStorage.invalidateSessionForST(ticket);
        } else {
            logger.debug("This is not a logout request. Continuing filter chain...");
            chain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {}
}
