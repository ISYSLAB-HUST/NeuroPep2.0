package com.neuropeptide.service;

import com.neuropeptide.entity.NPTab;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Produces({"application/xml", "application/json"})
public interface INPService {
    @GET
    @Path("/infos")
    String getInfos();

    @GET
    @Path("/infos/id/{id}")
    NPTab getInfo_id(@PathParam("id") String var1);

    @GET
    @Path("/infos/accessNum/{accessNum}")
    NPTab getInfo_num(@PathParam("accessNum") String var1);

    @GET
    @Path("/infos/name/{name}")
    String getInfo_name(@PathParam("name") String var1);

    @GET
    @Path("/infos/sequence/{sequence}")
    String getInfo_seq(@PathParam("sequence") String var1);

    @GET
    @Path("/get/name/{name}")
    String getNeuropepName(@PathParam("name") String var1);

    @GET
    @Path("/get/sequence/{sequence}")
    String getNeuropepSeq(@PathParam("sequence") String var1);

    @POST
    @Path("/infos")
    @Consumes({"application/xml", "text/xml", "application/json"})
    void saveOrUpdateInfo(NPTab var1);

    @DELETE
    @Path("/infos/{id}")
    void deleteInfo(@PathParam("id") String var1);
}
