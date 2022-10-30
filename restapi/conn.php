<?php

$connect = new mysqli("localhost","root","123","my_store");

if($connect){

}else{
	echo "Connection Failed";
	exit();
}
?>