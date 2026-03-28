<%-- components/navigation.jsp --%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/DocsViewer/">
            <i class="fas fa-file text-info me-2"></i>DocsViewer
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/DocsViewer/">Accueil</a></li>
                <li class="nav-item"><a class="nav-link" href="accueil">Documents</a></li>
                <li class="nav-item">
                    <a class="btn btn-outline-info btn-sm ms-lg-3" href="admin">
                        <i class="fas fa-lock me-1"></i> Admin
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>