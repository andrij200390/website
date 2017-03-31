<?php

namespace frontend\controllers;

use yii\filters\AccessControl;
use frontend\components\ParentController;

class PageController extends ParentController
{
    public $layout = 'portal';
    public $page_layout = [
      '_singlepage',
    ];

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['about'],
                        'allow' => true,
                    ],
                ],
            ],
        ];
    }

    /**
     * About page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('index', [
            'layout' => $this->page_layout[0],
        ]);
    }
}
