<?php

//
// phpCAS simple client
//

// import phpCAS lib
include_once('CAS.php');

// initialize phpCAS
phpCAS::client(CAS_VERSION_2_0,'login.kth.se',443,'');

// Unless you properly set upp SSL-verification
phpCAS::setNoCasServerValidation();

// If you want the redirect back from the login server to enter your application by some 
// specfic URL rather than just back to the current request URI, call setFixedCallbackURL.
// phpCAS::setFixedCallbackURL('http://myserver/my_entry_point.php');
// force CAS authentication
phpCAS::forceAuthentication();
// at this step, the user has been authenticated by the CAS server
// and the user's login name can be read with phpCAS::getUser().

// logout if desired
if (isset($_REQUEST['logout'])) {
 phpCAS::logout();
}



// for this test, simply print that the authentication was successfull
?>




<script>
function myFunction()
{
  $( "#form" ).submit();
}
</script>


<html>
<head>
 <title>Cas Login</title>
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
</head>
<body onload="myFunction()">
<!--<h1>Successfull Authentication!</h1>
 <h1>Blivande startsida</h1>
 <p>the user's login is <b><?php echo phpCAS::getUser(); ?></b>.</p>
 <p>phpCAS version is <b><?php echo phpCAS::getVersion(); ?></b>.</p> -->

<form id="form" action="http://localhost:1234/intprog_project/LoginController" method="POST">
<input type="hidden" name="username" size="20" value="<?php echo phpCAS::getUser(); ?>" />
</form>



 <!--<p><a href="?logout=">Logout</a></p> -->
</body>
</html>