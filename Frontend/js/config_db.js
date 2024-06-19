$(document).ready(function() {
    loadTableData();

    $('#add-row-form').submit(function(event) {
        event.preventDefault();
        $.ajax({
            url: '../../Web-Technologies/Backend/database/add_row.php',
            type: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                alert('New record created successfully');
                loadTableData();
            },
            error: function(xhr, status, error) {
                console.error('Error:', xhr.responseText);
            }
        });
    });

    document.getElementById('import-csv').addEventListener('click', function() {
        document.getElementById('file-input').click();
        document.getElementById('file-input').dataset.type = 'csv';
    });

    document.getElementById('import-json').addEventListener('click', function() {
        document.getElementById('file-input').click();
        document.getElementById('file-input').dataset.type = 'json';
    });

    document.getElementById('file-input').addEventListener('change', function(event) {
        const fileType = event.target.dataset.type;
        const file = event.target.files[0];
        if (file) {
            const formData = new FormData();
            formData.append('file', file);
            formData.append('type', fileType);
            
            fetch('../../Web-Technologies/Backend/database/import_data.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => alert(data))
            .catch(error => console.error('Error:', error));
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
    $.ajax({
        url: '../../Web-Technologies/Backend/database/get_rows.php',
        type: 'GET',
        success: function(data) {
            $('#database-table tbody').html(data);
        },
        error: function(xhr, status, error) {
            console.error('Error:', xhr.responseText);
        }
    });
}

function saveToDatabase(editableObj, column, id) {
    $.ajax({
        url: '../../Web-Technologies/Backend/database/save_edit.php',
        type: 'POST',
        data: 'column=' + column + '&editval=' + editableObj.innerText + '&id=' + id,
        success: function(response) {
            console.log('Save successfully');
        },
        error: function(xhr, status, error) {
            console.error('Error:', xhr.responseText);
        }
    });
}

function deleteRow(id) {
    if (confirm('Are you sure you want to delete this row?')) {
        $.ajax({
            url: '../../Web-Technologies/Backend/database/delete_row.php',
            type: 'POST',
            data: 'id=' + id,
            success: function(response) {
                loadTableData();
            },
            error: function(xhr, status, error) {
                console.error('Error:', xhr.responseText);
            }
        });
    }
}
