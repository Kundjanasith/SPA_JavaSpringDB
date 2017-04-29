<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

${message}
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
	<h4>Add New Student</h4>
	<form:form method="POST" action="${pageContext.request.contextPath}/addNewStudent" modelAttribute="student">
		<div class="form-group">
			<form:label path="name" >Name :</form:label>
			<form:input path="name" class="form-control" placeholder="Enter your name"/>
		</div>
		<div class="form-group">
			<form:label path="gpax" >GPAX :</form:label>
			<form:input path="gpax" class="form-control" placeholder="Enter your GPAX"/>
		</div>
		<div class="form-group">
			<form:label path="ambition" >Ambition :</form:label>
			<form:input path="ambition" class="form-control" placeholder="Enter your ambition"/>
		</div>
		<button type="submit" class="btn btn-primary">
			<span class="glyphicon glyphicon-save"></span>
			Save
		</button>
	</form:form>
</div>