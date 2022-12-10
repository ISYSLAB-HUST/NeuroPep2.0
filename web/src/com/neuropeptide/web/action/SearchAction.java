package com.neuropeptide.web.action;

import com.neuropeptide.dao.IReceptorDao;
import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.UserInfo;
import com.neuropeptide.service.IReceptorService;
import com.neuropeptide.service.impl.NPBasicService;
import com.neuropeptide.service.impl.NPSearchServiceImpl;
import com.neuropeptide.service.impl.ReceptorServiceImpl;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.eclipse.jetty.util.log.Log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchAction extends BaseAction {
    Logger logger = Logger.getLogger(SearchAction.class);
    private static final long serialVersionUID = -2885410404327954941L;

    public SearchAction() {
    }

    public String execute() throws Exception {
        /*HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("protype","receptor");*/
        return "success";
    }

    public String display() {
        NPBasicService npBasicService = (NPBasicService) this.getBean("NPBasicService");
        HttpServletRequest request = ServletActionContext.getRequest();
        List<String> family = npBasicService.getAllFamily();
        List<String> organism = npBasicService.getAllOrganism();

        int i;
        for (i = 0; i < family.size(); ++i) {
            family.set(i, '"' + (String) family.get(i) + '"');
        }

        for (i = 0; i < organism.size(); ++i) {
            organism.set(i, '"' + (String) organism.get(i) + '"');
        }

        request.setAttribute("family", family);
        request.setAttribute("organism", organism);
        return "success";
    }

    public String result() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String accession_number = request.getParameter("accession_number").toUpperCase();
        String name = request.getParameter("name");
        String length_from = request.getParameter("length_from");
        String length_to = request.getParameter("length_to");
        String mw_from = request.getParameter("mw_from");
        String mw_to = request.getParameter("mw_to");
        String pi_from = request.getParameter("pi_from");
        String pi_to = request.getParameter("pi_to");
        String organism_group = request.getParameter("organism_group");
        String family_group = request.getParameter("family_group");
        String uniprot = request.getParameter("uniprot");
        String sourceTem = request.getParameter("source");
        String aminoacid = request.getParameter("aminoacid").toUpperCase();
        String[] sourceArr = sourceTem.split(",");
        String sourceStr = "( ";

        for (int i = 0; i < sourceArr.length; ++i) {
            sourceStr = sourceStr + "'" + sourceArr[i] + "', ";
        }

        String source = sourceStr.substring(0, sourceStr.length() - 2);
        source = source + ")";
        System.out.println(source);
        String searchStrTemp = "";
        String searchStr = "";
        if (accession_number != null && accession_number.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "accessNum = '" + accession_number + "' and ";
        }

        if (source != null && source.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "source in " + source + " and ";
        }

        if (name != null && name.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "name = '" + name + "' and ";
        }

        if (organism_group != null && organism_group.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "organism = '" + organism_group + "' and ";
        }

        if (family_group != null && family_group.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "family = '" + family_group + "' and ";
        }

        if (length_from != null && length_from.length() > 0) {
            searchStrTemp = searchStrTemp + "length >= " + length_from + " and ";
        }

        if (length_to != null && length_to.length() > 0) {
            searchStrTemp = searchStrTemp + "length <= " + length_to + " and ";
        }

        if (mw_from != null && mw_from.length() > 0) {
            searchStrTemp = searchStrTemp + "mw >= " + mw_from + " and ";
        }

        if (mw_to != null && mw_to.length() > 0) {
            searchStrTemp = searchStrTemp + "mw <= " + mw_to + " and ";
        }

        if (pi_from != null && pi_from.length() > 0) {
            searchStrTemp = searchStrTemp + "pi >= " + pi_from + " and ";
        }

        if (pi_to != null && pi_to.length() > 0) {
            searchStrTemp = searchStrTemp + "pi <= " + pi_to + " and ";
        }

        if (uniprot != null && uniprot.trim().length() != 0) {
            searchStrTemp = searchStrTemp + "uniprotNum = '" + uniprot + "' and ";
        }

        String sequence;
        if (aminoacid != null && aminoacid.trim().length() != 0) {
            sequence = "";
            if (aminoacid.contains("*")) {
                sequence = aminoacid.replace("*", "%");
            } else {
                sequence = aminoacid;
            }

            searchStrTemp = searchStrTemp + "sequence like '%" + sequence + "%' and ";
        }

        if (searchStrTemp != null && searchStrTemp.trim().length() != 0) {
            searchStr = searchStrTemp.substring(0, searchStrTemp.length() - 5);
        }

        sequence = "select t.sequence, t.family, t.organism, t.name, t.modification,t.source,t.accessNum from com.neuropeptide.entity.NPTab t where " + searchStr;
        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List listEntity = manager.search(sequence);
        JSONArray jsonArray = JSONArray.fromObject(listEntity);
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.write(jsonArray.toString());
        out.flush();
        out.close();
        return null;
    }

    public String info() throws Exception {
        IReceptorService receptorService = (IReceptorService) this.getBean("receptorService");
//        System.out.println(receptorService.listByEntryName("GASR_BOVIN"));
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String pepNum = request.getParameter("pepNum").toUpperCase();
        String hql = "from com.neuropeptide.entity.NPTab t where t.accessNum = '" + pepNum + "'";
        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List list = manager.search(hql);
        if (list.isEmpty()) {
            return "404";
        } else {
            NPTab result = (NPTab) list.get(0);
            String aacompostion=this.getAacompostion(result.getSequence());
            result.setTaxa_ID(result.getTaxa_ID());
            result.setTissueSpecifity(result.getTISSUE_SPECIFITY());
            List<Map<String, Object>> nodes = new ArrayList<>();
            List<Map<String, Object>> lines = new ArrayList<>();
            if (!result.getReceptor().equals("NA")) {

                Map<String, Object> node = new HashMap<>();
                node.put("name", result.getAccessNum());
                node.put("value", 0);
                nodes.add(node);
                String[] arr = result.getReceptor().split("#");
                for (String receptor : arr) {

                    node = new HashMap<>();
                    node.put("name", receptor);
                    node.put("value", 1);
                    nodes.add(node);

                    Map<String, Object> line = new HashMap<>();
                    line.put("source", result.getAccessNum());
                    line.put("traget", receptor);
                    lines.add(line);

                    hql = "from com.neuropeptide.entity.NPTab t where t.receptor like '%" + receptor + "%'";
                    List list1 = manager.search(hql);
                    for (Object o : list1) {
                        NPTab npTab = (NPTab) o;
                        node = new HashMap<>();
                        node.put("name", npTab.getAccessNum());
                        node.put("value", 0);
                        nodes.add(node);

                        line = new HashMap<>();
                        line.put("source", npTab.getAccessNum());
                        line.put("traget", receptor);
                        lines.add(line);
                    }


                }

                result.setReceptorList(receptorService.listByEntryName(result.getReceptor()));
            }

            ObjectMapper objectMapper = new ObjectMapper();

            result.setNodes(nodes);
            result.setLines(lines);

            result.setNodesStr(objectMapper.writeValueAsString(nodes));
            result.setLinesStr(objectMapper.writeValueAsString(lines));
            result.setReceptorListStr(objectMapper.writeValueAsString(receptorService.listByEntryName(result.getReceptor())));


            request.setAttribute("info", result);
            request.setAttribute("aacompostion",aacompostion);
            return "info";
        }
    }

    public String subDetail() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        UserInfo sessionUser = (UserInfo) request.getSession().getAttribute("user");
        if (sessionUser != null && sessionUser.getUsername() != null && sessionUser.getPassword() != null) {
            String subID = request.getParameter("subID");
            String hql = "from com.neuropeptide.entity.SubTab t where t.id = '" + subID + "'";
            NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
            new ArrayList();
            List list = manager.search(hql);
            request.setAttribute("subDetail", list.get(0));
            return "subDetail";
        } else {
            return "submission";
        }
    }
    public String getAacompostion(String seq){
        float[] freq = new float[20];

        for (int i = 0; i < seq.length(); ++i) {
            char aa = seq.charAt(i);
            int var10002;
            switch (aa) {
                case 'A':
                    var10002 = (int) freq[0]++;
                case 'B':
                case 'J':
                case 'O':
                case 'U':
                case 'X':
                default:
                    break;
                case 'C':
                    var10002 = (int) freq[1]++;
                    break;
                case 'D':
                    var10002 = (int) freq[2]++;
                    break;
                case 'E':
                    var10002 = (int) freq[3]++;
                    break;
                case 'F':
                    var10002 = (int) freq[4]++;
                    break;
                case 'G':
                    var10002 = (int) freq[5]++;
                    break;
                case 'H':
                    var10002 = (int) freq[6]++;
                    break;
                case 'I':
                    var10002 = (int) freq[7]++;
                    break;
                case 'K':
                    var10002 = (int) freq[8]++;
                    break;
                case 'L':
                    var10002 = (int) freq[9]++;
                    break;
                case 'M':
                    var10002 = (int) freq[10]++;
                    break;
                case 'N':
                    var10002 = (int) freq[11]++;
                    break;
                case 'P':
                    var10002 = (int) freq[12]++;
                    break;
                case 'Q':
                    var10002 = (int) freq[13]++;
                    break;
                case 'R':
                    var10002 = (int) freq[14]++;
                    break;
                case 'S':
                    var10002 = (int) freq[15]++;
                    break;
                case 'T':
                    var10002 = (int) freq[16]++;
                    break;
                case 'V':
                    var10002 = (int) freq[17]++;
                    break;
                case 'W':
                    var10002 = (int) freq[18]++;
                    break;
                case 'Y':
                    var10002 = (int) freq[19]++;
            }
        }

        DecimalFormat df = new DecimalFormat("##.#");
        System.out.println(seq.length());

        for (int i = 0; i < freq.length; ++i) {
            freq[i] = Float.parseFloat(df.format((double) (freq[i] / (float) seq.length() * 100.0F)));
        }

        ObjectMapper mapper = new ObjectMapper();
        String aacompostion = null;

        try {
            aacompostion = mapper.writeValueAsString(freq);
        } catch (JsonGenerationException var8) {
            var8.printStackTrace();
        } catch (JsonMappingException var9) {
            var9.printStackTrace();
        } catch (IOException var10) {
            var10.printStackTrace();
        }
        return aacompostion;
    }

    public String analyze() {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String seq = request.getParameter("SEQ");

        float[] freq = new float[20];

        for (int i = 0; i < seq.length(); ++i) {
            char aa = seq.charAt(i);
            int var10002;
            switch (aa) {
                case 'A':
                    var10002 = (int) freq[0]++;
                case 'B':
                case 'J':
                case 'O':
                case 'U':
                case 'X':
                default:
                    break;
                case 'C':
                    var10002 = (int) freq[1]++;
                    break;
                case 'D':
                    var10002 = (int) freq[2]++;
                    break;
                case 'E':
                    var10002 = (int) freq[3]++;
                    break;
                case 'F':
                    var10002 = (int) freq[4]++;
                    break;
                case 'G':
                    var10002 = (int) freq[5]++;
                    break;
                case 'H':
                    var10002 = (int) freq[6]++;
                    break;
                case 'I':
                    var10002 = (int) freq[7]++;
                    break;
                case 'K':
                    var10002 = (int) freq[8]++;
                    break;
                case 'L':
                    var10002 = (int) freq[9]++;
                    break;
                case 'M':
                    var10002 = (int) freq[10]++;
                    break;
                case 'N':
                    var10002 = (int) freq[11]++;
                    break;
                case 'P':
                    var10002 = (int) freq[12]++;
                    break;
                case 'Q':
                    var10002 = (int) freq[13]++;
                    break;
                case 'R':
                    var10002 = (int) freq[14]++;
                    break;
                case 'S':
                    var10002 = (int) freq[15]++;
                    break;
                case 'T':
                    var10002 = (int) freq[16]++;
                    break;
                case 'V':
                    var10002 = (int) freq[17]++;
                    break;
                case 'W':
                    var10002 = (int) freq[18]++;
                    break;
                case 'Y':
                    var10002 = (int) freq[19]++;
            }
        }

        DecimalFormat df = new DecimalFormat("##.#");
        System.out.println(seq.length());

        for (int i = 0; i < freq.length; ++i) {
            freq[i] = Float.parseFloat(df.format((double) (freq[i] / (float) seq.length() * 100.0F)));
        }

        ObjectMapper mapper = new ObjectMapper();
        String aacompostion = null;

        try {
            aacompostion = mapper.writeValueAsString(freq);
        } catch (JsonGenerationException var8) {
            var8.printStackTrace();
        } catch (JsonMappingException var9) {
            var9.printStackTrace();
        } catch (IOException var10) {
            var10.printStackTrace();
        }

        request.setAttribute("aacompostion", aacompostion);
        return "success";
    }

    //search_basic
    public String basic() throws Exception {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String field = request.getParameter("field");
        String text = request.getParameter("text");
        String searchStr = "";
        if (field.equals("organism") ||
            field.equals("family") ||
            field.equals("name") ||
            field.equals("sequence") ||
            field.equals("pubmedId") ||
            field.equals("receptor")) {
            searchStr = field + " like " + " '%" + text + "%'";
        } else {
            searchStr = field + " = " + "'" + text + "'";
        }

        String hql = "select t.accessNum, t.sequence, t.length, t.organism,t.family,t.name, t.receptorIds,t.pmid from com.neuropeptide.entity.NPTab t where " + searchStr;
        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List listEntity = manager.search(hql);
        System.out.println(listEntity);
        JSONArray jsonArray = JSONArray.fromObject(listEntity);
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(jsonArray.toString());
        out.flush();
        out.close();
        return null;
    }

    public String advanced() throws IOException {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String searchStr = "";
        String queryString = request.getParameter("queryString");
        String category = request.getParameter("queryCategory");
        if (queryString.startsWith("AND")) {
            queryString = queryString.substring(4);
        }

        if (queryString.startsWith("OR")) {
            queryString = queryString.substring(3);
        }

        String[] querys = queryString.split("\\$");

        for (int i = 0; i < querys.length; ++i) {
            searchStr = searchStr + this.makeSearchCondition(querys[i]);
        }
        String hql = "";
        if (category.equals("neuro")) {
            hql = "select t.accessNum, t.sequence, t.length, t.organism,t.family,t.name, t.modification,t.pmid from com.neuropeptide.entity.NPTab t where " + searchStr;
        }else if (category.equals("Receptor")){
            hql = "select t.accessNum, t.sequence, t.organism,t.family,t.name, t.modification,t.phyla from com.neuropeptide.entity.ReceptorNew t where " + searchStr;
        }


        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List listEntity = manager.search(hql);
        JSONArray jsonArray = JSONArray.fromObject(listEntity);
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.write(jsonArray.toString());
        out.flush();
        out.close();
        return null;
    }


    public String newAdvanced() throws IOException {
        HttpServletRequest request = null;
        request = ServletActionContext.getRequest();
        String searchStr = "";
        String queryString = request.getParameter("queryString");
        String categoey = request.getParameter("queryCategoey");

        System.out.println(queryString);
        System.out.println(categoey);
//        if (queryString.startsWith("AND")) {
//            queryString = queryString.substring(4);
//        }

        /*if (queryString.startsWith("OR")) {
            queryString = queryString.substring(3);
        }*/

        String[] querys = queryString.split("\\$");

        for (int i = 0; i < querys.length; ++i) {
            searchStr = searchStr + this.newMakeSearchCondition(querys[i]);
        }
        // System.out.println(searchStr);
//        if (searchStr.startsWith(" AND")) {
//            searchStr = searchStr.substring(5);
//        }
        searchStr = "1=1" + searchStr;
        System.out.println(searchStr);
        String hql = "";
        if (categoey.equals("neuro")) {
            hql = "select t.accessNum, t.sequence, t.length, t.organism,t.family,t.name, t.receptorIds,t.pmid from com.neuropeptide.entity.NPTab t where " + searchStr;
        }else if (categoey.equals("Receptor")){
            hql = "select t.accessNum, t.sequence, t.length,t.organism,t.family,t.name,t.np_ids from com.neuropeptide.entity.ReceptorNew t where " + searchStr;
        }
        NPSearchServiceImpl manager = (NPSearchServiceImpl) this.getBean("searchNeuropeptide");
        new ArrayList();
        List listEntity = manager.search(hql);
        JSONArray jsonArray = JSONArray.fromObject(listEntity);
        HttpServletResponse response = null;
        response = ServletActionContext.getResponse();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.write(jsonArray.toString());
        out.flush();
        out.close();
        return null;

    }

    private String makeSearchCondition(String query) {
        String[] condition = query.split("%");
        String searchStr = "";
        String op = "";
        String field = "";
        String text = "";
        if (condition.length == 2) {
            field = condition[0];
            text = condition[1];
        } else {
            op = condition[0];
            field = condition[1];
            text = condition[2];
        }

        if (!op.equals("")) {
            searchStr = searchStr + " " + op + " ";
        }

        if (!field.equals("organism") && !field.equals("family") && !field.equals("name")) {
            if (text.contains(":")) {
                String fonter = text.substring(0, text.indexOf(58)).trim();
                String later = text.substring(text.indexOf(58) + 1).trim();
                if (fonter.equals("") && later.equals("")) {
                    return "";
                }

                if (!fonter.equals("") && !later.equals("")) {
                    searchStr = searchStr + field + " between " + fonter + " AND " + later;
                }

                if (fonter.equals("")) {
                    searchStr = searchStr + field + " <= " + later;
                }

                if (later == null || later.equals("")) {
                    searchStr = searchStr + field + " >= " + fonter;
                }
            } else {
                searchStr = searchStr + field + " = " + text;
            }
        } else {
            searchStr = searchStr + field + " like " + "'%" + text + "%'";
        }

        return searchStr;
    }

    private String newMakeSearchCondition(String query) {
        String[] condition = query.split("#");
        String searchStr = "";
        String op = "";
        op = condition[0];
        String field = "";
        String[] condition1 = condition[1].split("%");
        field = condition1[0];
        String text = "";
        if(condition1.length==0){
            text = "";
        }else if(condition1.length ==2){
            text = condition1[1];
        }
        // 数据范围在[min,max]
        int max = 0;
        int min = 0;
        if(field.equals("length")||field.equals("mw")||field.equals("pi")){
            String[] range = text.split("-");
            max = Integer.parseInt(range[1]);
            min = Integer.parseInt(range[0]);
        }
//        if (!op.equals("")) {
//            searchStr = searchStr + " " + op + " ";
//        }
        if(field.equals("length")||field.equals("mw")||field.equals("pi")){
            searchStr = " " + op + " "+field+" between"+" "+ min + " and "+" "+max;
        }else if(field.equals("Name")){
            searchStr = " " + op + " "+field + " like " + " '%" + text + "%'";
        }else {
            searchStr = " " + op + " "+field+"="+"'" + text + "'";
        }
        System.out.println("test---"+searchStr);
        return searchStr;
//        String nprid = "accessNum";
//        if (condition.length == 2) {
//            field = condition[0];
//            text = condition[1];
//        } else {
//            op = condition[0];
//            field = condition[1];
//            text = condition[2];
//        }

//        if (!op.equals("")) {
//            searchStr = searchStr + " " + op + " ";
//        }

        /*if (!field.equals("organism") && !field.equals("family") && !field.equals("name")) {
            if (text.contains(":")) {
                String fonter = text.substring(0, text.indexOf(58)).trim();
                String later = text.substring(text.indexOf(58) + 1).trim();
                if (fonter.equals("") && later.equals("")) {
                    return "";
                }

                if (!fonter.equals("") && !later.equals("")) {
                    searchStr = searchStr + field + " between " + fonter + " AND " + later;
                }

                if (fonter.equals("")) {
                    searchStr = searchStr + field + " <= " + later;
                }

                if (later == null || later.equals("")) {
                    searchStr = searchStr + field + " >= " + fonter;
                }
            } else {
                searchStr = searchStr + field + " = " + text;
            }
        }else */
//        if (field.equals("NPRID")){
//            searchStr = searchStr + nprid + "=" + "'" + text + "'";
//        } else {
//            searchStr = searchStr + field + " like " + "'%" + text + "%'";
//        }

        // return searchStr;
    }
}

