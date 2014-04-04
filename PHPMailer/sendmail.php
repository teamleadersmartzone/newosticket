<form action="" method="post">
    <table>
    <tr>
        <td><input type="email" placeholder="Email" name="email" /></td>
    </tr>
    <tr>
        <td><input type="submit" name="send" value="Send via SMTP" /></td>
    </tr>
    </table>
</form>

<?php
/*error_reporting(0);
define("SMTP_HOST", "smtp.gmail.com"); //Hostname of the mail server
define("SMTP_PORT", "465"); //Port of the SMTP like to be 25, 80, 465 or 587
define("SMTP_UNAME", "engineer.pankaj.kashyap@gmail.com"); //Username for SMTP authentication any valid email created in your domain
define("SMTP_PWORD", "p@nkaj1390"); */
include "class.phpmailer.php"; // include the class file name
/*require_once('../class.phpmailer.php');*/

include"class.smtp.php"; // optional, gets called from within class.phpmailer.php if not already loaded


$mail             = new PHPMailer();

 

$body             = 'this is body part';

//$body             = eregi_replace("[\]",'',$body);

 

$mail->IsSMTP(); // telling the class to use SMTP



$mail->Host       = 'smtp.gmail.com'; // SMTP server

$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)

// 1 = errors and messages

// 2 = messages only

$mail->SMTPAuth   = true;                  // enable SMTP authentication

$mail->Host       = 'smtp.gmail.com'; // sets the SMTP server

$mail->Port       = 26;         



  $host = "ssl://smtp.gmail.com";
    $port = "26";
    $checkconn = fsockopen($host, $port);
    if(!$checkconn){
        echo "($errno) $errstr";
    } else {
        echo 'ok';
    }
 













           // set the SMTP port for the GMAIL server

$mail->Username   = "engineer.pankaj.kashyap@gmail.com"; // SMTP account username

$mail->Password   = "p@nkaj1390";        // SMTP account password


$mail->SetFrom('engineer.pankaj.kashyap@gmail.com', 'pankaj kashyap');

 

$mail->AddReplyTo("engineer.pankaj.kashyap@gmail.com","pankaj kashyap");

 

$mail->Subject    = "PHPMailer Test Subject via smtp, basic with authentication";

 

$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

 

$mail->MsgHTML($body);

 

$address = "pankaj.kumar.dimple@gmail.com";

$mail->AddAddress($address, "pankaj kashyap");


$mail->AddAttachment("images/shop_landing_page.jpg");      // attachment



 

if(!$mail->Send()) {

echo "Mailer Error: " . $mail->ErrorInfo;

} else {

echo "Message sent!";

}