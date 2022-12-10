package com.neuropeptide.tools;

import com.neuropeptide.entity.NPTab;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:56
 * @Description:
 */
public class DBToExcel {
    public DBToExcel() {
    }

    public static Map<Object, Object> QueryNP() {
        Map<Object, Object> map = new HashMap();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from nptab";
        con = DBUtil.makeConnection();
        List<NPTab> tabList = new ArrayList();
        List<String> columnList = new ArrayList();
        int colNum = 0;

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            ResultSetMetaData metadata = rs.getMetaData();

            while (rs.next()) {
                NPTab model = new NPTab();
                model.setId(rs.getInt(1));
                model.setAccessNum(rs.getString(2));
                model.setName(rs.getString(3));
                model.setSequence(rs.getString(4));
                model.setLength(rs.getInt(5));
                model.setOrganism(rs.getString(6));
                tabList.add(model);
            }

            colNum = metadata.getColumnCount();

            for (int i = 1; i <= colNum; ++i) {
                columnList.add(metadata.getColumnName(i));
            }
        } catch (SQLException var10) {
            var10.printStackTrace();
        }

        map.put("tabList", tabList);
        map.put("columnList", columnList);
        map.put("colNum", colNum);
        return map;
    }

    public void CreateExcel() {
        HSSFWorkbook workBook = new HSSFWorkbook();
        HSSFSheet sheet = workBook.createSheet("第一页");
        Map<Object, Object> map = QueryNP();
        HSSFRow row = sheet.createRow(0);
        int colNum = (Integer) map.get("colNum");
        List<String> columnList = (List) map.get("columnList");
        HSSFCell[] cell = new HSSFCell[colNum];

        for (int i = 0; i < colNum; ++i) {
            cell[i] = row.createCell(i);
            cell[i].setCellValue((String) columnList.get(i));
        }

        List<NPTab> list = (List) map.get("tabList");
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); ++i) {
                NPTab model = (NPTab) list.get(i);
                HSSFRow dataRow = sheet.createRow(i + 1);
                HSSFCell[] data = new HSSFCell[colNum];

                for (int j = 0; j < colNum; ++j) {
                    data[j] = dataRow.createCell(j);
                }

                data[0].setCellValue((double) model.getId());
                data[1].setCellValue(model.getAccessNum());
                data[2].setCellValue(model.getName());
                data[3].setCellValue(model.getSequence());
                data[4].setCellValue((double) model.getLength());
                data[5].setCellValue(model.getOrganism());

                try {
                    File file = new File("D:\\data.xls");
                    FileOutputStream fos = new FileOutputStream(file);
                    workBook.write(fos);
                    fos.close();
                } catch (FileNotFoundException var15) {
                    var15.printStackTrace();
                } catch (IOException var16) {
                    var16.printStackTrace();
                }
            }
        }

    }

    public static void main(String[] args) {
        DBToExcel dao = new DBToExcel();
        dao.CreateExcel();
        System.out.println("成功导入数据到excel中");
    }
}