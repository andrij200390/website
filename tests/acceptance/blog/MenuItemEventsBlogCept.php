<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->click('Афиша');
$I->wait(3);
$I->see('Афиша событий');
$I->seeElement ('#outstyle_events');
$I->wantTo('B3 проверка вывода афиш в #outstyle_events');
