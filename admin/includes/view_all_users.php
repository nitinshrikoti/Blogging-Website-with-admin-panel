<table class="table table-bordered table-hover">
    <thread>
        <tr>
            <td>Id</td>
            <td>Username</td>
            <td>Firstname</td>
            <td>Lastname</td>
            <td>Email</td>
            <td>Role</td>
            <td>Admin</td>
            <td>Subscriber</td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
    </thread>
    <tbody>
    <?php
    $query = "SELECT * FROM users";
    $select_users = mysqli_query($connection, $query);
    while($row = mysqli_fetch_assoc($select_users)) {
        $user_id        = $row['user_id'];
        $username       = $row['username'];
        $user_password  = $row['user_password'];
        $user_firstname = $row['user_firstname'];
        $user_lastname  = $row['user_lastname'];
        $user_email     = $row['user_email'];
        $user_image     = $row['user_image'];
        $user_role      = $row['user_role'];
        echo "<tr>";
            echo "<td> $user_id </td>";
            echo "<td> $username </td>";
            echo "<td> $user_firstname </td>";
            echo "<td> $user_lastname </td>";
            echo "<td> $user_email </td>";
            echo "<td> $user_role </td>";
            echo "<td> <a href='users.php?change_to_admin={$user_id}'>Admin</a> </td>";
            echo "<td> <a href='users.php?change_to_sub={$user_id}'>Subscriber</a> </td>"; 
            echo "<td> <a href='users.php?source=edit_user&edit_user={$user_id}'>Edit</a> </td>"; 
            echo "<td> <a href='users.php?delete={$user_id}'>Delete</a> </td>"; 
            echo "</tr>";
    }
    ?>
    <?php
    // 
    if(isset($_GET['change_to_admin'])) {
        $the_user_id = $_GET['change_to_admin'];
        $query = "UPDATE users SET user_role = 'admin' WHERE user_id = $the_user_id";
        $change_admin_query = mysqli_query($connection, $query);
        // Relodes the page
        header("Location: users.php");
    }

    // Unpprove User
    if(isset($_GET['change_to_sub'])) {
        $the_user_id = $_GET['change_to_sub'];
        $query = "UPDATE users SET user_role = 'subscriber' WHERE user_id = $the_user_id";
        $change_subscriber_query = mysqli_query($connection, $query);
        // Relodes the page
        header("Location: users.php");
    }

    // Delete User
    if(isset($_GET['delete'])) {
        if(isset($_SESSION['user_role'])) {
            if($_SESSION['user_role'] == 'admin') {
                $the_user_id = mysqli_escape_string($connection, $_GET['delete']);
                $query = "DELETE FROM users WHERE user_id = {$the_user_id} ";
                $delete_user_query = mysqli_query($connection, $query);
                // Relodes the page
                header("Location: users.php");
            }
        }
    }
    ?>
    </tbody>
</table>