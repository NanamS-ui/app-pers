<%@ page import="org.itu.crudspring.model.Personne" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/partials/header.jsp" />
<%
    Personne personne = (Personne) request.getAttribute("personne");
%>
<div class="container-fluid pt-4 px-4">
    <h1><%= personne.getId() != null ? "Mise à jour de Personne" : "Formulaire d'ajout de Personne" %></h1>

    <form action="<%= request.getContextPath() %>/save" method="post">
        <input type="hidden" name="id" value="<%= personne.getId() != null ? personne.getId() : "" %>">

        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" id="nom" name="nom" class="form-control" value="<%= personne.getNom() != null ? personne.getNom() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="prenom">Prénom:</label>
            <input type="text" id="prenom" name="prenom" class="form-control" value="<%= personne.getPrenom() != null ? personne.getPrenom() : "" %>" required>
        </div>

        <div class="form-group">
            <label for="age">Âge:</label>
            <input type="number" id="age" name="age" class="form-control" value="<%= personne.getAge() != 0 ? personne.getAge() : "" %>" required>
        </div>

        <button type="submit" class="btn btn-primary"><%= personne.getId() != null ? "Mettre à jour" : "Ajouter" %></button>
    </form>
</div>
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />
