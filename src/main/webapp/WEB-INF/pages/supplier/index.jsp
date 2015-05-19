<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Lista degli fornitori</jsp:attribute>


    <jsp:attribute name="yeld">

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
          <h3>Users</h3>
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

    </jsp:attribute>

</t:layout>