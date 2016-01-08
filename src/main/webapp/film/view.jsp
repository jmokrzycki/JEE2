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
        <h3>Film</h3>
        <br/>

        <p>Tytuł:</p>
        <div class="well well-sm">${film.tytul}</div>

        <p>Gatunek:</p>
        <div class="well well-sm">${film.gatunek}</div>

        <p>Czy ma przypisanego reżysera:</p>
        <div class="well well-lg">${film.haveRezyser}</div>
    </div>

    <hr>

    <jsp:include page="../parts/footer.jsp" />
</div>

<jsp:include page="../parts/scripts.jsp" />
</body>
</html>
