<html xmlns:th="http://www.thymeleaf.org" > 
	<body> 
		<div class="navigation-bar" th:fragment="navbar">
			<nav>
				<ul class="nav-list">
					<li class="nav-link" data-page="home"><a href="/home">Home</a></li>
					<li class="nav-link" data-page="viewCollections"><a href="/viewCollections">Collections</a></li>
					<li class="nav-link" data-page="entrySubmission"><a href="/entrySubmission">Entries</a></li>
				</ul>
			</nav>
		</div>
	</body>
</html>
