document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('login-form');
    const signupForm = document.getElementById('signup-form');
    const filterBtn = document.querySelector('.filter-btn');
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
            // Add logic to handle login
            console.log(`Email: ${email}, Password: ${password}`);
        });
    }

    if (signupForm) {
        signupForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const name = sanitizeInput(document.getElementById('name').value);
            const email = sanitizeInput(document.getElementById('email').value);
            const password = sanitizeInput(document.getElementById('password').value);
            // Add logic to handle signup
            console.log(`Name: ${name}, Email: ${email}, Password: ${password}`);
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
