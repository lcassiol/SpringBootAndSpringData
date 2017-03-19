<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Movie Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Main Page</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-movie">New Movie</a></li>
					<li><a href="all-movies">List</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Movie Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_MOVIES'}">
			<div class="container text-center" id="tasksDiv">
				<h3>Movies</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>director</th>
								<th>writers</th>
								<th>year</th>
								<th>sinopse</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="movie" items="${movies}">
								<tr>
									<td>${movie.id}</td>
									<td>${movie.name}</td>
									<td>${movie.director}</td>
									<td>${movie.writers}</td>
									<td>${movie.year}</td>
									<td>${movie.sinopse}</td>
									<td><a href="update-movie?id=${movie.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-movie?id=${movie.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Movie</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-movie">
					<input type="hidden" name="id" value="${movie.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${movie.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">director</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="director" value="${movie.director}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">writers</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="writers" value="${movie.writers}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">year</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="year" value="${movie.year}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">sinopse</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="sinopse" value="${movie.sinopse}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">stars</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="stars" value="${movie.stars}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">gender</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="gender" value="${movie.gender}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>