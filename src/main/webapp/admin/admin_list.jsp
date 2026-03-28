<table class="table table-hover bg-white shadow-sm">
	<thead class="table-dark">
		<tr>
			<th>ID</th>
		    <th>Titre</th>
		    <th>Auteur</th>
		    <th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="doc" items="${documents}">
			<tr>
		        <td>${doc.id}</td>
		        <td>${doc.titre}</td>
		        <td>${doc.auteur}</td>
		       	<td>
		       		<a href="details?id=${doc.id}" class="btn btn-info btn-sm text-white"><i class="fa-regular fa-eye"></i> </a>
		            <a href="admin?action=edit&id=${doc.id}" class="btn btn-warning btn-sm"><i class="fas fa-pencil"></i> </a>
		    		<a href="admin?action=delete&id=${doc.id}" class="btn btn-danger btn-sm"><i class="fa-regular fa-trash-can"></i></a>
		    	</td>
			</tr>
		</c:forEach>
	</tbody>
</table>