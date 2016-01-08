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

@WebServlet(urlPatterns = "/viewFilm/*")
public class ViewFilmServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Long messageID = WebUtils.getMessageID(request);

        request.setAttribute("film", storage.findFilmById(messageID));
        request.getRequestDispatcher("/film/view.jsp").forward(request, response);
    }
}
