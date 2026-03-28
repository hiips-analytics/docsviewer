<%@ include file="components/utils.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
	<%@ include file="components/head.jsp" %>
    <title>${doc.titre} - Détails</title>
</head>
<body class="bg-light">

    <%@ include file="./components/navigation.jsp" %>

    <div class="container">
        <div class="card shadow-sm mt-5">
            <div class="card-header bg-white">
                <a href="accueil" class="btn btn-link btn-sm text-decoration-none">← Retour à la liste</a>
            </div>
            <div class="card-body p-5">
                <h1 class="display-5 fw-bold text-dark">${doc.titre}</h1>
                <p class="text-muted">Publié par <strong>${doc.auteur}</strong></p>
                <hr>
                <div class="mt-4" style="line-height: 1.8; font-size: 1.1rem;">
                    ${doc.contenu}
                </div>
                <c:if test="${not empty doc.nomFichier}">
	    			<div class="card bg-light border-info mt-4">
    	    			<div class="card-body d-flex align-items-center justify-content-between">
        	    			<div>
            			    	<i class="fas fa-file-pdf fa-2x text-danger me-3"></i>
			            	    <span class="fw-bold text-dark">${doc.nomFichier}</span>
            				</div>
			    	        <a href="download?file=${doc.nomFichier}" target="_blank" class="btn btn-primary">
            	    			<i class="fas fa-download me-2"></i> Ouvrir / Télécharger
        	    			</a>
    	    			</div>
	    			</div>
				</c:if>
            </div>
        </div>
    </div>

</body>
</html>