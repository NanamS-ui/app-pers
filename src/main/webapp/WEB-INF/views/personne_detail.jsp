<%@ page import="org.itu.crudspring.model.Personne" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detail Personne</title>
</head>
<body>
<% Personne personne = (Personne) request.getAttribute("personne"); %>
<h1>Detail du Personne</h1>
<h2>Nom : <%= personne.getNom()%></h2>
<h2>Prenom : <%= personne.getPrenom() %></h2>
<h2>Age : <%= personne.getAge()%></h2>
</body>
</html>
