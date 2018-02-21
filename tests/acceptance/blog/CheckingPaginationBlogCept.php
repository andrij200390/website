<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->scrollTo('#outstyle_news',0,1500);
$I->wait(2);
$I->wantTo('B6 Проверка пагинации');

