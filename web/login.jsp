

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css">
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    </head>
    <body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">    
                            <form action="MainController" method="POST" class="signin-form" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <input type="text" name="userID" required="" placeholder="Username" style="width: 350px;"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" required="" placeholder="Password" style="width: 350px;"/>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LenYD8eAAAAACenM6wa8CmMAAJQ_Kcytd3arNQZ"></div><br/>
                                <div class="g-signin2" data-onsuccess="onSignIn"></div><br/> 
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3" name="action" value="Login">Sign In</button>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3" type="reset" value="Reset">Reset</button>\
                                </div>
                            </form>
                            <script type="text/javascript" >
                                function validateForm() {
                                    if (grecaptcha.getResponse()) {
                                        return true;
                                    } else {
                                        alert("Please prove that you're not a robot!!!");
                                        return false;
                                    }
                                }
                            </script>
                            <%
                                String error = (String) request.getAttribute("ERROR");
                                if (error == null) {
                                    error = "";
                                }
                            %>
                            <%= error%>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>


