<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/events');
$I->wait(2);
$I->click('.btn__addnew');
$I->wait(2);
$I->see('Добавить событие');
$I->wantTo('B15 Проверка кнопки добавления постов/школ');

