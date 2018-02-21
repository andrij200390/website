<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/about');
$I->wait(2);
$I->click('#logo');
$I->wait(2);
$I->see('Test news');
$I->wantTo('B14 Проверка лого-ссылки на главную из страницы о нас');
