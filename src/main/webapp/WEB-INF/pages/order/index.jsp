<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


  <jsp:attribute name="title">Lista degli ordini</jsp:attribute>


    <jsp:attribute name="yeld">

        <c:if test="${!empty orders}">
          <h3>Orders</h3>
          <table>
            <thead>
            <tr>
              <th>Id</th>
              <th>Creation Date</th>
              <th>Closing Date</th>
              <th>Evasion Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
              <tr>
                <td>${order.id}</td>
                <td>${order.creationDate}</td>
                <td>${order.closingDate}</td>
                <td>${order.evasionDate}</td>
                <td>
                  <form action="/order/delete/${order.id}" method="post"><input type="submit" value="Delete"/></form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </c:if>

    </jsp:attribute>

</t:layout>