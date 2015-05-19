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
            <h1>${titolo}</h1>
            <form:form method="post" action="add" commandName="user" class="form-horizontal">

                <form:label path="firstName">First Name:</form:label>
                <form:input path="firstName"/>

                <form:label path="lastName">Last Name:</form:label>
                <form:input path="lastName"/>

                <form:label path="email">Email:</form:label>
                <form:input path="email"/>

                <form:label path="address.city">City:</form:label>
                <form:input path="address.city"/>

                <form:label path="address.cap">Cap:</form:label>
                <form:input path="address.cap"/>

                <form:label path="address.address_line">Address line:</form:label>
                <form:input path="address.address_line"/>

                <input type="submit" value="send">

            </form:form>

            <c:if test="${!empty users}">
                <h3>Users</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.lastName}, ${user.firstName}</td>
                            <td>${user.email}</td>
                            <td>
                                <form action="delete/${user.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Delete"/></form>
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