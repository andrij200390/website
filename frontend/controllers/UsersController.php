<?php

namespace frontend\controllers;

use Yii;
use yii\helpers\Url;
use yii\helpers\Json;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\data\Pagination;
use yii\web\UploadedFile;
use common\CImageHandler;
use yii\web\HttpException;
use yii\filters\AccessControl;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;

use app\models\User;
use app\models\Board;
use app\models\Likes;
use app\models\Video;
use common\models\Photo;
use common\models\Photoalbum;
use app\models\UserPrivacy;
use app\models\UserDescription;
use app\models\UserAvatar;
use frontend\components\ParentController;

class UsersController extends ParentController {

		public $layout = 'social';

    /**
     * @inheritdoc
     */

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'allow' => false,
                        'roles' => ['*'],
                    ],
                ],
            ],
        ];
    }

		/**
		 * User profile
		 * @param  int $user 		User ID
		 * @return array
		 */
    public function actionView($userId)
    {
				/* Exceptions */
				if (!is_int($userId) && empty($userId)) {
						throw new HttpException(404, Yii::t('app', 'User not found!'));
				}

        $model = Board::getByUserId($userId);

        if (!$model){
            throw new HttpException(404, Yii::t('app', 'User not found!'));
        }

        return $this->render('index', [
            'user' => $model,
        ]);
    }

    public static function getPhoto($id)
    {
        $modelAlbums = Photoalbum::find()->where(['user'=> $id, 'privacy' => 0])->orderBy("id desc")->all();
        $countmodelAlbums = count($modelAlbums);
        $albumsId = array();
        for($j=0; $j<$countmodelAlbums; $j++){
            if(!UserPrivacy::getPrivacy($modelAlbums[$j]->privacy, $id) && $id != Yii::$app->user->id){
                continue;
            }
            $albumsId[] = $modelAlbums[$j]['id'];
        }
        $model = Photo::find()->where(['album' => $albumsId])->orderBy('id desc')->all();
        $count = count($model);
        $modelPhotos = array();
        $j = 0;
        for($i=0; $i<$count; $i++){
            $file = Yii::getAlias('@frontend/web/images/photo/') . $model[$i]->user . '/' . $model[$i]->album . '/small_' . $model[$i]->img;
            //var_dump($file);//die();
            if( file_exists($file) ){
                $modelPhotos[$j]['idPhoto'] = $model[$i]->id;
                $modelPhotos[$j]['idOwner'] = $model[$i]->user;
                $modelPhotos[$j]['idAlbum'] = $model[$i]->album;
                $modelPhotos[$j]['name'] = $model[$i]->name;
                $modelPhotos[$j]['nameImg'] = $model[$i]->img;
                $j++;
                if ( $j == 4 ) {
                    break;
                }
            }
        }
//        die();
        return $modelPhotos;
    }

    public static function getFriends($owner)
    {
        return UserDescription::find()
            ->with(['user'])
            ->join('JOIN',
                   '{{%friend}}',
                   '({{%user_description}}.`id` = {{%friend}}.`user1` AND {{%friend}}.`user2` = :user AND {{%friend}}.`status` = :status)
                    OR ({{%user_description}}.`id` = {{%friend}}.`user2` AND {{%friend}}.`user1` = :user AND {{%friend}}.`status` = :status)', [
                    ':user' => $owner,
                    ':status' => 1,
            ])
            ->orderBy("id desc")
            ->limit(9)
            ->all();
    }


    public static function getIndicator($lastvisit)
    {
        if( time()-$lastvisit < 900){
            return '1';
        }else{
            return '0';
        }
    }

    public static function getYearsList()
    {
        $yearsEnd = date('Y', time()) - 14;
        $yearsBegin = $yearsEnd - 50;
        $yearsArray = array(0 => '- год -');;
        for ($i = $yearsEnd; $i >= $yearsBegin; $i--) {
            $yearsArray[$i] = $i;
        }
        return $yearsArray;
    }

    public static function getDayList()
    {
        $dayArray = array(0 => '- день -');
        for ($i = 1; $i <= 31; $i++) {
            $dayArray[] = $i;
        }
        return $dayArray;
    }

    public static function getMonthList()
    {
        $monthArray = array(
                0 => '- месяц -',
                1 => 'января',
                2 => 'февраля',
                3 => 'марта',
                4 => 'апреля',
                5 => 'мая',
                6 => 'июня',
                7 => 'июля',
                8 => 'августа',
                9 => 'сентября',
                10 => 'октября',
                11 => 'ноября',
                12 => 'декабря'
            );

        return $monthArray;
    }
}
