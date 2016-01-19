<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="parts/head.jsp" />
	<jsp:include page="parts/scripts.jsp" />
</head>
<script>
	$(document).ready(function()
	{
		$( "#update" ).on('click', function(e)
		{
		e.preventDefault();
		$.ajax
		(
		{
		url: '${pageContext.request.contextPath}/rest/film/update/${filmZm.id}',
		type: 'PUT',
		data:
		{
		rezyser: document.getElementById('rezyser').value,
		tytul: document.getElementById('tytul').value,
		gatunek: document.getElementById('gatunek').value
		},
		success: function() { document.location.replace("${pageContext.request.contextPath}/Film"); },
		error: function() { alert("Błąd!"); }
		}
		);
		}
		);
		}
	);
</script>
<body>
<jsp:include page="parts/navbar.jsp" />
<div class="container">
<div class="row">
<div class="col-md-12">
<h3>Zmień film:</h3>
	<br/>
	<form method="post" class="form-horizontal">
		<div class="form-group">
			<label for="rezyser" class="col-sm-2 control-label">Reżyser:</label>
			<div class="col-sm-10">
				<select type="text" name="rezyser" id="rezyser" class="form-control" required>
					<c:forEach var="rez" items="${rezyserKO}" varStatus="loopCounter">
						<option value="${rez.id}">${rez.firstName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="tytul" class="col-sm-2 control-label">Tytuł:</label>
			<div class="col-sm-10">
				<input type="text" name="tytul" id="tytul" value="${filmZm.tytul}" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="gatunek" class="col-sm-2 control-label">Gatunek:</label>
			<div class="col-sm-10">
				<input type="text" name="gatunek" id="gatunek" value="${filmZm.gatunek}" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="update" type="submit" class="btn btn-default">Zatwierdź</button>
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
