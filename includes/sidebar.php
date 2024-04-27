<?php
if(ifItIsMethod('post')) {
    // if(ifItIsMethod('post')) {
        if(isset($_POST['username']) && isset($_POST['password'])) {
            login_user($_POST['username'], $_POST['password']);
        } 
        // else {
        //     redirect('index');
        // }
    
    // }
}
?>

<!-- Blog Search Well -->
<div class="col-md-4 ">
    <div class="bgcolor well">
        <h4>Blog Search</h4>
        <form action="search.php" method="post">
            <div class="input-group">
                <input name="search" type="text" class="form-control">
                <span class="input-group-btn">
                    <button name="submit" class="btn btn-default" type="submit">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.input-group -->
    </div>

    <!-- Login -->
    <div class="bgcolor well">
        <?php if(isset($_SESSION['user_role'])): ?>
            <h4>Logged in as <?php echo $_SESSION['username'] ?></h4>
            <a href="/cms/includes/logout.php" class="btn btn-primary">Logout</a>
        <?php else: ?>
            <h4>Login</h4>
            <form action="#" method="post">
                <div class="form-group">
                    <input name="username" type="text" class="form-control" placeholder="Enter Username">
                </div>
                <div class="input-group">
                    <input name="password" type="password" class="form-control" placeholder="Enter Password">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" name="login" type="submit">Submit</button>
                    </span>
                </div>
            </form>
        <?php endif; ?>
        
        <!-- /.input-group -->
    </div>

    <!-- Blog Categories Well -->
    <div class="bgcolor well">
    <?php
    
    ?>
        <h4>Blog Categories</h4>
        <div class="row">
            <div class="col-lg-12">
            <div style="height: 200px; overflow-y: auto;">
                <ul class="list-unstyled">
                    <?php
                    $query = "SELECT * FROM categories";
                    $select_categories_sidebar = mysqli_query($connection, $query);
                    while($row = mysqli_fetch_assoc($select_categories_sidebar)) {
                        $cat_id = $row['cat_id'];
                        $cat_title = $row['cat_title'];
                        echo "<li> <a href='/cms/category.php?category=$cat_id'> {$cat_title} </a> </li>";
                    }
                    ?>
                </ul>
            </div>
            </div>
            
        </div>
        <!-- /.row -->
    </div>

    <!-- About Us -->
    <div class="bgcolor well">
        <h4>About Us</h4>
        <div class="row">
            <div class="col-lg-12">
                <p style="font-family: cursive; font-size: 13px;">
                    Welcome to E:{LOG}, where voices converge and stories unfold. We are a vibrant community of writers, thinkers, and storytellers, passionate about sharing diverse perspectives and ideas through the art of blogging.<br><br>

                    At E:{LOG}, we believe in the power of words to inspire, inform, and connect. Whether you're a seasoned writer or a budding wordsmith, our platform provides a space for you to express yourself, engage with others, and contribute to meaningful conversations.<br><br>

                    Join us on a journey of exploration, where every blog post is an opportunity to spark dialogue, foster understanding, and ignite change. Together, let's build a platform that celebrates creativity, embraces diversity, and empowers voices from all walks of life.<br><br>

                    Welcome to the community. Welcome to E:{LOG}.</p>
            </div>
            
        </div>
        <!-- /.row -->
    </div>

    <!-- Contact Us -->
    <div class="bgcolor well">
        <h4>Any Queries? <br><vr> 
            <a style=" font-size: 30px;" href="../cms/contact.php">Contact Us</a></h4>
            
        </div>
        <!-- /.row -->
    </div>
    <!-- Side Widget Well -->
    <!-- <?php include "widget.php" ?> -->
</div>