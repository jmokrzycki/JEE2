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

@WebServlet(urlPatterns = "/addFilmRezyser")
public class AddFilmRezyserServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/filmRezyser.jsp"));
    }
}
