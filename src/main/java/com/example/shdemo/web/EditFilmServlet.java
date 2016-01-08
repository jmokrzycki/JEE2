package com.example.shdemo.web;

import com.example.shdemo.domain.Film;
import com.example.shdemo.service.SellingManager;

import java.util.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/editFilm/*")
public class EditFilmServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long messageID = WebUtils.getMessageID(request);
        request.setAttribute("film", storage.findFilmById(messageID));
        request.getRequestDispatcher("/film/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tytul = request.getParameter("tytul");
        String gatunek = request.getParameter("gatunek");
        Long messageID = WebUtils.getMessageID(request);

        storage.updateFilm(messageID, tytul, gatunek);

        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Filmy"));
    }
}
