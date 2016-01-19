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

	<script>
	$(document).ready(function()
	{
		$.ajax
		(
		{
			url: '${pageContext.request.contextPath}/rest/rezyser/getAll',
			type: 'GET',
			success: function(data)
			{
				var d = data.length;
				var table = document.getElementById("tab");
				for (var i = 0; i < d; i++)
				{
					tr = $('<tr/>');
					tr.append("<td>"+data[i].firstName+"</td>");
					tr.append("<td>"+data[i].birthDate+"</td>");
					tr.append("<td>"+data[i].pin+"</td>");
					td = $('<td/>');
					td.append("<a href='${pageContext.request.contextPath}/film/edit/"+data[i].id+"' class='btn btn-default'>Edytuj </a><buttom onClick='del("+data[i].id+")' class='btn btn-default'> Usuń </buttom>");
					tr.append(td);
					$(table).append(tr);
				}
			}
		}
		);
	}
	);
	</script>

    <hr>
</head>

<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Reżyserzy</h3>
        <br/>

	<table id="tab" class="table table-striped">
		<tr>
			<th>Imię</th>
			<th>Data urodzenia</th>
			<th>PIN</th>
			<th></th>
		</tr>
	</table>

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

    <jsp:include page="parts/footer.jsp" />
</div>

</body>
</html>
