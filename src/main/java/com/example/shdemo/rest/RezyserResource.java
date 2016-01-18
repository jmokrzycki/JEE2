package com.zakladPogrzebowy.rest;

import java.util.List;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

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
    	 return sm.getAllRezyzser();
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
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	try
	{
		r.setBirthDate(format.parse(birthDate));
	}
	catch(Exception e)
	{
	}
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
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	try
	{
		sm.updateRezyser(id, firstName, format.parse(birthDate), pin);
	}
	catch(Exception e)
	{
	}
	r.setPin(pin);
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
