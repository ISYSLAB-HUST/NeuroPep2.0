package com.neuropeptide.web.dwr;

import com.neuropeptide.tools.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.sf.json.JSONArray;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:55
 * @Description:
 */
public class NeuropeptideDWR {
    public NeuropeptideDWR() {
    }

    public String getMyName() {
        System.out.println("Hello DWR");
        return "Hello NeuropeptideDWR!";
    }

    public String get_updateTime() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String update = "";
        String sql = "select update_time from userinfo where id=1";
        con = DBUtil.makeConnection();

        try {
            st = con.createStatement();

            for (rs = st.executeQuery(sql); rs.next(); update = rs.getString(1)) {
            }
        } catch (SQLException var7) {
            var7.printStackTrace();
        }

        return update;
    }

    public String get_organism() throws IOException {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        JSONArray organisms = new JSONArray();
        String sql = "select distinct organism from nptab";
        con = DBUtil.makeConnection();

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                organisms.add(rs.getString(1));
            }
        } catch (SQLException var7) {
            var7.printStackTrace();
        }

        return organisms.toString();
    }
}
