package com.example.shdemo.web;

import com.example.shdemo.domain.Film;
import com.example.shdemo.service.SellingManager;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addFilm")
public class AddFilmServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tytul = request.getParameter("tytul");
        String gatunek = request.getParameter("gatunek");

        Film newFilm = new Film();
        newFilm.setTytul(tytul);
        newFilm.setGatunek(gatunek);

        storage.addFilm(newFilm);

        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Filmy"));
    }
}
