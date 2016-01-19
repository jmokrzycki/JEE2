package com.example.shdemo.web;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.example.shdemo.service.*;
import com.example.shdemo.domain.*;
@WebServlet(urlPatterns = "/FilmZm/*")
public class FilmZm extends HttpServlet{
@EJB
private SellingManager sm;
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String link = request.getPathInfo();
request.setAttribute("filmZm", sm.findFilmById(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
request.setAttribute("rezyserKO", sm.getAllRezyzser());
request.getRequestDispatcher("/zmienFilm.jsp").forward(request, response);
}
}
