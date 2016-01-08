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
        <h3>Filmy i reżyserzy</h3>
        <br/>

        <c:choose>
            <c:when test="${filmyRezyserzy.size() > 0}">
                <table class="table table-striped">
                    <tr>
                        <th>#</th>
                        <th>Film</th>
                        <th>Reżyser</th>
                    </tr>
                    <c:forEach var="filmRezyserz" items="${filmyRezyserzy}" varStatus="loopCounter">
                        <tr>
                            <td>${rezyser.id}</td>
                            <td>${filmRezyserz.rezyser.firstName}</td>
                            <td>${filmRezyserz.film.birthDate}</td>
                            <td>
                                <a href="view/${filmRezyserz.id}">
                                    View
                                </a>
                                |
                                <a href="edit/${filmRezyserz.id}">
                                    Edit
                                </a>
                                |
                                <a href="remove/${filmRezyserz.id}">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
            <c:otherwise>
                <div class="well">Brak filmów i reżyserów</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Dodaj film i reżysera</h3>
            <br/>

            <form action="add" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="imie" class="col-sm-2 control-label">Film:</label>

                    <div class="col-sm-10">
                        <input type="text" name="imie" id="imie" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="dataUr" class="col-sm-2 control-label">Reżyser:</label>

                    <div class="col-sm-10">
                        <input type="text" name="dataUr" id="dataUr" class="form-control">
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
