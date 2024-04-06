<?php include "includes/admin_header.php" ?>
<?php 
if(isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
    $query = "SELECT * FROM users WHERE username = '{$username}' ";
    $select_user_profile_query = mysqli_query($connection, $query);
    while($row = mysqli_fetch_array($select_user_profile_query)) {
        $user_id        = $row['user_id'];
        $username       = $row['username'];
        $user_password  = $row['user_password'];
        $user_firstname = $row['user_firstname'];
        $user_lastname  = $row['user_lastname'];
        $user_email     = $row['user_email'];
        $user_image     = $row['user_image'];
    }
}
?>
<?php
// Checking for submit and updatating the values in the database
if(isset($_POST['edit_user'])) {
    $user_firstname     = $_POST['user_firstname'];
    $user_lastname      = $_POST['user_lastname'];
    $username           = $_POST['username'];
    $user_email         = $_POST['user_email'];
    $user_password      = $_POST['user_password'];
    
    // Old Password encryption
        // Getting randSalt from user table
        $query = "SELECT randSalt FROM users ";
        $select_randSalt_query = mysqli_query($connection, $query);
        if(!$select_randSalt_query) {
            die("Query Failed" . mysqli_error($connection));
        }
        $row = mysqli_fetch_array($select_randSalt_query);
        $salt = $row['randSalt'];
        $hashed_password = crypt($user_password, $salt);

    // Update Query
    $query = "UPDATE users SET ";
    $query .= "user_firstname   = '{$user_firstname}', ";
    $query .= "user_lastname    = '{$user_lastname}', ";
    $query .= "username         = '{$username}', ";
    $query .= "user_email       = '{$user_email}', ";
    $query .= "user_password    = '{$hashed_password}' ";
    $query .= "WHERE username    = '{$username}' ";

    $edit_user_query = mysqli_query($connection, $query);
    confirmQuery($edit_user_query);
}

?>
<body>
    <div id="wrapper">

        <!-- Navigation -->
        <?php include "includes/admin_navigation.php" ?>

        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Welcome to Admin
                            <small><?php echo $_SESSION['username']; ?></small>
                        </h1>

                        <?php
                        if(isset($_POST['edit_user'])) {
                            echo "<p class='bg-success'>Profile Updated. <a href='users.php'> View User? </a> ";

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
                                <input type="submit" value="Update Profile" name="edit_user" class="btn btn-primary">
                            </div>                               
                        </form>
                    </div>
                </div>
                <!-- /.row -->
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    <?php include "includes/admin_footer.php" ?>
</body>
</html>
