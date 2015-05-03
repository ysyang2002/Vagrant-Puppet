<?php

$IP = $_SERVER['REMOTE_ADDR'];
$UA = $_SERVER['HTTP_USER_AGENT'];
echo "Hello World!<br>\n";
echo "You are from $IP<br>\nYou are using $UA<br>\n";
