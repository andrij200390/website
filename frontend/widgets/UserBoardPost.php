<?php

namespace frontend\widgets;

use Yii;
use yii\base\Widget;

/**
 * Handles User -> Board -> Post block, showing posts of user
 * Part of Outstyle network
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @version 1.0
 *
 * @link https://github.com/Outstyle/website
 * @license Beerware
 */
class UserBoardPost extends Widget
{

    /**
     * User board posts array
     * @var array
     */
    public $posts = [];

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
        # If user has no friends
        if (!$this->posts) {
            return;
        }

        return $this->render('userBoardPost', [
          'posts' => $this->posts,
        ]);
    }
}
