<?php
require_once 'database/import_data.php';
require_once 'database/export_data.php';

class ResourceController {
    public function importData() {
        include 'database/import_data.php';
    }

    public function exportData() {
        include 'database/export_data.php';
    }
}
?>
