<?php

$pdo = new PDO('mysql:host=db;dbname=homestead', 'homestead', 'secret');
if ($pdo) {
    print_r('foo');
    return;
}

var_dump($pdo);
