document.addEventListener('DOMContentLoaded', function() {
    const logoutButton = document.getElementById('logoutButton');

    if (logoutButton) {
        logoutButton.addEventListener('click', function(event) {
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
    }

    fetch('/ResourceFi/Web-Technologies/Backend/user_services/check_isAdmin.php', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        if (!data.authenticated) {
            window.location.href = 'login';
        } else {
            fetch('/ResourceFi/Web-Technologies/Backend/user_services/check_isAdmin.php', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.is_admin) {
                    document.getElementById('database-access').style.display = 'block';
                }
            })
            .catch(error => console.error('Error:', error));
        }
    })
    .catch(error => {
        console.error('Error:', error);
        window.location.href = 'login';
    });
});
