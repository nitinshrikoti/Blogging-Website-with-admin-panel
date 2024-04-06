<?php

// Checking for submit and updatating the values in the database
if(isset($_POST['create_post'])) {
    $post_title         = $_POST['title'];
    $post_user          = $_POST['post_user'];
    $post_category_id   = $_POST['post_category'];
    $post_status        = $_POST['post_status'];
    $post_image         = $_FILES['image']['name'];
    $post_image_temp    = $_FILES['image']['tmp_name'];
    $post_tags          = $_POST['post_tags'];
    $post_content       = $_POST['post_content'];
    $post_date          = date('d-m-y');
    // $post_comment_count = 4;

    move_uploaded_file($post_image_temp, "../images/$post_image");

    $query = "INSERT INTO posts(post_category_id, post_title, post_user, post_date, post_image, post_content, post_tags, post_status) ";
    $query .= "VALUES({$post_category_id}, ";
    $query .= "'{$post_title}', ";
    $query .= "'{$post_user}', ";
    $query .= "now(), ";
    $query .= "'{$post_image}', ";
    $query .= "'{$post_content}', ";
    $query .= "'{$post_tags}', ";
    $query .= "'{$post_status}' ) ";
    $create_post_query = mysqli_query($connection, $query);
    confirmQuery($create_post_query);

    // Getting last id which was created
    $the_post_id = mysqli_insert_id($connection);

    echo "<p class='bg-success'>Post Created. <a href='../post.php?p_id={$the_post_id}'> View Post </a> OR <a href='posts.php?source=edit_post&p_id={$the_post_id}'>Edit Post</a></p>";
}

?>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">Post Title</label>
        <input type="text" name="title" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="">Category</label>
        <select name="post_category" id="">
            <?php
            $query = "SELECT * FROM categories ";
            $select_categories = mysqli_query($connection, $query);

            confirmQuery($select_categories);

            while($row = mysqli_fetch_assoc($select_categories)) {
                $cat_id = $row['cat_id'];
                $cat_title = $row['cat_title'];
                echo "<option value='{$cat_id}'>{$cat_title}</option>";
            }
            ?>
        </select>
    </div>
    <div class="form-group">
        <label for="post_status">Post Status</label>
        <select name="post_status" id="">
            <option value="draft">Select Status</option>
            <option value="draft">Draft</option>
            <option value="published">Publish</option>
        </select>
    </div>
    <!-- <div class="form-group">
        <label for="title">Post Author</label>
        <input type="text" name="author" id="" class="form-control">
    </div> -->
    <div class="form-group">
        <label for="">Users</label>
        <select name="post_user" id="">
            <?php
            $query = "SELECT * FROM users ";
            $select_users = mysqli_query($connection, $query);

            confirmQuery($select_users);

            while($row = mysqli_fetch_assoc($select_users)) {
                $user_id = $row['user_id'];
                $username = $row['username'];
                echo "<option value='{$username}'>{$username}</option>";
            }
            ?>
        </select>
    </div>
    
    <div class="form-group">
        <label for="post_image">Post Image</label>
        <input type="file" name="image" id="" class="form-control">
    </div>
    <div class="form-group">
        <label for="post_tags">Post Tags</label>
        <input type="text" name="post_tags" id="" class="form-control">
    </div>
    
    <div class="form-group">
        <label for="post_content">Post Content</label>
        <textarea name="post_content" id="summernote" class="form-control" cols="30" rows="10"></textarea>
    </div>
    <div class="form-group">
        <input type="submit" value="Publish Post" name="create_post" class="btn btn-primary">
    </div>
    

</form>