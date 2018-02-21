<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(2);
$I->scrollTo('#outstyle_news',0,1500);
$I->wait(2);
$I->seeElement('#scrollup');
$I->waitForElementVisible('#scrollup','2');
$I->click('#scrollup');
$I->dontSeeElement('#scrollup');
$I->wantTo('B7 Проверка кнопки вверх');
