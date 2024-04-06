<?php
function redirect($location) {
    header("Location: " .$location);
    exit;
}

function ifItIsMethod($method=null) {
    if($_SERVER['REQUEST_METHOD'] == strtoupper($method)) {
        return true;
    }
    return false;
}

function isLoggedIn() {
    if(isset($_SESSION['user_role'])) {
        return true;    
    }
}

function checkIfUserIsLoggedInAndRedirect($redirectLocation=null) {
    if(isLoggedIn()) {
        redirect($redirectLocation);
    }
}

function escape($string) {
    global $connection;
    return mysqli_real_escape_string($connection, trim($string));
}

function confirmQuery($result) {
    global $connection;
    if(!$result) {
        // die("QUERY FAILED ." . mysqli_error($connection));
        die("QUERY FAILED " . mysqli_error($connection) . ' ' . mysqli_errno($connection) );
    }
}

function users_online() {
    if(isset($_GET['onlineusers'])) {
        global $connection;
        if(!$connection) {
            session_start();
            include("../includes/db.php");

            $session = session_id();
            $time = time();
            $time_out_in_second = 05;
            $time_out = time() - $time_out_in_second;
    
            $qurey = "SELECT * FROM users_online WHERE session = '$session' ";
            $send_query = mysqli_query($connection, $qurey);
            $count = mysqli_num_rows($send_query);
    
            if($count == NULL) {
                mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session', '$time')");
            } else {
                mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session' ");
            }
            $users_online_query = mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out' " );
            echo $count_user = mysqli_num_rows($users_online_query);
        } // if
    } // Get req isset
}
users_online();




function insert_categoires() {
    global $connection;
    if(isset($_POST['submit'])) {
        $cat_title = $_POST['cat_title'];
        if($cat_title == "" || empty($cat_title)) {
            echo "This field should not be empty";
        } else {
            $query = "INSERT INTO categories(cat_title) ";
            $query .= "VALUE('{$cat_title}') ";
            $create_category_query = mysqli_query($connection, $query);
            if(!$create_category_query) {
                die('QUERY FAILED' . mysqli_error($connection));
            }
        }
    }
}

function findAllCategories() {
    global $connection;
    
    $query = "SELECT * FROM categories";
    $select_categories = mysqli_query($connection, $query);
    
    while($row = mysqli_fetch_assoc($select_categories)) {
        $cat_id = $row['cat_id'];
        $cat_title = $row['cat_title'];
        
        echo "<tr>";
        echo "<td>{$cat_id}</td>";
        echo "<td>{$cat_title}</td>";
        echo "<td> <a href='categories.php?delete={$cat_id}'>Delete</a> </td>";
        echo "<td> <a href='categories.php?edit={$cat_id}'>Edit</a> </td>";
        echo "</tr>";
    }
}

function delete_categories() {
    global $connection;
    if(isset($_GET['delete'])) {
        $the_cat_id = $_GET['delete'];
        $query = "DELETE FROM categories WHERE cat_id = {$the_cat_id} ";
        $delete_query = mysqli_query($connection, $query);
        header("Location: categories.php");
    }
}

function recordCount($table) {
    global $connection;
    $query = "SELECT * FROM " . $table ;
    $select_all = mysqli_query($connection, $query);
    return mysqli_num_rows($select_all);
}

function checkStatus($table, $column, $status) {
    global $connection;
    $query = "SELECT * FROM $table WHERE $column = '$status' ";
    $select_all = mysqli_query($connection, $query);
    return mysqli_num_rows($select_all);
}

function checkUserRole($table, $column, $role) {
    global $connection;
    $query = "SELECT * FROM $table WHERE $column = '$role' ";
    $select_all_subscribers = mysqli_query($connection, $query);
    return mysqli_num_rows($select_all_subscribers);

}

function is_admin($username) {
    global $connection;
    $query = "SELECT user_role FROM users WHERE username = '$username' ";
    $result = mysqli_query($connection, $query);
    $row = mysqli_fetch_assoc($result);

    if($row['user_role'] == 'admin') {
        return true;
    } else {
        return false;
    }

}

function username_exits($username) {
    global $connection;
    $query = "SELECT username FROM users WHERE username = '$username' ";
    $result = mysqli_query($connection, $query);
    if(mysqli_num_rows($result) > 0) {
        return true;
    }else {
        return false;
    }
}
function email_exits($email) {
    global $connection;
    $query = "SELECT user_email FROM users WHERE user_email = '$email' ";
    $result = mysqli_query($connection, $query);
    if(mysqli_num_rows($result) > 0) {
        return true;
    }else {
        return false;
    }
}

function register_user($username, $email, $password) {
    global $connection;
    // If registration fields are not empty
    
        $username   = mysqli_real_escape_string($connection, $username);
        $email      = mysqli_real_escape_string($connection, $email);
        $password   = mysqli_real_escape_string($connection, $password);

        // Encrypting password
        $password = password_hash($password, PASSWORD_BCRYPT, array('cost' => 12));

        $query = "INSERT INTO users (username, user_email, user_password, user_role) ";
        $query .= "VALUES('{$username}', '{$email}', '{$password}', 'subscriber' )";
        $register_user_query = mysqli_query($connection, $query);
        confirmQuery($register_user_query);
    
}

function login_user($username, $password) {
    global $connection;
    $username = trim($username);
    $password = trim($password);
    // Cleaning up input
    $username = mysqli_real_escape_string($connection, $username);
    $password = mysqli_real_escape_string($connection, $password);

    $query = "SELECT * FROM users WHERE username = '{$username}' ";
    $select_user_query = mysqli_query($connection, $query);
    confirmQuery($select_user_query);
    while($row = mysqli_fetch_array($select_user_query)) {
        $db_user_id         = $row['user_id'];
        $db_username        = $row['username'];
        $db_user_password   = $row['user_password'];
        $db_user_firstname  = $row['user_firstname'];
        $db_user_lastname   = $row['user_lastname'];
        $db_user_role       = $row['user_role'];
        if (password_verify($password, $db_user_password)) {
             // Setting/assigning sessions so we can pull it elsewhere
             $_SESSION['username']   = $db_username;
             $_SESSION['firstname']  = $db_user_firstname;
             $_SESSION['lastname']   = $db_user_lastname;
             $_SESSION['user_role']  = $db_user_role;
     
             redirect("/cms/admin");
         }else {
             return false;
         }
    }
}