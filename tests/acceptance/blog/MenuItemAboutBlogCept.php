<?php
$I = new AcceptanceTester($scenario);
$I->amOnUrl('http://outstyle.loc/');
$I->wait(1);
$I->click('О нас');
$I->wait(3);
$I->seeElement ('#outstyle_page');
$I->see('OutStyle — это портал и социальная сеть для удобного
общения между представителями хип-хоп сообщества.','#outstyle_page');
$I->wantTo('B5 проверка вывода школ в #outstyle_school');
