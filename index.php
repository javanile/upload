<?php

if (empty($_FILES) || empty($_SERVER['REQUEST_METHOD']) || $_SERVER['REQUEST_METHOD'] !== 'POST') {
    return printf(json_encode(['error' => 'Missing file field (use -F option).']).PHP_EOL);
}

if (empty(getallheaders()['Secret']) || getallheaders()['Secret'] !== getenv('UPLOAD_SECRET')) {
    return printf(json_encode(['error' => 'Missing authentication header (use -H option).']).PHP_EOL);
}

$response = [
    'uploaded' => []
];

foreach ($_FILES as $name => $file) {
    if (move_uploaded_file($file['tmp_name'], '/files/'.$file['name'])) {
        $response['uploaded'][] = $name;
    }
}

printf(json_encode($response, JSON_PRETTY_PRINT).PHP_EOL);
