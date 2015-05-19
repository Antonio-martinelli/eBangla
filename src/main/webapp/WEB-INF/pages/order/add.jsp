<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


  <jsp:attribute name="title">Aggiungi ordine</jsp:attribute>

    <jsp:attribute name="yeld">

        <form:form method="post" action="/order/add" commandName="order">

          <input type="submit" value="insert">

        </form:form>

    </jsp:attribute>

</t:layout>