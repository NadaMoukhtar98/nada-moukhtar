<?php

namespace App\Database\Config;

class Connection
{
    private $host = "localhost";
    private $UserName = "root";
    private $Password = "";
    private $database = "myecommerce";
    public \mysqli $conn;
    public function __construct()
    {
        $this->conn = new \mysqli($this->host, $this->UserName, $this->Password, $this->database);
    }

    public function __destruct()
    {
        $this->conn->close();
    }
}
