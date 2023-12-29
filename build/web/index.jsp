<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="./index_styles.css"/>
    
    <script>
        function validator(){
            var age = document.getElementById("age").value;
            
            if(age<=0){
                alert("Not a valid AGE!!");
                return false;
            }
            
            document.getElementById("regform").submit();
            return true;
        }
    </script>
    
</head>
<body>
    <form id="regform" action="RegisterServlet" method="post" onsubmit="return validator()">
    <h1>User Registration Form</h1>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
        <option value="M">Male</option>
        <option value="F">Female</option>
    </select>

    <label for="age">Age:</label>
    <input type="number" id="age" name="age" required>

    <label for="address">Address:</label>
    <textarea rows="6" id="address" name="address" required></textarea>

    <label for="city">City:</label>
    <input type="text" id="city" name="city" required>
    
    <center><button type="submit">Register</button></center>
</form>

</body>
</html>
