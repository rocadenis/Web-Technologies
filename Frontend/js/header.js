document.addEventListener('DOMContentLoaded', function() {
    fetch('/ResourceFi/Web-Technologies/Backend/user_services/check_session.php')
        .then(response => response.json())
        .then(data => {
            const navLinks = document.getElementById('nav-links');
            navLinks.innerHTML = '';

            if (data.authenticated) {
                navLinks.innerHTML += `<li><a href="admin" class="btn nav-btn">Settings</a></li>`;
                navLinks.innerHTML += `<li><a href="#" id="logoutButton" class="btn nav-btn">Log out</a></li>`;
                
                document.getElementById('logoutButton').addEventListener('click', function(event) {
                    event.preventDefault();
                    fetch('/ResourceFi/Web-Technologies/Backend/user_services/logout_user.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            window.location.href = 'login';
                        } else {
                            alert('Failed to log out.');
                        }
                    })
                    .catch(error => console.error('Error:', error));
                });
            } else {
                navLinks.innerHTML += `<li><a href="login" class="btn nav-btn">Log in</a></li>`;
                navLinks.innerHTML += `<li><a href="signup" class="btn nav-btn">Sign up</a></li>`;
            }
        })
        .catch(error => console.error('Error:', error));
});
