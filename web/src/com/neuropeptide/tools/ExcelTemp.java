package com.neuropeptide.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * @Auther: engow
 * @Date: 2019/11/1 15:58
 * @Description:
 */
public class ExcelTemp {
    public ExcelTemp() {
    }

    public static void compExcel(String path) throws IOException {
        SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
        Workbook book = null;
        book = getExcelWorkbook(path);
        Sheet sheet = getSheetByNum(book, 1);
        int lastRowNum = sheet.getLastRowNum();
        Row row = null;
        List<String> list1 = new ArrayList();
        List<String> list2 = new ArrayList();
        List<String> list3 = new ArrayList();
        List<String> list4 = new ArrayList();
        List<String> list5 = new ArrayList();
        int countMesh = 0;
        int countChen = 0;

        int i;
        for (i = 0; i <= lastRowNum; ++i) {
            row = sheet.getRow(i);
            if (row != null) {
                int lastCellNum = row.getLastCellNum();
                Cell cell = null;

                for (int j = 0; j < lastCellNum; ++j) {
                    cell = row.getCell(j);
                    if (cell != null) {
                        int type = cell.getCellType();
                        String value = "";
                        switch (type) {
                            case 0:
                                if (DateUtil.isCellDateFormatted(cell)) {
                                    Date date = cell.getDateCellValue();
                                    value = sFormat.format(date);
                                } else {
                                    double tempValue = cell.getNumericCellValue();
                                    value = String.valueOf(tempValue);
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
                            case 0:
                                list1.add(value.toLowerCase());
                                break;
                            case 1:
                                String[] str = value.toLowerCase().split(";");
                                list2.add(str[0]);
                                break;
                            case 2:
                                list3.add(value.toLowerCase());
                        }
                    }
                }
            }
        }

        int notChen;
        for (i = 0; i < list2.size(); ++i) {
            for (notChen = 0; notChen < list1.size(); ++notChen) {
                if (((String) list1.get(notChen)).contains((CharSequence) list2.get(i))) {
                    ++countMesh;
                    break;
                }
            }
        }

        int j;
        for (i = 0; i < list2.size(); ++i) {
            notChen = 0;

            for (j = 0; j < list1.size(); ++j) {
                if (!((String) list1.get(j)).contains((CharSequence) list2.get(i))) {
                    ++notChen;
                }
            }

            if (notChen == list1.size()) {
                list4.add((String) list2.get(i));
            }
        }

        for (i = 0; i < list3.size(); ++i) {
            for (notChen = 0; notChen < list1.size(); ++notChen) {
                if (((String) list1.get(notChen)).contains((CharSequence) list3.get(i))) {
                    ++countChen;
                    break;
                }
            }
        }

        for (i = 0; i < list3.size(); ++i) {
            notChen = 0;

            for (j = 0; j < list1.size(); ++j) {
                if (!((String) list1.get(j)).contains((CharSequence) list3.get(i))) {
                    ++notChen;
                }
            }

            if (notChen == list1.size()) {
                list5.add((String) list3.get(i));
            }
        }

        System.out.println(countMesh);
        System.out.println(countChen);
        System.out.println(list4.toString());
        System.out.println(list5.toString());
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
        String path = "D:\\person.xls";
        compExcel(path);
    }
}

