package com.zakladPogrzebowy.rest;

import java.util.List;

import com.example.shdemo.domain.Film;
import com.example.shdemo.service.SellingManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.*;

@Stateless
@Path("/film")
public class FilmResource{
    @EJB
    private SellingManager sm;

    @GET
    @Path("/getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Film> getAll() {
    	 return sm.getAllFilm();
    }

     @POST //3 dodanie filmu do bazy
     @Path("/add")
     @Produces(MediaType.APPLICATION_JSON)
     public Film add(
	@FormParam("rezyser") Long id,
	@FormParam("tytul") String tytul,
	@FormParam("gatunek") String gatunek)
     {
	Film f = new Film();
	f.setRezyser(sm.findRezyserById(id));
	f.setTytul(tytul);
	f.setGatunek(gatunek);
	sm.addFilm(f);
	return f;
     }

     @PUT
     @Path("/update/{id}")
     @Produces(MediaType.APPLICATION_JSON)
     public Film update(
	@PathParam("id") Long id,
	@FormParam("rezyser") Long rezyser,
	@FormParam("tytul") String tytul,
	@FormParam("gatunek") String gatunek)
     {
	Film f = new Film();
	sm.updateFilm(id, sm.findRezyserById(rezyser), tytul, gatunek);
	return f;
     }

    @DELETE //2 get delete idzie z rezyser.jsp
    @Path("/delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(@PathParam("id") long id)
    {
        Film f = new Film();

        sm.deleteFilm(sm.findFilmById(id));
    }

}
