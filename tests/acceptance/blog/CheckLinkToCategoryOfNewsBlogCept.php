<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I -> clickWithLeftButton ([ 'css' => '#outstyle_news' ], 200 , 20 ); ;
$I->wait(3);
$I->seeCurrentUrlEquals('/news/breaking' );
$I->wantTo('B18 Проверка ссылок на категорию в новостях');
