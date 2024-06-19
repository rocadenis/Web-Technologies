document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('login-form');
    const signupForm = document.getElementById('signup-form');
    const filterBtn = document.getElementById('filter-btn');
    const filters = document.querySelector('.filters');

    function sanitizeInput(input) {
        const div = document.createElement('div');
        div.textContent = input;
        return div.innerHTML;
    }

    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const email = sanitizeInput(document.getElementById('email').value);
            const password = sanitizeInput(document.getElementById('password').value);

            fetch('../../Web-Technologies/Backend/user-services/login_user.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `email=${email}&password=${password}`
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                // Handle login response
            })
            .catch(error => console.error('Error:', error));
        });
    }

    if (signupForm) {
        signupForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const name = sanitizeInput(document.getElementById('name').value);
            const email = sanitizeInput(document.getElementById('email').value);
            const password = sanitizeInput(document.getElementById('password').value);

            fetch('../../Web-Technologies/Backend/user-services/register_user.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `name=${name}&email=${email}&password=${password}`
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                // Handle signup response
            })
            .catch(error => console.error('Error:', error));
        });
    }

    if (filterBtn) {
        filterBtn.addEventListener('click', function() {
            if (filters.classList.contains('show')) {
                filters.classList.remove('show');
            } else {
                filters.classList.add('show');
            }
        });
    }
});
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('search-btn').addEventListener('click', function() {
        const searchTerm = document.getElementById('search-input').value;
        const language = document.getElementById('language').value;

        fetch(`../backend/services/search_resources.php?q=${encodeURIComponent(searchTerm)}&language=${encodeURIComponent(language)}`)
            .then(response => response.json())
            .then(data => displayResults(data))
            .catch(error => console.error('Error:', error));
    });
});

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
