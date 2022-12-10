package com.neuropeptide.tools;

import java.io.InputStream;
import java.util.Properties;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:02
 * @Description:
 */
public class PropertiesFactoryHelper {
    private static PropertiesFactoryHelper _instance = null;
    private Properties properties = new Properties();

    private PropertiesFactoryHelper() {
        try {
            InputStream inputStream = this.getClass().getResourceAsStream("/config.properties");
            this.properties.load(inputStream);
            if (inputStream != null) {
                inputStream.close();
            }
        } catch (Exception var2) {
            System.out.println(var2 + "file not found");
        }

    }

    public static synchronized PropertiesFactoryHelper getInstance() {
        if (_instance == null) {
            _instance = new PropertiesFactoryHelper();
        }

        return _instance;
    }

    public String getConfig(String key) {
        return this.properties.getProperty(key);
    }
}
