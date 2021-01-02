<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
       <div class="row">
           <h1>What is your question?</h1>
       </div>
       <div class="row">
           <div class="col-10">
               <form action="/questions/new" method="POST">
               	<div class="row my-3">
               		<div class="text-danger"><c:out value="${error }"/></div>
               	</div>
               	<div class="row my-3">
               		<form:errors path="*" class="text-danger"></form:errors>
               	</div>
                   <div class="row my-3">
                       <div class="col-3">Question:</div>
                       <textarea class="col-9" name="question" id="question" cols="30" rows="10"></textarea>
                   </div>
                   <div class="row my-3">
                       <div class="col-3">Tags:</div>
                       <input class="col-8" name="tags" type="text">
                   </div>
                   <div class="row my-3 justify-content-end">
                       <div class="col-2">
                           <button class="btn btn-primary" type="submit">Submit</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>
   </div>
</body>
</html>