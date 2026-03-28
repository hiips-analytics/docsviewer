<%@ include file="./components/utils.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
	<%@ include file="./components/head.jsp" %>
    <title>DocsViewer - Accueil</title>
</head>
<body class="bg-light">
	<%@ include file="./components/navigation.jsp" %>

    <header class="py-5 bg-white border-bottom shadow-sm">
        <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="my-5 text-center text-xl-start">
                        <h1 class="display-5 fw-bolder text-dark mb-2">Gérez vos documents avec précision.</h1>
                        <p class="lead fw-normal text-muted mb-4">Plateforme d'analyse et de visualisation de documents pour Hiips Analytics. Stockage sécurisé et accès rapide.</p>
                        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="accueil">Voir les documents</a>
                            <a class="btn btn-outline-secondary btn-lg px-4" href="#features">En savoir plus</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                    <i class="fas fa-folder-open fa-10x text-info opacity-25"></i>
                </div>
            </div>
        </div>
    </header>

    <section class="py-5" id="features">
        <div class="container px-5 my-5">
            <div class="row gx-5">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3 text-center py-2"><i class="fas fa-upload"></i></div>
                    <h2 class="h4 fw-bolder">Upload Simple</h2>
                    <p>Téléversez vos fichiers PDF ou images en un clic et liez-les à vos métadonnées.</p>
                </div>
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3 text-center py-2"><i class="fas fa-database"></i></div>
                    <h2 class="h4 fw-bolder">Persistance MySQL</h2>
                    <p>Vos données sont stockées de manière robuste avec Laragon et MySQL.</p>
                </div>
                <div class="col-lg-4">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3 text-center py-2"><i class="fas fa-eye"></i></div>
                    <h2 class="h4 fw-bolder">Visualisation</h2>
                    <p>Consultez vos documents directement via notre interface optimisée.</p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
