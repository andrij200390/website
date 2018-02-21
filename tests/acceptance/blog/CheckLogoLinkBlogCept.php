<?php 
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/article');
$I->wait(2);
$I->click('#logo');
$I->wait(2);
$I->see('Test news');
$I->wantTo('B11 Проверка лого-ссылки на главную');
