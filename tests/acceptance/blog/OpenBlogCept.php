<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->seeElement ('#outstyle_news');
$I->see('Test new','#outstyle_news');
$I->wantTo('B1 Проверка вывода новостей в #outstyle_news');