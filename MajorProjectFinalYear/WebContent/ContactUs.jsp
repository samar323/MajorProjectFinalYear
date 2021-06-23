<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/contactus.css">
</head>
<body>
<jsp:include page="NavBar.jsp" />
<section class="contact">
        <div class="content">
            <h2>Contact Us</h2>
            <p>For Any query You can reach us , we will revert you back and will definitely solve your issues.<br>----Thank you----</p>
        </div>
        <div class="container">
            <div class="contactinfo">
                <div class="box">
                    <div class="icon"><i class="fa fa-map-marker"></i></div>
                    <div class="text">
                        <h3>Address</h3>
                        <p>Yamuna Expressway, Gautam Budh Nagar,<br> Greater Noida, Uttar Pradesh 201308, India</p>
                    </div>
                </div>
                <div class="box">
                    <div class="icon">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                    </div>
                    <div class="text">
                        <h3>Phone</h3>
                        <p>0120-234 4200</p>
                    </div>
                </div>
                <div class="box">
                    <div class="icon">
                        <i class="far fa-envelope" aria-hidden="true"></i>
                    </div>
                    <div class="text">
                        <h3>Email</h3>
                        <p>info@gbu.ac.in</p>
                    </div>
                </div>
            </div>
            <div class="contactform">
                <form>
                    <h2>Send Message</h2>
                    <div class="inputbox">
                        <input type="text" name="" required="required">
                        <span>Full Name</span>
                    </div>
                    <div class="inputbox">
                        <input type="text" name="" required="required">
                        <span>Email</span>
                    </div>
                    <div class="inputbox">
                        <textarea required="required"></textarea>
                        <span>Type Your Message...</span>
                    </div>
                    <div class="inputbox">
                        <input type="submit" name="" value="Send">
                    </div>
                </form>
            </div>

        </div>
    </section>
    <jsp:include page="Footer.jsp" /> 
</body>
</html>