<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->appendField('#email','sc@sc.sc');
$I->appendField('#password', '666666');
$I->click('#login-form__submit');
$I->wait(3);
$I->amOnUrl('http://outstyle.loc/id14');
$I->see('Outstyle Team');
$I->wait(3);
$I->wantTo('SN1 проверка успешной авторизации');
