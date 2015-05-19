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

    <form:form method="post" action="/product/add" commandName="product">

        <form:label path="name">Name:</form:label>
        <form:input path="name"/>

        <form:label path="description">Description:</form:label>
        <form:input path="description"/>

        <form:label path="price">Price:</form:label>
        <form:input path="price"/>

        <input type="submit" value="insert">

    </form:form>

</body>
</html>
