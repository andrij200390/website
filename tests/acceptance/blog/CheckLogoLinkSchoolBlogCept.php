<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/school');
$I->wait(2);
$I->click('#logo');
$I->wait(2);
$I->see('Test news');
$I->wantTo('B13 Проверка лого-ссылки на главную из страницы школ');
