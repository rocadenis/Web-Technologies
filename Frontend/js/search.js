document.addEventListener('DOMContentLoaded', function() {
    function addCSSRule(sheet, selector, rules, index) {
        if (sheet.insertRule) {
            sheet.insertRule(`${selector} { ${rules} }`, index);
        } else if (sheet.addRule) {
            sheet.addRule(selector, rules, index);
        }
    }

    const styleSheet = document.createElement("style");
    document.head.appendChild(styleSheet);
    addCSSRule(styleSheet.sheet, '#search-results a', 'color: #f39c12;', 0);

    const searchBtn = document.getElementById('search-btn');
    const loadingSpinner = document.getElementById('loading-spinner');

    searchBtn.addEventListener('click', function() {
        const query = document.getElementById('search-input').value.trim();

        if (query.length > 0) {
            const resultsContainer = document.getElementById('search-results');
            resultsContainer.innerHTML = '';
            loadingSpinner.style.display = 'block'; // Show loading spinner

            fetch(`/ResourceFi/Web-Technologies/Backend/search_services/search.php?query=${encodeURIComponent(query)}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    loadingSpinner.style.display = 'none'; // Hide loading spinner
                    console.log('Data received:', data); // Log the received data

                    if (data.error) {
                        resultsContainer.innerHTML = `<p>${data.error}</p>`;
                    } else if (data.message === "No results found.") {
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
                                ${Object.keys(data).filter(key => key !== 'openai_summary').map(key => `
                                    <tr>
                                        <td>${data[key].id}</td>
                                        <td>${data[key].name}</td>
                                        <td><a href="${data[key].url}" target="_blank" style="color:#f39c12">${data[key].url}</a></td>
                                        <td>${data[key].description}</td>
                                        <td>${data[key].language}</td>
                                        <td>${data[key].type}</td>
                                    </tr>
                                `).join('')}
                            </tbody>
                        `;
                        resultsContainer.appendChild(table);
                    }
                })
                .catch(error => {
                    loadingSpinner.style.display = 'none'; // Hide loading spinner
                    console.error('Error:', error);
                    resultsContainer.innerHTML = `<p>An error occurred: ${error.message}</p>`;
                });
        } else {
            alert('Please enter a query.');
        }
    });
});
