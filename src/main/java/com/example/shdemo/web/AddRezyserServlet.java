package com.example.shdemo.web;

import com.example.shdemo.domain.Rezyser;
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

@WebServlet(urlPatterns = "/addRezyser")
public class AddRezyserServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imie = request.getParameter("imie");
        String dataUr = request.getParameter("dataUr");
        String pin = request.getParameter("pin");

	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Rezyser newRezyser = new Rezyser();
        newRezyser.setFirstName(imie);
	try
	{
        	newRezyser.setBirthDate(format.parse(dataUr));
	}
	catch(Exception e)
	{
	}
        newRezyser.setPin(pin);

        storage.addRezyser(newRezyser);

        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/rezyser.jsp"));
    }
}
