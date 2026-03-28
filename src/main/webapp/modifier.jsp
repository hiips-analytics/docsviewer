<%@ include file="./components/utils.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
	<%@ include file="./components/head.jsp" %>
    <title>Modifier le document</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-warning text-dark fw-bold">Modifier le Document #${doc.id}</div>
            <div class="card-body">
                <form action="admin" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${doc.id}">

                    <div class="mb-3">
                        <label class="form-label">Titre</label>
                        <input type="text" name="titre" class="form-control" value="${doc.titre}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Auteur</label>
                        <input type="text" name="auteur" class="form-control" value="${doc.auteur}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contenu</label>
                        <textarea name="contenu" class="form-control" rows="5">${doc.contenu}</textarea>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Mettre à jour</button>
                    <a href="admin" class="btn btn-secondary">Annuler</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>