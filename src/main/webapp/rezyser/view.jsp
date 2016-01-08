<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../parts/head.jsp" />
</head>

<body>

<jsp:include page="../parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Reżyserzy</h3>
        <br/>

        <p>Imię:</p>
        <div class="well well-sm">${rezyser.firstName}</div>

        <p>Data urodzenia:</p>
        <div class="well well-sm">${rezyser.birthDate}</div>

        <p>PIN:</p>
        <div class="well well-sm">${rezyser.pin}</div>

    </div>

    <hr>

    <jsp:include page="../parts/footer.jsp" />
</div>

<jsp:include page="../parts/scripts.jsp" />
</body>
</html>
