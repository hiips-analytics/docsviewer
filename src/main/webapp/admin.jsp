<%@ include file="components/utils.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <%@ include file="components/head.jsp" %>
    <title>Console d'Administration - DocsViewer</title>
    <style>
        .sidebar { min-height: 100vh; background: #1a1d20; color: white; position: fixed; }
        .sidebar a { color: #8a8d90; text-decoration: none; padding: 12px 20px; display: block; transition: 0.3s; }
        .sidebar a:hover, .sidebar a.active { background: #2c3136; color: #0dcaf0; border-left: 4px solid #0dcaf0; }
        .main-content { margin-left: 16.66%; } /* Pour ne pas être sous la sidebar fixe */
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block sidebar p-0">
                <div class="p-4 text-center border-bottom border-secondary mb-4">
                    <h5 class="text-info fw-bold">ADMIN</h5>
                </div>
                
                <%-- Menu de navigation --%>
                <a href="admin?page=list" class="${empty param.page || param.page == 'list' ? 'active' : ''}">
                    <i class="fas fa-table me-2"></i> Liste des documents
                </a>
                <a href="admin?page=add" class="${param.page == 'add' ? 'active' : ''}">
                    <i class="fas fa-plus-circle me-2"></i> Ajouter un document
                </a>
                
                <div class="position-absolute bottom-0 w-100 p-3 border-top border-secondary">
                    <a href="accueil" class="text-white small"><i class="fas fa-arrow-left me-2"></i> Quitter l'admin</a>
                </div>
            </nav>

            <main class="col-md-10 main-content bg-light p-5">
                
                <%-- LOGIQUE D'AFFICHAGE DYNAMIQUE --%>
                <c:choose>
                    <c:when test="${param.page == 'add'}">
                        <h2 class="mb-4 text-dark">Nouveau Document</h2>
                        <%@ include file="admin/admin_add.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <h2 class="mb-4 text-dark">Répertoire des Documents</h2>
                        <%@ include file="admin/admin_list.jsp" %>
                    </c:otherwise>
                </c:choose>

            </main>
        </div>
    </div>
</body>
</html>