package com.neuropeptide.service;

import com.neuropeptide.entity.Receptor;

import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/statistics")
public interface IStatisticsService {
    @GET
    @Path("amino-acid-distribution")
    @Produces({"application/json"})
    List<Integer> getAminoAcidsDistribution();

    @GET
    @Path("family-distribution")
    @Produces({"application/json"})
    List<List<?>> getFamilyDistribution();

    @GET
    @Path("phyla-distribution")
    @Produces({"application/json"})
    List<List<?>> getPhylaDistribution();

    @GET
    @Path("orgnism-distribution")
    @Produces({"application/json"})
    List<List<?>> getOrganismDistribution();

    @GET
    @Path("source-distribution")
    @Produces({"application/json"})
    List<List<?>> getSourceDistribution();

}
