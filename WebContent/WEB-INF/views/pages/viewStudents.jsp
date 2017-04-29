<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div align="center" style="margin: 10px;">
	<h4>Students List</h4>
	<h3>${message }</h3>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>GPAX</th>
				<th>Ambition</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="student" items="${students}" >
				<tr>
					<td><c:out value="${student.id }"/></td>
					<td><c:out value="${student.name }"/></td>
					<td><c:out value="${student.gpax }"/></td>
					<td><c:out value="${student.ambition }"/></td>
					<td><button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/editStudent/${student.id}'"><span class="glyphicon glyphicon-ok"></span> Edit</button></td>
					<td><form action="${pageContext.request.contextPath}/deleteStudent/${student.id}" method="POST"><button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-remove"></span> Delete</button></form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>