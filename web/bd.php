<?php

$db = mysqli_connect("localhost","root","","digital");

if ($db == false)
{
    echo "Ошибка подключения";
}

$sql = mysqli_query($db, 'SELECT `ObjectName`, `Result`, `SnapshotTime` FROM `table1` WHERE `ObjectName`= "Разъединитель" ORDER BY `SnapshotTime` DESC ');





/*while ($result = mysqli_fetch_array ($sql))
{
    echo "{$result['ObjectName']} : {$result['Result']}";
    echo "<br>";
}*/

$result = mysqli_fetch_array ($sql);
print_r($result);

//Для температуры
If ($result['Result'] > 90) {
    echo "<p style='color: red'>" . $result['ObjectName'] . " : " . $result['Result'] . "</p>";
} else {
    echo "<p>" . $result['ObjectName'] . " : " . $result['Result'] . "</p>";
}







        ?>