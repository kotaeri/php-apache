<?php
  $user = 'root';
  $password = getenv('MYSQL_ROOT_PASSWORD');
  $dbName = 'chapter6_db';
  $dbServer = getenv('DB_SERVER');
  $host = "{$dbServer}:8889";
  $dsn = "mysql:host={$host};dbname={$dbName};charset=utf8";
?>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>レコード一覧</title>
</head>
<body>
  <?php
    echo "USER: ", $user, "<p>";
    echo "PASSWORD: ", $password, "<p>";
    echo "DBSERVER: ", $dbServer, "<p>";
    echo "HOST:", $host, "<p>";
  ?>
</body>
</html>

