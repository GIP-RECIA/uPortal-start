package org.apereo.portal.cas.client;

import org.apereo.portal.session.redis.SpringSessionRedisEnabledCondition;
import org.jasig.cas.client.proxy.ProxyGrantingTicketStorage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Conditional;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.concurrent.TimeUnit;

@Conditional(SpringSessionRedisEnabledCondition.class)
public class RedisProxyGrantingTicketStorageImpl implements ProxyGrantingTicketStorage {

    private static final Logger logger = LoggerFactory.getLogger(RedisProxyGrantingTicketStorageImpl.class);

    private final long TTL_PGTIOU_TO_PGT = 120;
    private final String PREFIX_PGTIOU_TO_PGT = "spring:session:cas:pgt:";

    private final StringRedisTemplate redis;

    public RedisProxyGrantingTicketStorageImpl(RedisConnectionFactory connectionFactory) {
        this.redis = new StringRedisTemplate(connectionFactory);
    }

    /**
     * Stores a mapping proxyGrantingTicketIou -> proxyGrantingTicket in redis
     * @param proxyGrantingTicketIou the proxyGrantingTicketIou used as the key in redis
     * @param proxyGrantingTicket the proxyGrantingTicket associated to the proxyGrantingTicketIou
     */
    @Override
    public void save(final String proxyGrantingTicketIou, final String proxyGrantingTicket) {
        final String redisKey = PREFIX_PGTIOU_TO_PGT+proxyGrantingTicketIou;
        logger.debug("Saving mapping PGTIOU {} to PGT {} in redis", redisKey, proxyGrantingTicket);
        redis.opsForValue().set(redisKey, proxyGrantingTicket, TTL_PGTIOU_TO_PGT, TimeUnit.SECONDS);
    }

    /**
     * Retrieves the PGT for a given PGTIOU and deletes the mapping from the redis (one time use)
     * @param proxyGrantingTicketIou the proxyGrantingTicketIou used as the key in redis
     * @return The associated PGT
     */
    @Override
    public String retrieve(final String proxyGrantingTicketIou) {
        final String redisKey = PREFIX_PGTIOU_TO_PGT+proxyGrantingTicketIou;
        logger.debug("Getting PGT in redis for PGTIOU {}", redisKey);
        final String pgt = redis.opsForValue().get(redisKey);
        logger.debug("Returning PGT {} and deleting existing mapping.", pgt);
        redis.delete(redisKey);
        return pgt;
    }

    /**
     * No need to clean anything, redis already has its own mechanism
     */
    @Override
    public void cleanUp() {}

}
