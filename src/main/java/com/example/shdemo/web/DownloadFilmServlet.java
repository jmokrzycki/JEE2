package com.example.shdemo.web;

import com.example.shdemo.domain.Rezyser;
import com.example.shdemo.service.SellingManager;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/downloadFilm")
public class DownloadFilmServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("filmy", storage.getAllFilm());
        request.getRequestDispatcher("film.jsp").forward(request, response);
    }
}
