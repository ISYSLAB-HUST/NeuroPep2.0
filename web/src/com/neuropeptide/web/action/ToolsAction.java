package com.neuropeptide.web.action;

import com.neuropeptide.service.impl.NPSearchServiceImpl;
import com.neuropeptide.tools.PropertiesFactoryHelper;
import com.neuropeptide.tools.TimeStampFileName;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;

@Controller
public class ToolsAction extends BaseAction {
    PropertiesFactoryHelper propeties = PropertiesFactoryHelper.getInstance();
    Logger logger = Logger.getLogger("ToolsAction.class");
    private File upfile;
    private String muti_sequence;
    private String upfileContentType;
    private String upfileFileName;

    public ToolsAction() {
    }

    public String map() throws IOException {
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String map_sequence = request.getParameter("map_sequence");
        if (map_sequence.startsWith(">")) {
            map_sequence = map_sequence.substring(map_sequence.indexOf(10) + 1);
        }

        map_sequence = map_sequence.replaceAll("\\s", "");
        String hql = "select new list( t.accessNum, t.sequence, t.length ,t.organism,t.family,t.name) from com.neuropeptide.entity.NPTab t";
        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List<List> listEntity = manager.search(hql);
        List<List> result = new ArrayList();
        Iterator var10 = listEntity.iterator();

        while (var10.hasNext()) {
            List entity = (List) var10.next();
            String seq = (String) entity.get(1);
//            int start = true;
            int start;
            if ((start = map_sequence.indexOf(seq)) > 0) {
                List enti = new ArrayList(entity);
                enti.add(start);
                result.add(enti);
            }
        }

        ObjectMapper objectMapper = new ObjectMapper();
        out.write(objectMapper.writeValueAsString(result));
        out.flush();
        out.close();
        return null;
    }

    public String clustalw() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String multiSequence = request.getParameter("muti_sequence");
        String inputFileName = "clustalw2-" + TimeStampFileName.getIPTimeRandName() + ".input";
        String outputFileName = inputFileName.replace("input", "output");
        String guideTreeFileName = inputFileName.replace("input", "dnd");
        String clustalwWorkspace = this.propeties.getConfig("clustalw-workspace");
        this.logger.info("clustaw-worksapce:" + clustalwWorkspace);
        File inputFile = new File(clustalwWorkspace, inputFileName);

        try {
            if (this.upfile != null && this.upfile.exists()) {
                FileUtils.copyFile(this.upfile, inputFile);
            }
        } catch (IOException var74) {
            this.logger.error("拷贝文件出错");
            var74.printStackTrace();
        }

        if (!inputFile.exists()) {
            try {
                inputFile.createNewFile();
            } catch (IOException var73) {
                this.logger.error("创建文件'" + inputFileName + "'失败");
                var73.printStackTrace();
            }

            FileWriter fw = null;

            try {
                fw = new FileWriter(inputFile);
            } catch (IOException var72) {
                this.logger.error("读取文件'" + inputFileName + "'失败");
                var72.printStackTrace();
            }

            try {
                fw.write(multiSequence);
            } catch (IOException var70) {
                this.logger.error("向文件'" + inputFileName + "'写入数据失败");
                var70.printStackTrace();
            } finally {
                try {
                    fw.close();
                } catch (IOException var68) {
                    var68.printStackTrace();
                }

            }
        }

        String cmd = "clustalw2 -infile=" + clustalwWorkspace + inputFileName + " -outfile=" + clustalwWorkspace + outputFileName;
        this.logger.info("执行命令：" + cmd);
        Runtime runtime = Runtime.getRuntime();
        Process process = null;

        try {
            StringBuffer errorinfo = new StringBuffer();
            process = runtime.exec(cmd);
            int exitValue = process.waitFor();
            BufferedReader processOutput = new BufferedReader(new InputStreamReader(process.getInputStream()));
            BufferedReader processError = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String line = null;
            if (exitValue != 0) {
                while ((line = processError.readLine()) != null) {
                    errorinfo.append(line);
                }

                if (errorinfo.length() < 1) {
                    errorinfo.append("ERROR: Wrong FASTA format!");
                }

                request.setAttribute("error", errorinfo.toString());
                return "clustalw-error";
            }

            while ((line = processOutput.readLine()) != null) {
                if (line.contains("Only 1 sequence")) {
                    request.setAttribute("error", "Error: Only 1 sequence, cannot do multiple alignment!");
                    return "clustalw-error";
                }
            }
        } catch (IOException var78) {
            var78.printStackTrace();
        } catch (InterruptedException var79) {
            var79.printStackTrace();
        } finally {
            process.destroy();
        }

        File outFile = new File(clustalwWorkspace, outputFileName);
        File treeFile = new File(clustalwWorkspace, guideTreeFileName);
        StringBuffer output = new StringBuffer();
        StringBuffer guideTree = new StringBuffer();
        output.append("<pre>");
        guideTree.append("<pre>");
        BufferedReader outfileReader = null;
        BufferedReader treefileReader = null;

        try {
            outfileReader = new BufferedReader(new FileReader(outFile));
            treefileReader = new BufferedReader(new FileReader(treeFile));
            String tmp = "";

            while ((tmp = outfileReader.readLine()) != null) {
                output.append(tmp + "<br />");
            }

            output.append("</pre>");

            while ((tmp = treefileReader.readLine()) != null) {
                guideTree.append(tmp + "<br />");
            }

            guideTree.append("</pre>");
        } catch (FileNotFoundException var75) {
            this.logger.error("没有生成输出文件:'" + outputFileName + "'");
            var75.printStackTrace();
        } catch (IOException var76) {
            var76.printStackTrace();
        } finally {
            try {
                outfileReader.close();
                treefileReader.close();
            } catch (IOException var69) {
                var69.printStackTrace();
            }

        }

        request.setAttribute("outfile", output.toString());
        request.setAttribute("tree", guideTree.toString());
        return "clustalw";
    }

    public File getUpfile() {
        return this.upfile;
    }

    public void setUpfile(File upfile) {
        this.upfile = upfile;
    }

    public String getUpfileContentType() {
        return this.upfileContentType;
    }

    public void setUpfileContentType(String upfileContentType) {
        this.upfileContentType = upfileContentType;
    }

    public String getUpfileFileName() {
        return this.upfileFileName;
    }

    public void setUpfileFileName(String upfileFileName) {
        this.upfileFileName = upfileFileName;
    }

    public String getMuti_sequence() {
        return this.muti_sequence;
    }

    public void setMuti_sequence(String muti_sequence) {
        this.muti_sequence = muti_sequence;
    }
}


