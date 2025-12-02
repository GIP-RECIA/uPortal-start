package org.apereo.portal.session.slo.storage;

public interface SLOCASMappingStorage {
    void saveSTToSession(String st, String session);
    String getSTToSession(String st);
    void deleteSTToSession(String st);
    void saveSessionToST(String session, String st);
    String getSessionToST(String session);
    void deleteSessionToST(String session);
    void swapSession(String oldSession, String newSession);
}
