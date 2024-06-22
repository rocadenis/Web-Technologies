document.addEventListener('DOMContentLoaded', function() {
    fetch('/ResourceFi/Web-Technologies/Backend/user_services/check_isAdmin.php')
        .then(response => response.json())
        .then(data => {
            if (!data.authenticated || !data.is_admin) {
                window.location.href = 'login';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            window.location.href = 'login';
        });

    document.getElementById('logoutButton').addEventListener('click', function(event) {
        event.preventDefault();  // Prevent the default anchor behavior

        fetch('/ResourceFi/Web-Technologies/Backend/user_services/logout_user.php', { 
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.href = 'home';
            } else {
                console.error('Logout failed:', data.message);
                alert('Failed to log out. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error during logout:', error);
            alert('Error logging out.');
        });
    });
});
