<%@ page import="org.itu.crudspring.model.Personne" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/partials/header.jsp" />
<div class="container-fluid pt-4 px-4">
    <h1>Listes des Personnes</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Âge</th>
            <th>Détail</th>
            <th>Supprimer</th>
            <th>Modifier</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Personne> personnes = (List<Personne>) request.getAttribute("personnes");
            for (Personne personne : personnes) {
        %>
        <tr>
            <td><%= personne.getNom() %></td>
            <td><%= personne.getPrenom() %></td>
            <td><%= personne.getAge() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/getDetail?id=<%= personne.getId() %>">Voir détails</a>
            </td>
            <td>
                <a href="<%= request.getContextPath() %>/delete?id=<%= personne.getId()%>">Supprimer</a>
            </td>
            <td>
                <a href="<%= request.getContextPath() %>/showForm?id=<%= personne.getId()%>">Modifier</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />