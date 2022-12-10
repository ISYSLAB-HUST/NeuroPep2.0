package com.neuropeptide.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

/**
 * @Auther: engow
 * @Date: 2019/11/1 16:05
 * @Description:
 */
public class WriteTXTToFASTA {
    Logger logger = Logger.getLogger("WriteTXTToFASTA.class");
    PropertiesFactoryHelper propeties = PropertiesFactoryHelper.getInstance();
    private String nrpath;
    private String path;
    private File filefasta;
    private File filename;

    public WriteTXTToFASTA() {
        this.nrpath = this.propeties.getConfig("nrdb");
        this.path = this.propeties.getConfig("nrtxt");
        this.filefasta = new File(this.nrpath);
        this.filename = new File(this.path);
    }

    public void creatTxtFile() throws IOException {
        if (this.filefasta.exists()) {
            this.filefasta.delete();
        }

        if (!this.filename.exists()) {
            this.filename.createNewFile();
            System.err.println(this.filename + "已创建！");
        } else {
            this.filename.delete();
            this.filename.createNewFile();
            System.err.println(this.filename + "已创建！");
        }

    }

    public void writeTXT() throws IOException {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select accessNum, name, sequence from nptab";
        con = DBUtil.makeConnection();
        RandomAccessFile ranAcc = null;

        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            ranAcc = new RandomAccessFile(this.filename, "rw");

            while (rs.next()) {
                String accessNum = rs.getString("accessNum");
                String name = rs.getString("name");
                String sequence = rs.getString("sequence");
                String filein = ">" + accessNum + "\r\n" + sequence + "\r\n";
                ranAcc.writeBytes(filein);
            }

            System.out.println("txt文件写入已完成！");
        } catch (SQLException var13) {
            var13.printStackTrace();
        } finally {
            if (ranAcc != null) {
                ranAcc.close();
            }

        }

    }

    public void txtTofasta() {
        File file = new File(this.path);
        String filename = file.getAbsolutePath();
        if (filename.indexOf(".") >= 0) {
            filename = filename.substring(0, filename.lastIndexOf("."));
        }

        file.renameTo(new File(filename + ".fasta"));
        System.out.println("fasta文件生成成功！");
    }

    public void runbat(String filefasta, String fileout, String evalue, String matrix) {
        String cmd = "blastp -task blastp -evalue " + evalue + " -matrix " + matrix + " -query " + filefasta + " -db " + this.nrpath + " -out " + fileout;
        this.logger.info("执行blast命令: " + cmd);
        Runtime runtime = Runtime.getRuntime();
        Process child = null;

        try {
            child = runtime.exec(cmd);
            InputStream in = child.getInputStream();
            String output = null;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in));

            for (output = bufferedReader.readLine(); output != null; output = bufferedReader.readLine()) {
                System.out.println(output);
            }

            try {
                child.waitFor();
            } catch (InterruptedException var16) {
                var16.printStackTrace();
            }
        } catch (IOException var17) {
            var17.printStackTrace();
        } finally {
            child.destroy();
        }

        System.out.println("sh文件运行成功！");
    }
}

