package com.neuropeptide.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:59
 * @Description:
 */
public class ExcelToDB {
    public ExcelToDB() {
    }

    public static boolean readExcelToDB(String path) throws ParseException, IOException {
        long startTime = System.currentTimeMillis();
        Connection con = null;
        PreparedStatement pstmt = null;
        SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
        Workbook book = null;
        book = getExcelWorkbook(path);
        Sheet sheet = getSheetByNum(book, 1);
        System.out.println("sheet名称是：" + sheet.getSheetName());
        int lastRowNum = sheet.getLastRowNum();
        Row row = null;
        String accessNum = "";
        String name = "";
        String sequence = "";
        int length = 0;
        String family = "";
        String organism = "";
        String orginal_form = "";
        String uniprotNum = "";
        String source = "";
        String pdb = "";
        String modification = "";
        String sql = "insert into nptab(id, accessNum, name, sequence, length, family, organism, orginal_form, uniprotNum, source, pdb, modification) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = DBUtil.makeConnection();
            con.setAutoCommit(false);
            pstmt = con.prepareStatement(sql);

            for (int i = 1; i <= lastRowNum; ++i) {
                row = sheet.getRow(i);
                if (row != null) {
                    int lastCellNum = row.getLastCellNum();
                    Cell cell = null;

                    for (int j = 1; j < lastCellNum; ++j) {
                        cell = row.getCell(j);
                        if (cell != null) {
                            int type = cell.getCellType();
                            String value = "";
                            double lengthTemp;
                            switch (type) {
                                case 0:
                                    if (DateUtil.isCellDateFormatted(cell)) {
                                        Date date = cell.getDateCellValue();
                                        value = sFormat.format(date);
                                    } else {
                                        lengthTemp = cell.getNumericCellValue();
                                        value = String.valueOf(lengthTemp);
                                    }
                                    break;
                                case 1:
                                    value = cell.getStringCellValue();
                                    break;
                                case 2:
                                    value = cell.getCellFormula();
                                    break;
                                case 3:
                                    value = cell.getStringCellValue();
                                    break;
                                case 4:
                                    boolean tempValue = cell.getBooleanCellValue();
                                    value = String.valueOf(tempValue);
                                    break;
                                case 5:
                                    byte b = cell.getErrorCellValue();
                                    value = String.valueOf(b);
                            }

                            switch (j) {
                                case 1:
                                    accessNum = value;
                                    break;
                                case 2:
                                    name = value;
                                    break;
                                case 3:
                                    sequence = value;
                                    break;
                                case 4:
                                    lengthTemp = Double.parseDouble(value);
                                    length = (int) lengthTemp;
                                    break;
                                case 5:
                                    family = value;
                                    break;
                                case 6:
                                    organism = value;
                                    break;
                                case 7:
                                    orginal_form = value;
                                    break;
                                case 8:
                                    uniprotNum = value;
                                    break;
                                case 9:
                                    source = value;
                                    break;
                                case 10:
                                    pdb = value;
                                    break;
                                case 11:
                                    modification = value;
                            }
                        }
                    }

                    pstmt.setInt(1, i);
                    pstmt.setString(2, accessNum);
                    pstmt.setString(3, name);
                    pstmt.setString(4, sequence);
                    pstmt.setInt(5, length);
                    pstmt.setString(6, family);
                    pstmt.setString(7, organism);
                    pstmt.setString(8, orginal_form);
                    pstmt.setString(9, uniprotNum);
                    pstmt.setString(10, source);
                    pstmt.setString(11, pdb);
                    pstmt.setString(12, modification);
                    pstmt.addBatch();
                }
            }

            pstmt.executeBatch();
            con.commit();
        } catch (SQLException var30) {
            var30.printStackTrace();
            return false;
        }

        long endTime = System.currentTimeMillis();
        System.out.println("程序运行时间： " + (endTime - startTime) + "ms");
        return true;
    }

    public static Workbook getExcelWorkbook(String filePath) throws IOException {
        Workbook book = null;
        File file = null;
        FileInputStream fis = null;

        try {
            file = new File(filePath);
            if (!file.exists()) {
                throw new RuntimeException("文件不存在");
            }

            fis = new FileInputStream(file);
            book = WorkbookFactory.create(fis);
        } catch (Exception var8) {
            throw new RuntimeException(var8.getMessage());
        } finally {
            if (fis != null) {
                fis.close();
            }

        }

        return book;
    }

    public static Sheet getSheetByNum(Workbook book, int number) {
        Sheet sheet = null;

        try {
            sheet = book.getSheetAt(number - 1);
            return sheet;
        } catch (Exception var4) {
            throw new RuntimeException(var4.getMessage());
        }
    }

    public static void main(String[] args) throws ParseException, IOException {
        String path = "D:\\wholedata.xls";
        if (readExcelToDB(path)) {
            System.out.println("数据导入成功");
        } else {
            System.out.println("数据导入失败");
        }

    }
}
