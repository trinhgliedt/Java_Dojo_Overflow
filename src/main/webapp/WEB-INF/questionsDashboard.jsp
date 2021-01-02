<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-8">
       <div class="row">
           <h1>Questions Dashboard</h1>
       </div>
       <div class="row">
           <div class="col">
               <table class="table table-striped table-bordered">
                   <thead>
                       <th>Question</th>
                       <th>Tags</th>
                   </thead>
                   <tbody>
                    <c:forEach items="${questions}" var="question">
                        <tr>
                            <td>
                                <a href="/questions/${question.id}"><c:out value="${question.question}"/></a>
                            </td>
                            <td>
                                <c:out value="${question.tagsStrings()}"/>
                            </td>
                        </tr>
                    </c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
       <div class="row justify-content-end">
           <div class="col-3">
               <a href="/questions/new">New Question</a>
           </div>
       </div>
   </div>
</body>
</html>