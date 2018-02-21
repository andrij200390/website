<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/school');
$I->wait(1);
$I->click('#select2-geolocation_country-container');
$I->wait(2);
$I->clickWithLeftButton('.select2-results',1,50);
$I->wait(2);
$I->click('#select2-geolocation_city-container');
$I->wait(2);
$I->clickWithLeftButton('.select2-results',1,30);
$I->wait(2);
$I->see('Dj школа в Минске №1');
$I->wantTo('B17 Проверка поиска школ');