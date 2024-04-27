<?php include "includes/header.php" ?>

    <!-- Navigation -->
    <?php include "includes/navigation.php"; ?>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
    
            <!-- Blog Entries Column -->
            <div class="col-md-8 bgcolor">

            <?php
            if(isset($_POST['submit'])) {
            $search = $_POST['search'];
            $query = "SELECT * FROM posts WHERE post_tags LIKE '%$search%' ";
            $search_query = mysqli_query($connection, $query);
            if(!$search_query) {
                die("QUERY FAILED" . mysqli_error($connection));
            }
            $count = mysqli_num_rows($search_query);
            if($count == 0) {
                echo "NO Result";
            } else {
               
                while($row = mysqli_fetch_assoc($search_query)) {
                    $post_id        = $row['post_id'];
                    $post_title     = $row['post_title'];
                    $post_author    = $row['post_user'];
                    $post_date      = $row['post_date'];
                    $post_image     = $row['post_image'];
                    $post_content   = substr($row['post_content'],0,100);                
                    $post_status    = $row['post_status'];
                ?>    
                    <!-- First Blog Post -->
                    <!-- <h1><?php echo $count; ?></h1> -->
                    <h2>
                        <a href="post/<?php echo $post_id; ?>"><?php echo $post_title ?></a>
                    </h2>
                    <p class="lead">
                        by <a href="author_posts.php?author=<?php echo $post_author ?>&p_id=<?php echo $post_id; ?>"><?php echo $post_author ?></a>
                    </p>
                    <p><span class="glyphicon glyphicon-time"></span> <?php echo $post_date ?></p>
                    <hr>
                    <a href="post.php?p_id=<?php echo $post_id; ?>">
                        <img class="img-responsive" src="/cms/images/<?php echo $post_image; ?>" alt="">
                    </a>
                    <hr>
                    <p><?php echo $post_content ?></p>
                    <a class="btn btn-primary" href="post.php?p_id=<?php echo $post_id; ?>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                    <hr style="border-top: 2px solid #31363F;">
            <?php
                } // while loop end
            }
        }
        ?>

            

            </div>

            <!-- Blog Sidebar Widgets Column -->
            <?php include "includes/sidebar.php"; ?>
        </div>
        <!-- /.row -->
        <hr>

<?php include "includes/footer.php"; ?>