package org.apereo.portal.session.slo.storage.impl;

import org.apereo.portal.session.redis.SpringSessionRedisEnabledCondition;
import org.apereo.portal.session.slo.storage.SLOCASMappingStorage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.session.data.redis.RedisOperationsSessionRepository;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * This class is used to write and read to the redis for CAS SLO needs.
 * They are two types of operations that are performed :
 * - Write/Read/Delete for a session mapping to a ticket
 * - Write/Read/Delete for a ticket mapping to a session
 */
@Service
@Conditional(SpringSessionRedisEnabledCondition.class)
public class RedisSLOCASMappingStorage implements SLOCASMappingStorage {

    @Autowired
    private RedisOperationsSessionRepository redisOperationsSessionRepository;

    private static final Logger logger = LoggerFactory.getLogger(RedisSLOCASMappingStorage.class);

    private final String PREFIX_ST_TO_SESSION = "spring:session:mapping:st_to_session:";
    private final String PREFIX_SESSION_TO_ST = "spring:session:mapping:session_to_st:";
    private final long TTL_SESSION_TO_ST = 60;
    private final long TTL_ST_TO_SESSION = 14400;

    private final StringRedisTemplate redis;

    public RedisSLOCASMappingStorage(RedisConnectionFactory connectionFactory) {
        this.redis = new StringRedisTemplate(connectionFactory);
    }

    /**
     * Saves a key,value pair of strings in redis
     * @param key The key
     * @param value The associated value
     */
    private void save(String key, String value, long ttl) {
        redis.opsForValue().set(key, value, ttl, TimeUnit.SECONDS);
    }

    /**
     * Gets a string value associated to a key from redis
     * @param key The key
     * @return The associated value
     */
    private String get(String key) {
        return redis.opsForValue().get(key);
    }

    /**
     * Deletes a key,value pair of strings in redis
     * @param key The key
     */
    private void delete(String key) {
        redis.delete(key);
    }

    /**
     * Save a mapping ST -> SessionId
     * @param st The service ticket
     * @param session The session ID
     */
    @Override
    public void saveSTToSession(String st, String session) {
        final String redisKey = PREFIX_ST_TO_SESSION + st;
        logger.trace("Saving mapping in redis, ST {} -> session {}", redisKey, session);
        save(redisKey, session, TTL_ST_TO_SESSION);
    }

    /**
     * Get the sessionID associated to a ST
     * @param st The service ticket
     * @return The session ID
     */
    @Override
    public String getSTToSession(String st) {
        return get(PREFIX_ST_TO_SESSION + st);
    }

    /**
     * Delete a mapping ST -> SessionId
     * @param st The service ticket
     */
    @Override
    public void deleteSTToSession(String st) {
        final String redisKey = PREFIX_ST_TO_SESSION + st;
        logger.trace("Deleting mapping for ST {}", redisKey);
        delete(redisKey);
    }

    /**
     * Save a mapping SessionId -> ST
     * @param session The SessionId
     * @param st The ST
     */
    @Override
    public void saveSessionToST(String session, String st){
        final String redisKey = PREFIX_SESSION_TO_ST + session;
        logger.trace("Saving mapping in redis, session {} -> st {}", redisKey, st);
        save(redisKey, st, TTL_SESSION_TO_ST);
    }

    /**
     * Get the service ticket associated to a session ID
     * @param session The session ID
     * @return The ST
     */
    @Override
    public String getSessionToST(String session) {
        return get(PREFIX_SESSION_TO_ST + session);
    }

    /**
     * Delete a mapping SessionId -> ST
     * @param session The session ID
     */
    @Override
    public void deleteSessionToST(String session){
        final String redisKey = PREFIX_SESSION_TO_ST + session;
        logger.trace("Deleting mapping for session {}", redisKey);
        delete(redisKey);
    }

    /**
     * Swaps a ST mapping from a session to another
     * Initial state : oldSession -> ST
     * Final state : ST -> newSession
     * @param oldSession The ID of the old session
     * @param newSession The ID of the new session
     */
    @Override
    public void swapSession(String oldSession, String newSession){
        String st = getSessionToST(oldSession);
        if(st != null) {
            deleteSessionToST(oldSession);
            saveSTToSession(st, newSession);
        } else {
            logger.error("No need to swap sessions as nothing is in redis");
        }
    }

    /**
     * Invalidates a session for a given ST
     * @param ticket The service ticket
     */
    @Override
    public void invalidateSessionForST(String ticket) {
        final String sessionId = this.getSTToSession(ticket);
        if(sessionId != null){
            logger.error("SessionID associated to ticket {} is {}. Invalidating the session and deleting the mapping.", ticket, sessionId);
            this.deleteSTToSession(ticket);
            redisOperationsSessionRepository.delete(sessionId);
        } else {
            logger.error("No session associated to ticket {} could be retrieved. Session will not be invalidated.", ticket);
        }
    }
}
