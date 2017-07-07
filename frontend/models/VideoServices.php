<?php

namespace app\models;

use Yii;

class VideoServices extends Video
{
    private $videoServices = [
      1 => 'youtube',
      2 => 'vimeo',
      3 => 'dailymotion',
      4 => 'rutube',
    ];
}
