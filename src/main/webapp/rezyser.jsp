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
        <h3>Reżyserzy</h3>
        <br/>

        <c:choose>
            <c:when test="${rezyserzy.size() > 0}">
                <table class="table table-striped">
                    <tr>
                        <th>#</th>
                        <th>Imię</th>
                        <th>Data urodzenia</th>
                        <th>PIN</th>
                    </tr>
                    <c:forEach var="rezyser" items="${rezyserzy}" varStatus="loopCounter">
                        <tr>
                            <td>${rezyser.id}</td>
                            <td>${rezyser.firstName}</td>
                            <td>${rezyser.birthDate}</td>
                            <td>${rezyser.pin}</td>
                            <td>
                                <a href="view/${filmRezyserz.id}">
                                    Zobacz
                                </a>
                                |
                                <a href="edit/${filmRezyserz.id}">
                                    Zmień
                                </a>
                                |
                                <a href="remove/${filmRezyserz.id}">
                                    Usuń
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
            <c:otherwise>
                <div class="well">Brak reżyserów</div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Dodaj reżysera</h3>
            <br/>

            <form action="add" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="imie" class="col-sm-2 control-label">Imię:</label>

                    <div class="col-sm-10">
                        <input type="text" name="imie" id="imie" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="dataUr" class="col-sm-2 control-label">Data urodzenia:</label>

                    <div class="col-sm-10">
                        <input type="text" name="dataUr" id="dataUr" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="pin" class="col-sm-2 control-label">PIN:</label>

                    <div class="col-sm-10">
                        <input type="text" name="pin" id="pin" class="form-control">
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
