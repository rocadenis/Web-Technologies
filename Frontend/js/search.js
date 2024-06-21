// js/search.js

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('search-btn').addEventListener('click', function() {
        const query = document.getElementById('search-input').value.trim();

        if (query.length > 0) {
            fetch(`/ResourceFi/Web-Technologies/Backend/search_services/search.php?query=${encodeURIComponent(query)}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const resultsContainer = document.getElementById('search-results');
                    resultsContainer.innerHTML = '';

                    console.log('Data received:', data); // Log the received data

                    if (data.error) {
                        resultsContainer.innerHTML = `<p>${data.error}</p>`;
                    } else if (!Array.isArray(data) || data.length === 0) {
                        resultsContainer.innerHTML = '<p>No results found.</p>';
                    } else {
                        const table = document.createElement('table');
                        table.innerHTML = `
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>URL</th>
                                    <th>Description</th>
                                    <th>Language</th>
                                    <th>Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${data.map(row => `
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>${row.name}</td>
                                        <td><a href="${row.url}" target="_blank">${row.url}</a></td>
                                        <td>${row.description}</td>
                                        <td>${row.language}</td>
                                        <td>${row.type}</td>
                                    </tr>
                                `).join('')}
                            </tbody>
                        `;
                        resultsContainer.appendChild(table);
                    }
                })
                .catch(error => console.error('Error:', error));
        } else {
            alert('Please enter a query.');
        }
    });
});
