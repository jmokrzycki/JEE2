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

@WebServlet(urlPatterns = "/editRezyser/*")
public class EditRezyserServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long messageID = WebUtils.getMessageID(request);

        request.setAttribute("rezyser", storage.findRezyserById(messageID));
        request.getRequestDispatcher("/rezyser/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String firstName = request.getParameter("firstName");
	Date birthDate = new Date();
	try
	{
        	birthDate = format.parse(request.getParameter("birthDate"));
	}
	catch(Exception e)
	{
	}
        String pin = request.getParameter("pin");
        Long messageID = WebUtils.getMessageID(request);

        storage.updateRezyser(messageID, firstName, birthDate, pin);

        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Rezyserzy"));
    }
}
