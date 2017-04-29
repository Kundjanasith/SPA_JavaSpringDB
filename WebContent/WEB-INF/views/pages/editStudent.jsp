<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
label {
    /* Other styling.. */
    text-align: right;
    clear: both;
    float:left;
    margin-right:15px;
}
</style>
<div align="center">
    <h4>Edit Student</h4>
	<form:form method="POST" action="${pageContext.request.contextPath}/editStudent/${student.id }" modelAttribute="student">
		<div class="form-group">
			<form:label path="name" >Name :</form:label>
			<form:input path="name" class="form-control" placeholder="name" />
		</div>
		<div class="form-group">
			<form:label path="gpax" >GPAX :</form:label>
			<form:input path="gpax" class="form-control" placeholder="gpax" />
		</div>
		<div class="form-group">
			<form:label path="ambition" >Ambition :</form:label>
			<form:input path="ambition" class="form-control" placeholder="ambition"/>
		</div>
		<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-save"></span>
				Save
		</button>
	</form:form>
</div>