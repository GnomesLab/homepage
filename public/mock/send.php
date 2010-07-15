<?php
/*** ---------- CHANGE THIS TO YOUR EMAIL ADDRESS ------------- ***/
$MAIL_TO = 'hey@chocotemplates.com';
/*** ---------------------------------------------------------- ***/





$subject = "onfocus :: new message";
$time = date('Y-m-d H:i');

$fname = $_POST['fname-field'];
$lname = $_POST['lname-field'];
$mail = $_POST['mail-field'];
$company = $_POST['company-field'];
$message = $_POST['message-field'];

$body = "Time: $time\n";
$body .= "First Name: $fname\nLast Name: $lname\nEmail: $mail\nCompany: $company\n";
$body .= "Message:\n$message";

@mail($MAIL_TO, $subject, $body);
?>