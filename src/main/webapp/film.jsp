<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="parts/head.jsp" />
    <jsp:include page="parts/scripts.jsp" />
	<script>
	$(document).ready(function()
	{
		$( "#add" ).on('click', function(e)
			{
			e.preventDefault();
			$.ajax
			(
				{
				url: '${pageContext.request.contextPath}/rest/film/add',
				type: 'POST',
				data:
				{
					tytul: document.getElementById('tytul').value,
					gatunek: document.getElementById('gatunek').value,
				},
				success: function() { document.location.replace("${pageContext.request.contextPath}/film.jsp"); },
				error: function() { alert("Błąd!"); }
			}
			);
			}
		);
		}
	);
	</script>
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
                        <th>Gatunek</th>
                        <th>Akcja</th>
                    </tr>
                    <c:forEach var="film" items="${filmy}" varStatus="loopCounter">
                        <tr>
                            <td>${film.id}</td>
                            <td>${film.tytul}</td>
                            <td>${film.gatunek}</td>
                            <td>${film.haveRezyser}</td>
                            <td>
                                <a href="viewFilm/${film.id}">
                                    Zobacz
                                </a>
                                |
                                <a href="editFilm/${film.id}">
                                    Zmień
                                </a>
                                |
                                <a href="removeFilm/${film.id}">
                                    Usuń
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

		<form method="post" class="form-horizontal">             
		   <div class="form-group">
                    <label for="tytul" class="col-sm-2 control-label">Tytuł:</label>

                    <div class="col-sm-10">
                        <input type="text" name="tytul" id="tytul" class="form-control">
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
                        <button id="add" type="submit" class="btn btn-default">Dodaj</button>

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
