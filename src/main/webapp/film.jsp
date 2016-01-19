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

	<script>
	$(document).ready(function()
	{
		$.ajax
		(
		{
			url: '${pageContext.request.contextPath}/rest/film/getAll',
			type: 'GET',
			success: function(data)
			{
				var d = data.length;
				var table = document.getElementById("tab");
				for (var i = 0; i < d; i++)
				{
					tr = $('<tr/>');
					tr.append("<td>"+data[i].tytul+"</td>");
					tr.append("<td>"+data[i].gatunek+"</td>");
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

<body>

<jsp:include page="parts/navbar.jsp" />

<div class="container">
    <div class="row">
        <h3>Filmy</h3>
        <br/>


	<table id="tab" class="table table-striped">
		<tr>
			<th>Tytuł</th>
			<th>Gatunek</th>
			<th></th>
		</tr>
	</table>

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
