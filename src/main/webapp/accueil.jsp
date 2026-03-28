<%@ include file="./components/utils.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
	<%@ include file="./components/head.jsp" %>
    <title>DocsViewer - Accueil</title>
</head>
<body class="bg-light">

    <%@ include file="./components/navigation.jsp" %>

    <div class="container">
        <div class="row mb-4 py-5">
            <div class="col">
                <h2 class="border-start border-4 border-info ps-3">Documents Récents</h2>
                <p class="text-muted">Consultez les dernières analyses et rapports disponibles.</p>
            </div>
        </div>

        <div class="row">
            <%-- La boucle JSTL qui parcourt la liste envoyée par le Servlet --%>
            <c:forEach var="doc" items="${documents}">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body">
                            <span class="badge bg-soft-info text-info mb-2">Document #${doc.id}</span>
                            <h5 class="card-title text-dark">${doc.titre}</h5>
                            <p class="card-text text-secondary small">Rédigé par : <strong>${doc.auteur}</strong></p>
                        </div>
                        <div class="card-footer bg-white border-0 pb-3">
                            <%-- Lien vers la future page de détails --%>
                            <a href="details?id=${doc.id}" class="btn btn-primary w-100">Consulter le document</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <%-- Affichage si la liste est vide --%>
            <c:if test="${empty documents}">
                <div class="col-12 text-center py-5">
                    <div class="alert alert-warning shadow-sm">
                        <h5>Aucun document trouvé</h5>
                        <p>Le système Hiips Analytics n'a pas encore de données à afficher.</p>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <footer class="text-center mt-5 py-4 text-muted border-top">
        <small>&copy; 2026 HIIPS_Analytics - Tous droits réservés</small>
    </footer>

</body>
</html>
