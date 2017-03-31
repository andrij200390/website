<?php
namespace frontend\widgets;

use Yii;
use yii\helpers\Url;


class WidgetProfileUserMenu extends \yii\bootstrap\Widget {

    public $menu = [];

    public function init(){
        parent::init();
        $this->menu = [
            Yii::t('app', 'Основная информация') => Url::toRoute('user/profile'),
            Yii::t('app', 'Аватар') => Url::toRoute('user/avatar'),
            Yii::t('app', 'Настройки приватности') => Url::toRoute('user/privacy'),
            Yii::t('app', 'Смена учетных данных') => Url::toRoute('user/change'),
        ];
    }

    public function run(){
        return $this->render('widgetProfileUserMenu', [
            'menu' => $this->menu
        ]);
    }
}