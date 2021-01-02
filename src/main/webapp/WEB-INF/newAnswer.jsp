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
           <h1><c:out value="${question.question}"/></h1>
       </div>
       <div class="row my-3">
           <h2>Tags: </h2>
           <c:forEach items="${question.tags}" var="tag">
            <a class="btn btn-outline-secondary mx-2"><c:out value="${tag.subject}"/></a>
           </c:forEach>
       </div>
       <div class="row my-5">
           <div class="col-6">
               <table class="table table-striped">
                   <thead>
                       <th>Answers</th>
                   </thead>
                   <tbody>
                    <c:forEach items="${question.answers}" var="answer">
                        <tr>
                            <td><c:out value="${answer.answer}"/></td>
                        </tr>
                    </c:forEach>
                   </tbody>
               </table>
           </div>
           <div class="col-6">
               <form:form action="/questions/${question.id}/newAnswer" method="POST" modelAttribute="answer">
               	<form:errors path="*" class="text-danger"/>
                   <div class="row">
                       <h3>Add your answer:</h3>
                   </div>
                   <div class="row my-2">
                       <div class="col-3">Answer</div>
                       <form:textarea path="answer" class="col-9" name="answer" id="answer" cols="30" rows="10"></form:textarea>
                   </div>
                   <div class="row my-2">
                       <div class="col text-right">
                           <button type="submit" class="btn btn-primary">Answer it!</button>
                       </div>
                   </div>
               </form:form>
           </div>
       </div>
   </div>
</body>
</html>