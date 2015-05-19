<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta charset="utf-8">
  <title>Spring MVC Application</title>

  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

<div class="container">
  <div class="row">
    <div class="span8 offset2">
      <h1>Suppliers</h1>
      <form:form method="post" action="/supplier/add" commandName="supplier" class="form-horizontal">


        <form:label path="iva">Iva:</form:label>
        <form:input path="iva"/>

        <form:label path="email">Email:</form:label>
        <form:input path="email"/>

        <form:label path="phone">Phone:</form:label>
        <form:input path="phone"/>


        <input type="submit" value="add supplier">

      </form:form>

      <c:if test="${!empty suppliers}">
        <h3>Suppliers</h3>
        <table class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>Iva</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>&nbsp;</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${suppliers}" var="supplier">
            <tr>
              <td>${supplier.iva}</td>
              <td>${supplier.email}</td>
              <td>${supplier.phone}</td>

              <td>
                <form action="delete/${supplier.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Delete"/></form>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
  </div>
</div>

</body>
</html>