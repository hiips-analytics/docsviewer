
<div class="card shadow-lg border-0 mb-5">
    <div class="card-header bg-dark text-white d-flex align-items-center">
		<i class="fas fa-file-upload me-2"></i>
		<h5 class="mb-0">Enregistrer un Nouveau Document</h5>
	</div>
	<div class="card-body p-4">
		<%-- FORMULAIRE UNIQUE : Métadonnées + Fichier --%>
		<form action="admin" method="POST" enctype="multipart/form-data">
			<div class="row">
		       	<div class="col-lg-8">
		        	<div class="row g-3">
				       	<div class="col-md-6">
		                    <label class="form-label fw-bold">Titre du Document</label>
		                	<div class="input-group">
		        		        <span class="input-group-text"><i class="fas fa-heading"></i></span>
				            	<input type="text" name="titre" class="form-control" placeholder="ex: Rapport Annuel 2026" required>
		                	</div>
		                </div>
		                <div class="col-md-6">
		        		    <label class="form-label fw-bold">Auteur / Analyste</label>
				           	<div class="input-group">
		                		<span class="input-group-text"><i class="fas fa-user text-info"></i></span>
		        		    	<input type="text" name="auteur" class="form-control" placeholder="Nom de l'auteur" required>
				        	</div>
				        </div>
				      	<div class="col-12">
		        		    <label class="form-label fw-bold">Résumé ou Description</label>
				        	<textarea name="contenu" class="form-control" rows="3" placeholder="Décrivez brièvement le contenu du document..."></textarea>
		            	</div>
		        	</div>
		        </div>
		
				<div class="col-lg-4 border-start ps-lg-4">
		           	<div class="mb-4">
		                <label class="form-label fw-bold">Pièce Jointe</label>
		        		<div class="border rounded p-3 bg-light text-center">
				            <i class="fas fa-cloud-upload-alt fa-2x text-primary mb-2"></i>
		                    <input type="file" name="fichier" class="form-control form-control-sm">
		                	<div class="form-text mt-2 small">PDF, DOCX ou Images (Max 10MB)</div>
		        		</div>
				    </div>
				   	<div class="d-grid gap-2">
		                <button type="submit" class="btn btn-primary btn-lg">
		                	<i class="fas fa-save me-2"></i>Enregistrer le Doc
		        		</button>
				        <button type="reset" class="btn btn-outline-secondary btn-sm">
		                	Effacer les champs
		            	</button>
		        	</div>
				</div>
			</div>
		</form>
	</div>
</div>