document.addEventListener('DOMContentLoaded', function() {
    loadTableData();

    document.getElementById('add-row-form').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(this);
        fetch('../../Web-Technologies/Backend/database/add_row.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message || 'New record created successfully');
            loadTableData();
        })
        .catch(error => console.error('Error:', error));
        loadTableData();  
    });

    document.getElementById('import-csv').addEventListener('click', function() {
        document.getElementById('file-input').setAttribute('data-type', 'csv');
        document.getElementById('file-input').click();
    });

    document.getElementById('import-json').addEventListener('click', function() {
        document.getElementById('file-input').setAttribute('data-type', 'json');
        document.getElementById('file-input').click();
    });

    document.getElementById('file-input').addEventListener('change', function(event) {
        const fileType = this.getAttribute('data-type');
        const file = this.files[0];
        if (file) {
            const formData = new FormData();
            formData.append('file', file);
            formData.append('type', fileType);

            fetch('../../Web-Technologies/Backend/database/import_data.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.message) {
                    alert(data.message);
                } else if (data.error) {
                    alert(data.error);
                }
                loadTableData();
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while importing data.');
                loadTableData();  
            });
        }
    });

    document.getElementById('export-csv').addEventListener('click', function() {
        window.location.href = '../../Web-Technologies/Backend/database/export_data.php?type=csv';
    });

    document.getElementById('export-json').addEventListener('click', function() {
        window.location.href = '../../Web-Technologies/Backend/database/export_data.php?type=json';
    });
});

function loadTableData() {
    fetch('../../Web-Technologies/Backend/database/get_rows.php')
    .then(response => response.text())
    .then(data => {
        document.querySelector('#database-table tbody').innerHTML = data;
        loadTableData();  
    })
    .catch(error => console.error('Error:', error));
    loadTableData();  
}

function saveToDatabase(editableObj, column, id) {
    const newValue = editableObj.innerText;
    fetch('../../Web-Technologies/Backend/database/save_edit.php', {
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
            loadTableData();  
        } else if (data.error) {
            console.error('Error:', data.error);
            loadTableData();  
        }
    })
    .catch(error => console.error('Error:', error));
}

function deleteRow(id) {
    if (confirm('Are you sure you want to delete this row?')) {
        fetch('../../Web-Technologies/Backend/database/delete_row.php', {
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
                loadTableData();  // Refresh the rows after deletion
            } else if (data.error) {
                console.error('Error:', data.error);
            }
        })
        .catch(error => console.error('Error:', error));
    }
}
