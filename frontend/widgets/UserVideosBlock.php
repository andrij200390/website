<?php

namespace frontend\widgets;

use Yii;
use yii\base\Widget;

/**
 * Handles User -> Videos block, showing videos of user
 * Part of Outstyle network
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @version 1.0
 *
 * @link https://github.com/Outstyle/website
 * @license Beerware
 */
class UserVideosBlock extends Widget
{

  /**
   * User videos array
   * @var array
   */
    public $videos = [];

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();

    }


    /**
     * @inheritdoc
     */
    public function run()
    {
        return $this->render('userVideosBlock', [
          'videos' => $this,
        ]);
    }
}
