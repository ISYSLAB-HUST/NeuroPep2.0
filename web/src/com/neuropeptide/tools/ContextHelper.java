package com.neuropeptide.tools;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:55
 * @Description:
 */
public final class ContextHelper {
    private static ClassPathXmlApplicationContext _ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

    private ContextHelper() {
    }

    public static ClassPathXmlApplicationContext getContext() {
        return _ctx;
    }
}
