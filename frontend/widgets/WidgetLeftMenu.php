<?php
namespace frontend\widgets;


class WidgetLeftMenu extends \yii\bootstrap\Widget {

    public $menu = [];

    public function init(){
        parent::init();
    }

    public function run(){
        return $this->render('widgetLeftMenu', [
            'menu' => $this->menu
        ]);
    }
}