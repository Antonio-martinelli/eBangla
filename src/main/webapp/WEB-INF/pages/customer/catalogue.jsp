<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Ebangla - il bangla a casa tua</jsp:attribute>


    <jsp:attribute name="yeld">

        <c:if test="${!empty products}">
            <div id="products">
                <form id="search" action="#" method="post">
                    <label><input type="text" placeholder="Cerca un prodotto" /></label>
                </form>
                <c:forEach items="${products}" var="product">
                        <article class="product">
                            <a href="/product/${product.id}">
                                <figure>
                                    <img src="/assets/images/spaghetti.png" alt="foto prodotto 1">
                                </figure>
                            </a>
                            <div class="info">
                                <h1>${product.name}</h1>
                                <div class="desc">${product.description}</div>
                                <span class="price">&euro; ${product.price}</span>
                                <a href="#" data-id="${product.id}" title="acquista ora" class="btn">Acquista ora</a>
                            </div>
                        </article>
                </c:forEach>
            </div>
        </c:if>

    </jsp:attribute>

</t:layout>
