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
        <div class="col-md-12">
            <h3>Zmień film:</h3>
            <br/>

            <form action="${pageContext.request.contextPath}/editFilm/${film.id}" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Tytuł:</label>

                    <div class="col-sm-10">
                        <input type="text" name="tytul" id="tytul" value="${film.tytul}" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="gatunek" class="col-sm-2 control-label">Gatunek:</label>

                    <div class="col-sm-10">
                        <input type="text" name="gatunek" id="gatunek" value="${film.gatunek}" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Zapisz</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <jsp:include page="../parts/footer.jsp" />
</div>

<jsp:include page="../parts/scripts.jsp" />
</body>
</html>
