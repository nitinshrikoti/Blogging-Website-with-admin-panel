<div class="container">


<nav class="navbar navbar-default navbar-inverse" role="navigation" style="align-content: center;height: 8rem;border-radius: 44px;" >
    <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/cms" style="padding-top: 0; padding-right: 90px;"><img src="/cms/images/log.png" height="50" width="50" alt="" ></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="font-size: larger;">
            <div >
                <ul class="nav navbar-nav ">
                    <?php 
                    $query = "SELECT * FROM categories LIMIT 8";
                    $select_all_categories_query = mysqli_query($connection, $query);
                    while($row = mysqli_fetch_assoc($select_all_categories_query)) {
                        $cat_title  = $row['cat_title'];
                        $cat_id     = $row['cat_id'];

                        // Activating current class
                        $category_class = '';
                        $registration_class = '';
                        $contact_class = '';
                        $pageName = basename($_SERVER['PHP_SELF']);
                        $registration = 'registration.php';
                        $contact = 'contact.php';
                        if(isset($_GET['category']) && $_GET['category'] == $cat_id) {
                            $category_class = 'active';
                        } else if($pageName == $registration) {
                            $registration_class = 'active';
                        } else if($pageName == $contact) {
                            $contact_class = 'active';
                        }
                        echo "<li class='$category_class' > <a href='/cms/category/{$cat_id}' style='border-radius: 30px;'> {$cat_title} </a> </li>";
                    }
                    ?>
                </ul>
            </div>
            <div>
                <ul class="nav navbar-nav pull-right">
                    <?php
                    if(isLoggedIn()) {
                        echo "<li> <a href='/cms/admin' style='border-radius: 30px;'>Admin</a> </li>";
                        echo "<li> <a href='/cms/includes/logout.php' style='border-radius: 30px;'>Logout</a> </li>";
                    } else {
                        echo "<li> <a href='/cms/login' style='border-radius: 30px;'>Login</a> </li>";
                    }
                    if(!isLoggedIn()) {
                        echo "<li class='$registration_class pull-right' > <a class='pull-right' href='/cms/registration' style='border-radius: 30px;'>Registration</a> </li>";
                    }
                    // echo "<li class='$contact_class'> <a href='/cms/contact'>Contact</a> </li>";
                    ?>
                    <?php 
                    if(isset($_SESSION['user_role'])) {
                        if(isset($_GET['p_id'])) {
                            $the_post_id = $_GET['p_id'];
                            echo "<li><a href='/cms/admin/posts.php?source=edit_post&p_id={$the_post_id}'>Edit Post</a></li>";
                        }
                    }
                    ?> 
                </ul>
            </div>
                <!-- <li> <a href="/cms/login">Login</a> </li> -->
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

</div>