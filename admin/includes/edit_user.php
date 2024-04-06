<?php
// Getting data from database
if(isset($_GET['edit_user'])) {
    $the_user_id = $_GET['edit_user'];

    $query = "SELECT * FROM users WHERE user_id = '$the_user_id'";
    $select_users_query = mysqli_query($connection, $query);
    while($row = mysqli_fetch_assoc($select_users_query)) {
        $user_id        = $row['user_id'];
        $username       = $row['username'];
        $user_password  = $row['user_password'];
        $user_firstname = $row['user_firstname'];
        $user_lastname  = $row['user_lastname'];
        $user_email     = $row['user_email'];
        $user_image     = $row['user_image'];
        $user_role      = $row['user_role'];
    }

    // Checking for submit and updatating the values in the database
    if(isset($_POST['edit_user'])) {
        $user_firstname     = $_POST['user_firstname'];
        $user_lastname      = $_POST['user_lastname'];
        $user_role          = $_POST['user_role'];
        $username           = $_POST['username'];
        $user_email         = $_POST['user_email'];
        $user_password      = $_POST['user_password'];


        if(!empty($user_password)) {
            $query_password = "SELECT user_password FROM users WHERE user_id = '$user_id'";
            $get_user_query = mysqli_query($connection, $query_password);
            confirmQuery($get_user_query);
            $row = mysqli_fetch_array($get_user_query);
            $db_user_password = $row['user_password'];
            
            if($db_user_password != $user_password) {
                $hashed_password = password_hash($user_password, PASSWORD_BCRYPT, array('cost' => 10));
            }

            // Update Query
            $query = "UPDATE users SET ";
            $query .= "user_firstname   = '{$user_firstname}', ";
            $query .= "user_lastname    = '{$user_lastname}', ";
            $query .= "user_role        = '{$user_role}', ";
            $query .= "username         = '{$username}', ";
            $query .= "user_email       = '{$user_email}', ";
            $query .= "user_password    = '{$hashed_password}' ";
            $query .= "WHERE user_id    = {$the_user_id} ";
    
            $edit_user_query = mysqli_query($connection, $query);
            confirmQuery($edit_user_query);
            
            echo "<p class='bg-success'>User Updated. <a href='users.php'> View User? </a> ";
        } // if password empty check end
    } // post update user end
} else {    // If the user id is not present in the URL we redirect to the home page
    header("Location: index.php");
}
?>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">Firstname</label>
        <input type="text" name="user_firstname" value="<?php echo $user_firstname; ?>" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="title">Lastname</label>
        <input type="text" name="user_lastname" value="<?php echo $user_lastname; ?>" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="">User</label>
        <select name="user_role" id="">
            <option value="<?php echo $user_role; ?>"><?php echo $user_role; ?></option>
            <?php 
            if($user_role == 'admin') {
                echo "<option value='subscriber'>Subscriber</option>";
            } else {
                echo "<option value='admin'>Admin</option>";
            }
            ?>
        </select>
    </div>
    <div class="form-group">
        <label for="post_status">Username</label>
        <input type="text" name="username" value="<?php echo $username; ?>" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="post_tags">Email</label>
        <input type="email" name="user_email" value="<?php echo $user_email; ?>" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="post_tags">Password</label>
        <input autocomplete="off" type="password" name="user_password" id="" class="form-control">
    </div>
    
    <div class="form-group">
        <input type="submit" value="Update User" name="edit_user" class="btn btn-primary">
    </div>
    

</form>