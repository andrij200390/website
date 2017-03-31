<?php
namespace frontend\components;

use Yii;
use yii\web\Controller;
use app\models\User;

class ParentController extends Controller
{
    public function init()
    {
        parent::init();

        /* Запись времени последнего посещения в БД при триггере любого контроллера */
        if (Yii::$app->user->id) {
            $userOnline = User::findOne(Yii::$app->user->id);
            $userOnline->lastvisit = time();
            $userOnline->save();
        }
    }
}
