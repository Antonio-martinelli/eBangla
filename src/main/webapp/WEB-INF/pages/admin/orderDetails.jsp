<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


  <jsp:attribute name="title">Gestione degli ordini</jsp:attribute>

    <jsp:attribute name="yeld">

      <h1>Dettaglio ordine</h1>

        <h2>Da spedire al Sig. ${order.user.firstName} ${order.user.lastName}, ${order.user.address_line}</h2>

        <h2>Totale: &euro; ${total}</h2>

        <ul class="orderLines">
          <c:forEach items="${order.orderLines}" var="orderLine">
            <li>
              <p><strong>Nome: </strong> ${orderLine.product.name}
              <p><strong>Quantit&agrave;: </strong> ${orderLine.quantity}
              <p><strong>Quantit&agrave;: </strong> ${orderLine.price}
            </li>
          </c:forEach>
        </ul>

    </jsp:attribute>

</t:layout>