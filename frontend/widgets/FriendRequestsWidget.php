<?php

namespace frontend\widgets;

use app\models\FriendRequests;
use app\models\User;

class FriendRequestsWidget extends \yii\bootstrap\Widget {

    public $user = null;
    public $idDOM = null;

    public function init(){
        parent::init();
    }

    public function run(){
        $model = new FriendRequests();
        return $this->render('friendRequestsWidget', [
            'model' => $model,
            'user' => $this->user,
            'idDOM' => $this->idDOM,
        ]);
    }
}