document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.search-btn').addEventListener('click', function() {
        performSearch();
    });
});

function performSearch() {
    const searchTerm = document.querySelector('.search-input').value.trim();
    const programmingLanguages = ["C++", "JavaScript", "Swift", "Rust", "Kotlin", "HTML5", "TypeScript", "Clojure", "GLSL", "HLSL", "WGSL", "MSL", "CUDA", "Python", "Java"];
    let language = "";

    // Check if the search term contains any programming language
    programmingLanguages.forEach(lang => {
        if (searchTerm.toLowerCase().includes(lang.toLowerCase())) {
            language = lang;
        }
    });

    if (!searchTerm) {
        displayResults([]);
        return;
    }

    fetch(`../backend/services/search_resources.php?q=${encodeURIComponent(searchTerm)}&language=${encodeURIComponent(language)}`)
        .then(response => response.json())
        .then(data => displayResults(data))
        .catch(error => console.error('Error:', error));
}

function displayResults(data) {
    const resultsContainer = document.getElementById('results');
    resultsContainer.innerHTML = '';

    if (data.length > 0) {
        data.forEach(resource => {
            const resourceDiv = document.createElement('div');
            resourceDiv.className = 'resource';

            resourceDiv.innerHTML = `
                <h3>${resource.name}</h3>
                <p><a href="${resource.url}" target="_blank">${resource.url}</a></p>
                <p>${resource.description}</p>
            `;

            resultsContainer.appendChild(resourceDiv);
        });
    } else {
        resultsContainer.innerHTML = '<p>No results found.</p>';
    }
}
