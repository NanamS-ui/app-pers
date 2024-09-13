<%@ page import="java.util.List" %>
<%@ page import="org.itu.crudspring.model.Personne" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liste Personne</title>
</head>
<body>
<% if (request.getAttribute("message") != null) { %>
<p style="color: red;"><%= request.getAttribute("message") %></p>
<% } %>
<a href="<%= request.getContextPath() %>/showForm">Ajouter une personne</a>
<h1>Liste des Personnes</h1>
<table border="1">
    <thead>
    <tr>
        <th>Nom et Prenom</th>
        <th>Age</th>
        <th>Detail</th>
        <th>Supprimer</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Personne> personneList = (List<Personne>) request.getAttribute("personnes");
        if (personneList != null) {
            for (Personne personne : personneList) {
    %>
    <tr>
        <td><%= personne.getNom() %> <%= personne.getPrenom()%></td>
        <td><%= personne.getAge() %></td>
        <td><a href="<%= request.getContextPath() %>/getDetail?id=<%= personne.getId()%>">Voir detail</a></td>
        <td><a href="<%= request.getContextPath() %>/delete?id=<%= personne.getId()%>">Supprimer</a></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="2">Aucune personne trouvée.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
