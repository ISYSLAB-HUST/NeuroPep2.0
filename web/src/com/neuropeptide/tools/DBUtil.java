package com.neuropeptide.tools;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:57
 * @Description:
 */
public final class DBUtil {
    private static final Log log = LogFactory.getLog(DBUtil.class);

    public DBUtil() {
    }

    public static DataSource getDataSource() {
        DataSource dataSource = null;

        try {
            dataSource = (DataSource) ContextHelper.getContext().getBean("neuropeptidedbDataSource");
        } catch (Exception var2) {
            log.error("获取数据源出错，请检查Spring数据源配置！");
        }

        return dataSource;
    }

    public static Connection makeConnection() {
        Connection conn = null;

        try {
            conn = getDataSource().getConnection();
        } catch (SQLException var2) {
            log.error("通过数据源获取数据库连接发生异常！");
            var2.printStackTrace();
        }

        return conn;
    }

    public static boolean executeBSDProcedure(String procedureName) {
        boolean flag = false;
        String sqlStr = "{call " + procedureName + "()}";
        Connection conn = makeConnection();

        try {
            CallableStatement cs = (CallableStatement) conn.prepareStatement(sqlStr);
            cs.executeUpdate(sqlStr);
            flag = true;
        } catch (SQLException var6) {
            log.error("调用存储过程" + sqlStr + "失败！");
            var6.printStackTrace();
        }

        return flag;
    }
}
