package org.apereo.portal.session.slo.listener;

import org.apereo.portal.session.slo.storage.SLOCASMappingStorage;
import org.apereo.portal.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.web.authentication.session.SessionFixationProtectionEvent;
import org.springframework.stereotype.Component;

/**
 * This class is used as a listener to SessionFixationProtectionEvent because of ChangeSessionIdAuthenticationStrategy
 * It swaps the mappings so the ST is still attached to the right session for SLO
 */
@Component
public class SLOMappingSessionSwappingListener implements ApplicationListener<SessionFixationProtectionEvent> {

    @Autowired
    private SLOCASMappingStorage slocasMappingStorage;

    private static final Logger logger = LoggerFactory.getLogger(SLOMappingSessionSwappingListener.class);

    @Override
    public void onApplicationEvent(SessionFixationProtectionEvent event) {
        String oldSessionId = event.getOldSessionId();
        String newSessionId = event.getNewSessionId();
        // TODO : Do not call swapSession if user is not authenticated. Note : event.getAuthentication().isAuthenticated() returns true even if user is guest
        logger.debug("SessionFixationProtectionEvent detected : old={} → new={}. Trying to swap mappings for CAS SLO if it exists", oldSessionId, newSessionId);
        slocasMappingStorage.swapSession(oldSessionId, newSessionId);
    }
}
