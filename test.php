<?php

echo "Tests";
echo "\n";

testExt("gd");
testExt("mbstring");
testExt("mcrypt");
testExt("pdo_mysql");
testExt("pdo_pgsql");
testExt("curl");
testExt("json");
testExt("xml");

test(function(){
    try {
        $dbh = new PDO("mysql:host=localhost;dbname=mysql", "root", "root");
    }
    catch(\Exception $e)
    {
        echo $e->getMessage();
        return false;
    }

    return true;
}, "Mysql Connection");

// test(function(){
//     try {
//         $dbh = new PDO("pgsql:host=localhost;dbname=mysql", "root", "root");
//     }
//     catch(\Exception $e)
//     {
//         echo $e->getMessage();
//         return false;
//     }

//     return true;
// }, "postgres Connection");



// Functions
//////////////////////////////////

function test($callback, $txt) 
{ 
    if($callback()) {
        ok($txt);
        return true;
    } 
    ko($txt);
    return false;
}

function testExt ($ext) {
    if (!extension_loaded($ext)) {
        ko("Ext " . $ext . " not loaded") ;
        return false;
    }

    ok("Ext " . $ext . " loaded");
}

function ok ($m) {
    echo "OK (" . $m . ")" ;
    echo "\n";
}


function ko ($m) {
    echo "ERROR (" . $m . ")" ;
    echo "\n";
}