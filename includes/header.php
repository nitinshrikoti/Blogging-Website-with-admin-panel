<?php include "includes/db.php" ?>
<?php include "admin/functions.php" ?>

<?php ob_start(); ?> 
<!-- Starting session so we can pull and display information in admin -->
<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Home - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/cms/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/cms/css/blog-home.css" rel="stylesheet">
    
    <link href="/cms/css/styles.css" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Slabo+13px&display=swap" rel="stylesheet">

    <style>
        *{
            color: #31363F;
        }

        .bgcolor {
            background-color: #f5f5f5;
            border-radius: 10px;
        }

        body {
            padding-top: 4px;
            background-color: #DDDDDD;
            
        }

        a.unlike, a.like, p.likes {
            font-size: 22px !important;
        }

        h1, h2, h3, h4 {
            font-family: "Playfair Display", serif;
            font-optical-sizing: auto;
            font-weight: 400;
            font-style: italic;
            
        }

        p {
            font-family: "Slabo 13px", serif;
            font-weight: 400;
            font-style: normal;
        }

        hr {
            border-top: 1px solid #C7C8CC;
        }
        
        ul.scroll{
            width: 65rem;
        }

    </style>

</head>

<body>