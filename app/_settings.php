<?php

return [
        'settings' => [
            'displayErrorDetails' => false,
            // Twig templates settings
            'view' => [
                'path' => __DIR__ . '/../templates',
                'description' => 'My website',
                'baseUrl' => '/../',
                'twig' => [
                'cache' => false
                ],
            ],
            // Database connection settings
            'db' => [
                'host' => 'XXXXXXXX',
                'dbname' => 'XXXXXXXX',
                'user' => 'XXXXXXXX',
                'pass' => 'XXXXXXXX'
            ]
        ],
];
