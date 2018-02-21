<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->click('Школа');
$I->wait(3);
$I->seeElement ('#outstyle_school');
$I->see('Первая Черниговская школа "Breakazoid"','#outstyle_school');
$I->wantTo('B4 проверка вывода школ в #outstyle_school');
