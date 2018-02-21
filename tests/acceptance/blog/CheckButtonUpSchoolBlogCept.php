<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/school');
$I->wait(2);
$I->scrollTo('#outstyle_school',0,1500);
$I->wait(2);
$I->seeElement('#scrollup');
$I->waitForElementVisible('#scrollup','2');
$I->click('#scrollup');
$I->dontSeeElement('#scrollup');
$I->wantTo('B8 Проверка кнопки вверх для страницы школ');
