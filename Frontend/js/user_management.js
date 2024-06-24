document.addEventListener('DOMContentLoaded', function() {
    const logoutButton = document.getElementById('logoutButton');

    // Log out event listener
    if (logoutButton) {
        logoutButton.addEventListener('click', function(event) {
            event.preventDefault();
            fetch('/ResourceFi/Web-Technologies/Backend/user_services/logout_user.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.text())  // Fetch response as text first
            .then(text => {
                try {
                    const data = JSON.parse(text);  // Try to parse JSON
                    if (data.success) {
                        window.location.href = 'login';
                    } else {
                        alert('Failed to log out.');
                    }
                } catch (error) {
                    console.error('JSON parse error:', error);
                    alert('An error occurred while logging out.');
                }
            })
            .catch(error => console.error('Error:', error));
        });
    }

    // Check authentication and admin status
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
        } else if (!data.is_admin) {
            alert('You do not have permission to access this page.');
            window.location.href = 'home';
        } else {
            loadUserData();
        }
    })
    .catch(error => {
        console.error('Error:', error);
        window.location.href = 'login';
    });

    document.getElementById('add-user-form').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(this);
        fetch('/ResourceFi/Web-Technologies/Backend/user_services/admin_register_user.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message || 'New user created successfully');
            loadUserData();
        })
        .catch(error => console.error('Error:', error));
    });
});

function loadUserData() {
    fetch('/ResourceFi/Web-Technologies/Backend/user_services/get_users.php')
    .then(response => response.json())
    .then(data => {
        const tbody = document.querySelector('#user-table tbody');
        tbody.innerHTML = '';
        data.forEach(user => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${user.id}</td>
                <td contenteditable="true" onblur="saveToDatabase(this, 'name', ${user.id})">${user.name}</td>
                <td contenteditable="true" onblur="saveToDatabase(this, 'email', ${user.id})">${user.email}</td>
                <td>********</td>
                <td>
                    <input type="checkbox" ${user.is_admin == 1 ? 'checked' : ''} onclick="toggleAdmin(${user.id}, this.checked)">
                </td>
                <td>
                    <button onclick="deleteUser(${user.id})">Delete</button>
                </td>
            `;
            tbody.appendChild(row);
        });
    })
    .catch(error => console.error('Error:', error));
}

function saveToDatabase(editableObj, column, id) {
    const newValue = editableObj.innerText;
    fetch('/ResourceFi/Web-Technologies/Backend/user_services/save_edit.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            'id': id,
            'column': column,
            'editval': newValue
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.message) {
            console.log('Save successfully');
        } else if (data.error) {
            console.error('Error:', data.error);
        }
    })
    .catch(error => console.error('Error:', error));
}

function deleteUser(id) {
    if (confirm('Are you sure you want to delete this user?')) {
        fetch('/ResourceFi/Web-Technologies/Backend/user_services/delete_user.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'id': id
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.message) {
                loadUserData();  // Refresh the rows after deletion
            } else if (data.error) {
                console.error('Error:', data.error);
            }
        })
        .catch(error => console.error('Error:', error));
    }
}

function toggleAdmin(id, isAdmin) {
    fetch('/ResourceFi/Web-Technologies/Backend/user_services/toggle_admin.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            'id': id,
            'is_admin': isAdmin ? 1 : 0
        })
    })
    .then(response => response.text())  // Fetch response as text first
    .then(text => {
        try {
            const data = JSON.parse(text);  
            if (data.message) {
                console.log('Admin status updated successfully');
            } else if (data.error) {
                console.error('Error:', data.error);
                alert('An error occurred while updating admin status.');
            }
        } catch (error) {
            console.error('JSON parse error:', error);
            console.log('Raw response text:', text); 
            alert('An error occurred while updating admin status.');
        }
    })
    .catch(error => console.error('Error:', error));
}
