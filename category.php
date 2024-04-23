<?php include "includes/header.php" ?>

    <!-- Navigation -->
    <?php include "includes/navigation.php"; ?>
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <!-- Blog Entries Column -->
            <div class="col-md-8 bgcolor">

                <?php
                if(isset($_GET['category'])) {
                    $post_category_id = $_GET['category'];

                    // Displaying posts based on whether loged in as admin or not
                    if(isset($_SESSION['user_role']) && $_SESSION['user_role'] == 'admin') {
                        $query = "SELECT * from posts WHERE post_category_id=$post_category_id ORDER BY post_id DESC";
                    } else {
                        $query = "SELECT * from posts WHERE post_category_id=$post_category_id AND post_status='published' ORDER BY post_id DESC";
                    }

                    $select_all_posts_query = mysqli_query($connection, $query);
                    if(mysqli_num_rows($select_all_posts_query) < 1) {
                        echo "<h1 class='text-center'>No Posts Available</h1>";
                    } else {
                        while($row = mysqli_fetch_assoc($select_all_posts_query)) {
                            $post_id        = $row['post_id'];
                            $post_title     = $row['post_title'];
                            $post_author    = $row['post_user'];
                            $post_date      = $row['post_date'];
                            $post_image     = $row['post_image'];
                            $post_content   = substr($row['post_content'],0,100);                
                ?>    
                            <!-- First Blog Post -->
                            <h2>
                                <a href="/cms/post/<?php echo $post_id; ?>"><?php echo $post_title ?></a>
                            </h2>
                            <p class="lead">
                                by <?php echo $post_author ?>
                            </p>
                            <p><span class="glyphicon glyphicon-time"></span> <?php echo $post_date ?></p>
                            <hr>
                            <img class="img-responsive" src="/cms/images/<?php echo $post_image; ?>" alt="">
                            <hr>
                            <p><?php echo $post_content ?></p>
                            <a class="btn btn-primary" href="/cms/post/<?php echo $post_id; ?>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
    
                            <hr style="border-top: 2px solid #31363F;">
                <?php } // while loop end
                    } 
                }else {
                    header("Location: index.php");
                } ?>  <!-- if-else end -->

            </div>

            <!-- Blog Sidebar Widgets Column -->
            <?php include "includes/sidebar.php"; ?>
        </div>
        <!-- /.row -->
        <hr>

<?php include "includes/footer.php"; ?>