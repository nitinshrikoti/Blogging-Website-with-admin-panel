<?php include "includes/admin_header.php" ?>
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
                            Welcome <?php echo strtoupper(get_user_name()); ?>                           
                            <!-- <small><?php echo strtoupper(get_user_name()); ?></small> -->
                            <small>
                                <br>
                                <?php if(is_admin()) {
                                    echo "User Role: Admin";
                                } elseif(is_subscriber()) {
                                    echo "User Role: Subscriber";
                                }
                                ?>
                            </small>
                        </h1>
                        <?php
                        if(isset($_GET['source'])) {
                            $source = $_GET['source'];
                        } else {
                            $source = '';
                        }

                        switch($source) {
                            case 'add_post';
                                include "includes/add_post.php"; 
                            break;
                            
                            case 'edit_post';
                                include "includes/edit_post.php"; 
                            break;

                            case "user_posts";
                            include "includes/view_all_user_specific_posts.php";
                            break;
                            
                            case "new_posts";
                            include "includes/new_posts.php";
                            break;

                            default:
                                include "includes/view_all_posts.php"; 
                        }
                        
                        ?>
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
