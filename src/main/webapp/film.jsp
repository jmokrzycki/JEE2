<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="parts/head.jsp" />
</head>

<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Filmy</h3>
        <br/>

        <c:choose>
            <c:when test="${filmy.size() > 0}">
                <table class="table table-striped">
                    <tr>
                        <th>#</th>
                        <th>Tytuł</th>
                        <th>Reżyser</th>
                        <th>Gatunek</th>
                    </tr>
                    <c:forEach var="film" items="${filmy}" varStatus="loopCounter">
                        <tr>
                            <td>${film.id}</td>
                            <td>${film.tytul}</td>
                            <td>${film.rezyser.firstname}</td>
                            <td>${film.gatunek}</td>
                            <td>
                                <a href="view/${message.id}">
                                    View
                                </a>
                                |
                                <a href="edit/${message.id}">
                                    Edit
                                </a>
                                |
                                <a href="remove/${message.id}">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
            <c:otherwise>
                <div class="well">Brak filmów</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Dodaj nowy film</h3>
            <br/>

<form action="add" method="post" class="form-horizontal">             
		   <div class="form-group">
                    <label for="tytul" class="col-sm-2 control-label">Tytuł:</label>

                    <div class="col-sm-10">
                        <input type="text" name="tytul" id="tytul" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="rezyser" class="col-sm-2 control-label">Reżyser:</label>

                    <div class="col-sm-10">
                        <input type="text" name="rezyser" id="rezyser" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="gatunek" class="col-sm-2 control-label">Gatunek:</label>

                    <div class="col-sm-10">
                        <input type="text" name="gatunek" id="gatunek" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Dodaj</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <jsp:include page="parts/footer.jsp" />
</div>

<jsp:include page="parts/scripts.jsp" />
</body>
</html>
