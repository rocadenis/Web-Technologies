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
