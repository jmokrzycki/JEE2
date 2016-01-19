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
		url: '${pageContext.request.contextPath}/rest/rezyser/update/${rezyserZm.id}',
		type: 'PUT',
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
<body>
<jsp:include page="parts/navbar.jsp" />
<div class="container">
<div class="row">
<div class="col-md-12">
<h3>Zmień reżyser:</h3>
	<br/>
	<form method="post" class="form-horizontal">
		<div class="form-group">
			<label for="firstName" class="col-sm-2 control-label">Imię:</label>
			<div class="col-sm-10">
				<input type="text" name="firstName" id="firstName" value="${rezyserZm.firstName}" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="birthDate" class="col-sm-2 control-label">Data urodzenia:</label>
			<div class="col-sm-10">
				<input type="text" name="birthDate" id="birthDate" value="${rezyserZm.birthDate}" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="pin" class="col-sm-2 control-label">PIN:</label>
			<div class="col-sm-10">
				<input type="text" name="pin" id="pin" value="${rezyserZm.pin}" class="form-control">
			</div>
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
