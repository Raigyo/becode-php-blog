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
                'port' =>  '5442',
                'host' => 'ec2-34-200-15-192.compute-1.amazonaws.com',
                'dbname' => 'dcr9uhgkn145e5',
                'user' => 'dkbufqrzacrsot',
                'pass' => 'b1a939740eea029b162e5caab62a8bb5cc9b5271b079477cf0f07d7df10d729c'
            ]
        ],
];
