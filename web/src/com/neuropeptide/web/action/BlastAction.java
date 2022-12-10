package com.neuropeptide.web.action;

import com.neuropeptide.tools.PropertiesFactoryHelper;
import com.neuropeptide.tools.TimeStampFileName;
import com.neuropeptide.tools.WriteTXTToFASTA;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

public class BlastAction extends BaseAction {
    Logger logger = Logger.getLogger("BlastAction.class");
    private static final long serialVersionUID = -3801720856032626845L;
    PropertiesFactoryHelper propeties = PropertiesFactoryHelper.getInstance();

    public BlastAction() {
    }

    public String execute() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String blast_sequence = request.getParameter("blast_sequence");
        String evalue = request.getParameter("evalue");
        String matrix = request.getParameter("matrix");
        String TimeRandName = TimeStampFileName.getIPTimeRandName();
        String path = this.propeties.getConfig("blastworkspace");
        String fastaname = path + TimeRandName + ".fasta";
        String outname = path + TimeRandName + ".out";
        this.logger.info("fasta name: " + fastaname);
        this.logger.info("out name: " + outname);
        File filefasta = new File(fastaname);
        File fileout = new File(outname);
        if (filefasta.exists()) {
            filefasta.delete();
        }

        if (!filefasta.exists()) {
            try {
                filefasta.createNewFile();
            } catch (IOException var56) {
                this.logger.error("创建fasta文件失败");
                this.logger.error(var56.getMessage());
                this.logger.error(var56.getStackTrace());
                this.logger.error(var56.getCause());
                var56.printStackTrace();
            }

            this.logger.info(filefasta + "已创建1！");
        } else {
            filefasta.delete();

            try {
                filefasta.createNewFile();
            } catch (IOException var55) {
                var55.printStackTrace();
            }

            this.logger.info(filefasta + "已创建2！");
        }

        RandomAccessFile ranAcc = null;

        try {
            ranAcc = new RandomAccessFile(filefasta, "rw");
            ranAcc.writeBytes(blast_sequence);
        } catch (FileNotFoundException var53) {
            var53.printStackTrace();
        } catch (IOException var54) {
            var54.printStackTrace();
        } finally {
            if (ranAcc != null) {
                try {
                    ranAcc.close();
                } catch (IOException var52) {
                    var52.printStackTrace();
                }
            }

        }

        WriteTXTToFASTA dao = new WriteTXTToFASTA();
        dao.runbat(fastaname, outname, evalue, matrix);
        BufferedReader br = null;
        StringBuffer strbuffer = new StringBuffer();
        strbuffer.append("<pre>");
        Pattern pattern = Pattern.compile("NP\\d{5}");
        StringBuffer outbuffer = new StringBuffer();

        try {
            br = new BufferedReader(new FileReader(fileout));
            String data;
            if (this.hits(outname)) {
                data = "";
                int flag = 0;
                data = br.readLine();

                while (data != null) {
                    if (data.trim().length() != 0) {
                        if (data.contains(">lcl")) {
                            String a_href = data.substring(5, 12);
                            strbuffer.append("</pre><pre><a href='search_info?pepNum=" + a_href + "'>" + data + "</a><br>");
                        } else if (data.contains("Lambda")) {
                            if (flag == 0) {
                                strbuffer.append("</pre><pre>" + data + "<br>");
                                ++flag;
                            } else {
                                strbuffer.append(data + "<br>");
                            }
                        } else {
                            strbuffer.append(data + "<br>");
                        }
                    }

                    data = br.readLine();
                    if (data == null) {
                        strbuffer.append("</pre>");
                    }
                }
            } else {
                data = "";
                data = br.readLine();

                while (data != null) {
                    if (data.trim().length() != 0) {
                        strbuffer.append(data + "<br>");
                    }

                    data = br.readLine();
                    if (data == null) {
                        strbuffer.append("</pre>");
                    }
                }
            }

            Matcher matcher = pattern.matcher(strbuffer);

            while (matcher.find()) {
                matcher.appendReplacement(outbuffer, "<a href='search_info?pepNum=" + matcher.group() + "'>" + matcher.group() + "</a>");
            }

            matcher.appendTail(outbuffer);
        } catch (FileNotFoundException var58) {
            var58.printStackTrace();
        } catch (IOException var59) {
            var59.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException var51) {
                    var51.printStackTrace();
                }
            }

        }

        request.setAttribute("blast", outbuffer.toString());
        return "result";
    }

    public boolean hits(String outname) {
        BufferedReader br = null;
        boolean flag = true;

        try {
            br = new BufferedReader(new FileReader(outname));
            String data = "";

            for (int i = 28; i > 0; --i) {
                br.readLine();
            }

            data = br.readLine();
            if (data.contains("***** No hits found *****")) {
                flag = false;
            }
        } catch (FileNotFoundException var16) {
            var16.printStackTrace();
        } catch (IOException var17) {
            var17.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException var15) {
                    var15.printStackTrace();
                }
            }

        }

        return flag;
    }
}