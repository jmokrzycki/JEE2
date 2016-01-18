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
				url: '${pageContext.request.contextPath}/rest/rezyser/add',
				type: 'POST',
				data:
				{
					firstName: document.getElementById('firstName').value,
					birthDate: document.getElementById('birthDate').value,
					pin: document.getElementById('pin').value
				},
				success: function() { document.location.replace("${pageContext.request.contextPath}/rezyser.jsp"); },
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
                        <th>Akcja</th>
                    </tr>
                    <c:forEach var="rezyser" items="${rezyserzy}" varStatus="loopCounter">
                        <tr>
                            <td>${rezyser.id}</td>
                            <td>${rezyser.firstName}</td>
                            <td>${rezyser.birthDate}</td>
                            <td>${rezyser.pin}</td>
                            <td>
                                <a href="viewRezyser/${rezyser.id}">
                                    Zobacz
                                </a>
                                |
                                <a href="editRezyser/${rezyser.id}">
                                    Zmień
                                </a>
                                |
                                <a href="removeRezyser/${rezyser.id}">
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

            <form method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="firstName" class="col-sm-2 control-label">Imię:</label>

                    <div class="col-sm-10">
                        <input type="text" name="firstName" id="firstName" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="birthDate" class="col-sm-2 control-label">Data urodzenia:</label>

                    <div class="col-sm-10">
                        <input type="text" name="birthDate" id="birthDate" class="form-control">
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
                        <button id="add" type="submit" class="btn btn-default">Dodaj</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <jsp:include page="parts/footer.jsp" />
</div>

</body>
</html>
