<?php

use yii\helpers\Html;
use yii\helpers\Url;

use frontend\widgets\UserProfileBlock;
use frontend\widgets\UserVideosBlock;
use common\components\helpers\ElementsHelper;

/* @var $this yii\web\View */
/* @var $user @frontend/user/UsersController */

$this->title = Yii::t('app', 'My page');
$this->registerMetaTag(['name' => 'description', 'content' => $this->title]);


/* --- Left block section --- */
echo Html::beginTag('section', ['id' => 'leftBlock']);

    # Profile
    echo UserProfileBlock::widget([
      'user' => $user
    ]);

    echo ElementsHelper::separatorWidget(2,'bottomborder');

    # Videos
    echo UserVideosBlock::widget([
      'videos' => $user->video
    ]);

echo Html::endTag('section');


/* --- Right block section --- */
echo Html::beginTag('section', ['id' => 'rightBlock']);

    # content
    echo '123';

echo Html::endTag('section');

?>
