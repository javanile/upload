<?php

var_dump($_SERVER);

if (empty($_FILES)) {
    return printf(json_encode(['error' => 'Missing file fields.']));
}

$response = ['count' => 0];
foreach ($_FILES as $name => $file) {
    $response['count']++;
}

printf(json_encode($response, JSON_PRETTY_PRINT));
