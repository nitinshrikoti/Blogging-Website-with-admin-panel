<?php
// Checking for submit and updatating the values in the database
if(isset($_POST['create_user'])) {
    $user_firstname     = $_POST['user_firstname'];
    $user_lastname      = $_POST['user_lastname'];
    $user_role          = $_POST['user_role'];
    $username           = $_POST['username'];
    $user_email         = $_POST['user_email'];
    $user_password      = $_POST['user_password'];

    // Encrypting password
    $user_password = password_hash($user_password, PASSWORD_BCRYPT, array('cost' => 10));

    $query = "INSERT INTO users(user_firstname, user_lastname, user_role, username, user_email, user_password) ";
    $query .= "VALUES('{$user_firstname}', '{$user_lastname}', '{$user_role}', '{$username}', '{$user_email}', '{$user_password}' ) ";

    $create_user_query = mysqli_query($connection, $query);

    confirmQuery($create_user_query);
    echo "User Created: " . " " . "<a href='users.php'>View Users</a> ";
}

?>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">Firstname</label>
        <input type="text" name="user_firstname" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="title">Lastname</label>
        <input type="text" name="user_lastname" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="">User</label>
        <select name="user_role" id="">
            <option value="subscriber">Select Options</option>
            <option value="admin">Admin</option>
            <option value="subscriber">Subscriber</option>
        </select>
    </div>
    
    <div class="form-group">
        <label for="post_status">Username</label>
        <input type="text" name="username" id="" class="form-control">
    </div>
    <!-- <div class="form-group">
        <label for="post_image">Post Image</label>
        <input type="file" name="image" id="" class="form-control">
    </div> -->
    <div class="form-group">
        <label for="post_tags">Email</label>
        <input type="email" name="user_email" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="post_tags">Password</label>
        <input type="password" name="user_password" id="" class="form-control">
    </div>
    
    <div class="form-group">
        <input type="submit" value="Add User" name="create_user" class="btn btn-primary">
    </div>
    

</form>