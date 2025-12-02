package org.apereo.portal.session.slo.filter;

import org.jasig.cas.client.validation.Cas20ProxyReceivingTicketValidationFilter;
import org.jasig.cas.client.validation.Assertion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This class is like Cas20ProxyReceivingTicketValidationFilter with an override on onSuccessfulValidation
 * The goal is to store the validated ticket id in the session to be able to retrieve it later
 */
public class HandleSLOCas20ValidationFilter extends Cas20ProxyReceivingTicketValidationFilter {

    private static final Logger logger = LoggerFactory.getLogger(HandleSLOCas20ValidationFilter.class);

    @Override
    protected void onSuccessfulValidation(HttpServletRequest request, HttpServletResponse response, Assertion assertion) {
        HttpSession session = request.getSession(false);
        final String ticket = request.getParameter("ticket");
        if(ticket != null){
            session.setAttribute("CAS_SERVICE_TICKET", ticket);
            logger.debug("CAS ticket validated : adding ticket {} to session {} attributes", ticket, session.getId());
        } else {
            logger.warn("No ticket was specified in ticket validation request !");
        }
    }
}
