package com.neuropeptide.web.action;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.service.INPBasicService;
import com.neuropeptide.service.impl.NPSearchServiceImpl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import org.apache.commons.collections.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

public class DownloadAction extends BaseAction {
    private static final long serialVersionUID = 1851932690121663235L;

    public DownloadAction() {
    }

    public String execute() throws Exception {
        return "success";
    }

    public String search() throws IOException {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String searchData = request.getParameter("data");
        String type = request.getParameter("type");
        String nptype = request.getParameter("NPtype");
        List<List> data = JSONArray.toList(JSONArray.fromObject(searchData));
        StringBuffer outputBuffer = new StringBuffer();
        List entity;
        Iterator response;
        if ("fasta".equals(type)) {
            response = data.iterator();

            while (response.hasNext()) {
                entity = (List) response.next();
                outputBuffer.append(">" + entity.get(0) + "\n" + entity.get(1) + "\n");
            }
        } else if ("full".equals(type)) {
            if("neuro".equals(nptype)){
                outputBuffer.append("ID\tSequence\tLength\tOrganism\tFamily\tName\tReceptor\n");
            }else {
                outputBuffer.append("ID\tSequence\tLength\tOrganism\tFamily\tName\tNeuropeptide\n");
            }
            response = data.iterator();

            while (response.hasNext()) {
                entity = (List) response.next();
                outputBuffer.append(entity.get(0) + "\t" + entity.get(1) + "\t" + entity.get(2) + "\t" + entity.get(3) + "\t" + entity.get(4) + "\t" + entity.get(5) + "\n");
            }
        }

        outputBuffer.deleteCharAt(outputBuffer.length() - 1);
        ByteArrayInputStream inputStream = new ByteArrayInputStream(outputBuffer.toString().getBytes());
        response = null;
        HttpServletResponse resp = ServletActionContext.getResponse();
        resp.reset();
        resp.setContentType("text/plain");
        resp.addHeader("Content-Disposition", "attachment; filename=data.txt");
        resp.setContentLength(inputStream.available());
        byte[] buf = new byte[4096];
        ServletOutputStream os = resp.getOutputStream();

        while (inputStream.read(buf) != -1) {
            os.write(buf);
        }

        inputStream.close();
        os.flush();
        os.close();
        return null;
    }

    public String browse() throws IOException {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String downloadType = request.getParameter("download_type");
        String nptype = request.getParameter("NPtype");

        INPBasicService npBasicService = (INPBasicService) this.getBean("npBasicService");
        List<NPTab> result = null;
        if (type.equals("family")) {
            result = npBasicService.getAllNPByFaimly(name);
        } else if (type.equals("organism")) {
            result = npBasicService.getAllNPByOrganism(name);
        } else if (type.equals("modification")) {
            Map<String, String> modification = new HashedMap();
            modification.put("Amidation", "Amide");
            modification.put("Acetylation", "acetyl");
            modification.put("Sulfation", "Sulfotyrosine");
            modification.put("Pyroglutamination", "Pyrrolidone carboxylic acid");
            modification.put("Phosphorylation", "Phosphoserine");
            result = npBasicService.getAllNPByModification((String) modification.get(name));
        }

        StringBuffer outputBuffer = new StringBuffer();
        NPTab entity;
        Iterator response;
        if ("fasta".equals(downloadType)) {
            response = result.iterator();

            while (response.hasNext()) {
                entity = (NPTab) response.next();
                outputBuffer.append(">" + entity.getAccessNum() + "\n" + entity.getSequence() + "\n");
            }
        } else if ("full".equals(downloadType)) {
            if("neuro".equals(nptype)){
                outputBuffer.append("ID\tSequence\tLength\tOrganism\tFamily\tName\tReceptor\n");
            }else {
                outputBuffer.append("ID\tSequence\tLength\tOrganism\tFamily\tName\tNeuropeptide\n");
            }
            response = result.iterator();

            while (response.hasNext()) {
                entity = (NPTab) response.next();
                outputBuffer.append(entity.getAccessNum() + "\t" + entity.getSequence() + "\t" + entity.getLength() + "\t" + entity.getOrganism() + "\t" + entity.getFamily() + "\t" + entity.getName() + "\t" + entity.getPmid() + "\n");
            }
        }

        outputBuffer.deleteCharAt(outputBuffer.length() - 1);
        ByteArrayInputStream inputStream = new ByteArrayInputStream(outputBuffer.toString().getBytes());
        response = null;
        HttpServletResponse resp = ServletActionContext.getResponse();
        resp.reset();
        resp.setContentType("text/plain");
        resp.addHeader("Content-Disposition", "attachment; filename=data.txt");
        resp.setContentLength(inputStream.available());
        byte[] buf = new byte[4096];
        ServletOutputStream os = resp.getOutputStream();

        while (inputStream.read(buf) != -1) {
            os.write(buf);
        }

        inputStream.close();
        os.flush();
        os.close();
        return null;
    }

    public String xml() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String urlData = request.getParameter("nueros");
        String[] accessionNumArr = urlData.split(",");
        NPSearchServiceImpl searchAcc = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        List<NPTab> neuroList = new ArrayList();

        for (int i = 0; i < accessionNumArr.length; ++i) {
            NPTab neuro = searchAcc.searchByAccNum(accessionNumArr[i]);
            neuroList.add(neuro);
        }

        HSSFWorkbook workBook = new HSSFWorkbook();
        HSSFSheet sheet = workBook.createSheet("neuropeptides");
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(1, 3000);
        sheet.setColumnWidth(2, 8000);
        sheet.setColumnWidth(3, 8000);
        sheet.setColumnWidth(4, 2000);
        sheet.setColumnWidth(5, 8000);
        sheet.setColumnWidth(6, 8000);
        HSSFRow row = sheet.createRow(0);
        HSSFCell[] cell = new HSSFCell[7];

        for (int i = 0; i < 7; ++i) {
            cell[i] = row.createCell(i);
        }

        cell[0].setCellValue("id");
        cell[1].setCellValue("accessNum");
        cell[2].setCellValue("name");
        cell[3].setCellValue("sequence");
        cell[4].setCellValue("length");
        cell[5].setCellValue("organism");
        cell[6].setCellValue("uniprotNum");
        String filename = "";
        File file = null;
        if (neuroList != null && neuroList.size() > 0) {
            for (int i = 0; i < neuroList.size(); ++i) {
                NPTab model = (NPTab) neuroList.get(i);
                HSSFRow dataRow = sheet.createRow(i + 1);
                HSSFCell[] data = new HSSFCell[7];

                for (int j = 0; j < 7; ++j) {
                    data[j] = dataRow.createCell(j);
                }

                data[0].setCellValue((double) model.getId());
                data[1].setCellValue(model.getAccessNum());
                data[2].setCellValue(model.getName());
                data[3].setCellValue(model.getSequence());
                data[4].setCellValue((double) model.getLength());
                data[5].setCellValue(model.getOrganism());

                try {
                    SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMdd_hhmmss");
                    String time = sDateFormat.format(new Date());
                    String basePath = ServletActionContext.getServletContext().getRealPath("download");
                    filename = "Neuropeptides" + time + ".xls";
                    String filePath = basePath + "\\" + filename;
                    file = new File(filePath);
                    FileOutputStream fos = new FileOutputStream(file);
                    workBook.write(fos);
                    fos.close();
                } catch (FileNotFoundException var21) {
                    var21.printStackTrace();
                } catch (IOException var22) {
                    var22.printStackTrace();
                }
            }
        }

        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        if (file.exists()) {
            response.reset();
            response.setContentType("application/x-msdownload");
            response.addHeader("Content-Disposition", "attachment; filename=" + filename);
            int fileLength = (int) file.length();
            response.setContentLength(fileLength);
            if (fileLength != 0) {
                FileInputStream inStream = new FileInputStream(file);
                byte[] buf = new byte[4096];
                ServletOutputStream os = response.getOutputStream();

                while (inStream.read(buf) != -1) {
                    os.write(buf);
                }

                inStream.close();
                os.flush();
                os.close();
            }
        }

        return null;
    }

    public String pdb() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String pdbName = request.getParameter("pdbName");
        String basePath = ServletActionContext.getServletContext().getRealPath("jmol\\pdb");
        String filePath = basePath + "\\" + pdbName;
        File file = new File(filePath);
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        if (file.exists()) {
            response.reset();
            response.setContentType("application/x-msdownload");
            response.addHeader("Content-Disposition", "attachment; filename=" + pdbName);
            int fileLength = (int) file.length();
            response.setContentLength(fileLength);
            if (fileLength != 0) {
                FileInputStream inStream = new FileInputStream(file);
                byte[] buf = new byte[4096];
                ServletOutputStream os = response.getOutputStream();

                while (inStream.read(buf) != -1) {
                    os.write(buf);
                }

                inStream.close();
                os.flush();
                os.close();
            }
        }

        return null;
    }
}

