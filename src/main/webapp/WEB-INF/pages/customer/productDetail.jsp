<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


  <jsp:attribute name="title">Ebangla - il bangla a casa tua</jsp:attribute>


    <jsp:attribute name="yeld">

        <c:if test="${!empty product}">
          <div id="products">
              <article>
                <div class="info">
                  <h1>${product.name} - &euro; ${product.price}</h1>
                  <div class="desc">${product.description}</div>
                </div>
              </article>
          </div>
        </c:if>

    </jsp:attribute>

</t:layout>