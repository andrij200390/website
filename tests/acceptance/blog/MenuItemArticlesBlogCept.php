<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->click('Статьи');
$I->wait(3);
$I->see('Что такое "foundation" по-настоящему? - Kujo');
$I->seeElement ('#outstyle_articles');
$I->see('Что такое "foundation" по-настоящему? - Kujo','#outstyle_articles');
$I->wantTo('B2 проверка вывода постов в #outstyle_articles');
