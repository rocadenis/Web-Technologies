document.addEventListener('DOMContentLoaded', function() {
    const signupForm = document.getElementById('signupForm');
    const loginForm = document.getElementById('loginForm');
    const logoutButton = document.getElementById('logoutButton');

    if (signupForm) {
        signupForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const name = document.getElementById('registerName').value;
            const email = document.getElementById('registerEmail').value;
            const password = document.getElementById('registerPassword').value;

            console.log({name, email, password}); // Log data being sent

            fetch('/ResourceFi/Web-Technologies/Backend/user_services/register_user.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({name, email, password})
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                alert(data.message);
            })
            .catch(error => console.error('Error:', error));
        });
    }

    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const email = document.getElementById('loginEmail').value;
            const password = document.getElementById('loginPassword').value;

            fetch('/ResourceFi/Web-Technologies/Backend/user_services/login_user.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({email, password})
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    // Redirect to 'index.html' after successful login
                    window.location.href = 'logged_in_index.html';
                } else {
                    // Display error message within the form
                    const errorMsg = document.getElementById('loginError');
                    errorMsg.textContent = data.message;
                    errorMsg.style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                const errorMsg = document.getElementById('loginError');
                errorMsg.textContent = 'Login failed due to an error.';
                errorMsg.style.display = 'block';
            });
        });
    }

    if (logoutButton) {
        logoutButton.addEventListener('click', function(event) {
            event.preventDefault();  // Prevent the default anchor behavior

            fetch('/ResourceFi/Web-Technologies/Backend/user_services/logout_user.php', { 
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    // Redirect to 'index.html' or any public page after successful logout
                    window.location.href = 'index.html';
                } else {
                    // Optionally handle errors or display a message
                    console.error('Logout failed:', data.message);
                    alert('Failed to log out. Please try again.'); // Use a more integrated UI message in production
                }
            })
            .catch(error => {
                console.error('Error during logout:', error);
                alert('Error logging out.'); // Use a more integrated UI message in production
            });
        });
    }
});
