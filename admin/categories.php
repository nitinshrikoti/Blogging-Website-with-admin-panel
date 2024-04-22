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
                            Welcome to Admin
                            <small><?php echo $_SESSION['username']; ?></small>
                        </h1>

                        <div class="col-xs-6">
                            <!-- insert data -->
                            <?php insert_categoires(); ?>
                            
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="cat-title">Add Category</label>
                                    <input type="text" class="form-control" name="cat_title" id="">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" name="submit" id="" value="Add Category">
                                </div>
                            </form>
                            
                            <!-- update and include query -->
                            <?php 
                            if(isset($_GET['edit'])) {
                                $cat_id = $_GET['edit'];
                                include "includes/update_categories.php";
                            }
                            ?> 

                        </div>

                        <div class="col-xs-6">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Category Title</th>
                                        <?php if(is_admin()): ?>
                                            <th>Delete</th>
                                            <th>Edit</th>
                                        <?php endif; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Find all categories -->
                                    <?php findAllCategories(); ?>
                                    
                                    
                                    <!-- Delete query -->
                                    <?php delete_categories() ?>
                                </tbody>
                            </table>
                        </div>
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
