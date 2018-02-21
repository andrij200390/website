<?php 
$I = new FunctionalTester($scenario);
$id = $I->haveInDatabase( 'z_video', array(
           'user' => '14',
           'service_id' => '1',
           'video_id' => 'LLLLLLLLLLL',
           'video_title' => 'Title',
           'video_desc' => 'Description',
           'video_img' => 'https://i.ytimg.com/vi/LLLLLLLLLLL/mqdefault.jpg',
           'created_at' => '2017-07-05 13:50:26'));

$I->seeInDatabase('z_video', array( 'user' => '14',
    'service_id' => '1',
    'video_id' => 'LLLLLLLLLLL'));

$I->wantTo($id.'Add in db');
