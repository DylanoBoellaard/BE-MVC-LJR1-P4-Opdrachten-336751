<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../../public/css/instructeurGlobal.css">
    <link rel="stylesheet" href="../../../public/css/instructeurHome.css">
</head>
<body>
    <main>
        <h3><?= $data['title'] ?></h3>

        <table>
            <thead>
                <th>Naam</th>
                <th>Mobiel</th>
                <th>Pakketnaam</th>
                <th>Aantal Lessen</th>
                <th>Prijs</th>
                <th>Startdatum</th>
                <th>Datum rijbewijs behaald</th>
            </thead>
            <tbody>
                <?= var_dump($data['tableRows']); ?>
            </tbody>
        </table>

        <a href="<?= URLROOT ?>/home/index">Terug naar homepage</a>
    </main>
</body>
</html>