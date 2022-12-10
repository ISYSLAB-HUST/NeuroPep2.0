package com.neuropeptide.service;

import java.util.Map;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("dbgeneration")
public interface INPGenerateService {
    @GET
    @Path("allField")
    @Produces({"application/json"})
    Map<String, String> generateAllField();

    @GET
    @Path("length")
    void generateLengthField();

    void generateMWField();

    void generatePIField();

    @GET
    @Path("familyTab")
    void generateFamilyTab();
}
