<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Set the character encoding for the document -->
    <meta charset="UTF-8">
    <!-- Define the viewport settings for responsive design -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Set the title of the HTML page -->
    <title>Registration Form</title>
    <!-- Link to an external stylesheet -->
    <link rel="stylesheet" href="./index_styles.css"/>

    <!-- JavaScript function for form validation -->
    <script>
        function validator(){
            // Retrieve the value of the 'age' input field
            var age = document.getElementById("age").value;

            // Check if the age is less than or equal to zero
            if(age <= 0){
                // Display an alert for invalid age
                alert("Not a valid AGE!!");
                // Prevent form submission
                return false;
            }

            // Submit the form if the age is valid
            document.getElementById("regform").submit();
            return true;
        }
    </script>

</head>
<body>
    <!-- User Registration Form -->
    <form id="regform" action="RegisterServlet" method="post" onsubmit="return validator()">
        <h1>User Registration Form</h1>

        <!-- Input field for name -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <!-- Dropdown for gender selection -->
        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="M">Male</option>
            <option value="F">Female</option>
        </select>

        <!-- Input field for age -->
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required>

        <!-- Textarea for address -->
        <label for="address">Address:</label>
        <textarea rows="6" id="address" name="address" required></textarea>

        <!-- Input field for city -->
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>
        
        <!-- Center-aligned button for form submission -->
        <center><button type="submit">Register</button></center>
    </form>

</body>
</html>
