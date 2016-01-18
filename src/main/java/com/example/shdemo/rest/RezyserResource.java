package com.zakladPogrzebowy.rest;

import java.util.List;

import com.example.shdemo.domain.Rezyser;
import com.example.shdemo.service.SellingManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

@Stateless
@Path("/rezyser")
public class RezyserResource{
    @EJB
    private SellingManager sm;

    @GET
    @Path("/getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Rezyser> getAll() {
    	 return sm.getAllRezyser();
    }

     @PUT
     @Path("/add")
     @Produces(MediaType.APPLICATION_JSON)
     public Rezyser add(
	@FormParam("firstName") String firstName,
	@FormParam("birthDate") String birthDate,
 	@FormParam("pin") String pin)
     {
	Rezyser r = new Rezyser();
	r.setFirstName(firstName);
	r.setBirthDate((Date)birthDate);
	r.setPin(pin);
	sm.addRezyser(r);
	return r;
     }

     @PUT
     @Path("/update/{id}")
     @Produces(MediaType.APPLICATION_JSON)
     public Rezyser update(
	@PathParam("id") Long id,
	@FormParam("firstName") String firstName,
	@FormParam("birthDate") String birthDate,
 	@FormParam("pin") String pin)
     {
	Rezyser r = new Rezyser();
	sm.updateRezyser(id, firstName, (Date)birthDate, pin);
	return r;
     }

    @DELETE
    @Path("/delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(@PathParam("id") long id)
    {
        Rezyser r = new Rezyser();

        sm.deleteRezyser(sm.findRezyserById(id));
    }

}
