document.addEventListener('DOMContentLoaded', function() {
    const logoutButton = document.getElementById('logoutButton');
    const emailForm = document.getElementById('account-settings-form');
    const passwordForm = document.getElementById('password-change-form');

    passwordForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission
        console.log("Password form submission intercepted."); // Debug log

        const formData = new FormData(passwordForm);
        const jsonData = Object.fromEntries(formData.entries());

        console.log('Sending JSON Data:', JSON.stringify(jsonData)); // Debug: log data

        fetch('/ResourceFi/Web-Technologies/Backend/user_services/change_password.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(jsonData)
        })
        .then(response => {
            console.log('Raw response:', response); // Log the raw response
            return response.text(); // Return response text to log it
        })
        .then(text => {
            console.log('Response text:', text); // Log the response text
            try {
                const data = JSON.parse(text); // Attempt to parse JSON
                console.log('Parsed JSON Response:', data); // Debug: log response
                alert(data.message);
            } catch (error) {
                console.error('JSON parse error:', error); // Log JSON parse error
                alert('An error occurred while parsing the server response.');
            }
        })
        .catch(error => {
            console.error('Fetch error:', error); // Log fetch error
            alert('An error occurred: ' + error.message);
        });
    });

    emailForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission
        console.log("Form submission intercepted."); // Debug log

        const formData = new FormData(emailForm);
        const jsonData = Object.fromEntries(formData.entries());

        console.log('Sending JSON Data:', JSON.stringify(jsonData)); // Debug: log data

        fetch('/ResourceFi/Web-Technologies/Backend/user_services/change_email.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(jsonData)
        })
        .then(response => {
            console.log('Raw response:', response); // Log the raw response
            return response.text(); // Return response text to log it
        })
        .then(text => {
            console.log('Response text:', text); // Log the response text
            try {
                const data = JSON.parse(text); // Attempt to parse JSON
                console.log('Parsed JSON Response:', data); // Debug: log response
                alert(data.message);
            } catch (error) {
                console.error('JSON parse error:', error); // Log JSON parse error
                alert('An error occurred while parsing the server response.');
            }
        })
        .catch(error => {
            console.error('Fetch error:', error); // Log fetch error
            alert('An error occurred: ' + error.message);
        });
    });

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
