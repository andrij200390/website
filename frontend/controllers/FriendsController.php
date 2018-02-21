<?php

namespace frontend\controllers;

use Yii;
use yii\helpers\Url;
use yii\web\Controller;
use yii\data\Pagination;
use yii\web\UploadedFile;
use common\CImageHandler;
use yii\web\HttpException;
use yii\filters\AccessControl;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;

use app\models\Friend;
use app\models\FriendRequests;
use app\models\UserDescription;

use frontend\components\ParentController;

class FriendsController extends ParentController  {

    public $layout='main-new';
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

    public function actionIndex()
    {
        //////заявки в друзья
        $model = Friend::find()
                            ->where(
                                "((user1 = :user AND status = :status) OR (user2 = :user AND status = :status))", 
                                [':user' => Yii::$app->user->id, ':status' => 1])
                            ->one();

        $modelRequest = self::getRequest();
        $countRequest = count($modelRequest);
        $userRequest = array();

        for($i=0; $i<$countRequest; $i++){
            $userRequest[$i]['id'] = $modelRequest[$i]->id;
            $userRequest[$i]['name'] = $modelRequest[$i]->nickname;
            $userRequest[$i]['city'] = ($modelRequest[$i]->city === null) ? "" : $modelRequest[$i]->getCity()->one()->name;
            $userRequest[$i]['onlineInd'] = self::getIndicator($modelRequest[$i]->user->lastvisit);
        }

        return $this->render('index', [
            'userRequest' => $userRequest,
            'countRequest' => $countRequest,
            'model' => $model
         ]);
    }

    public function actionView($id)
    {
        //////заявки в друзья
        $name = UserDescription::findOne(['id' => $id])->name;

        return $this->render('view', [
            'id' => $id,
            'name' => $name,          
        ]);
    }

    public function actionList()
    {
        $data = Yii::$app->request->get();
  
        $where = array();

        $search = $data['search'];
        $sort = $data['sort'];

        if ($data['country'] != 0){
            $where['country'] = $data['country'];
        }

        if ($data['city'] != '0'){
            $where['city'] = $data['city'];
        }

        $age_start = ($data['age_start'] != "") ?  date('Y-m-d', time()-(int)$data['age_start']*31536000) : "";
        $age_end = ($data['age_end'] != "") ? date('Y-m-d', time()-(int)$data['age_end']*31536000) : "";

        if($age_start == "" && $age_end != ""){
            $age_start = date('Y-m-d', time());
        }
        
        $sex = "NULL";
        if($data['female'] != "false" && $data['male'] != "false"){
            $sex = "both";
        }else{
            if($data['female'] != "false"){
                $sex = "female";
            }
            if ($data['male'] != "false"){
                $sex = "male";
            }
        }
                
        if ($data['culture'] != "0"){
            $where['culture'] = $data['culture'];
        }

        $page = $data['page'];
        $user = (!empty($data['user'])) ? $data['user'] : Yii::$app->user->id;
        $friends = self::getFriends($sort, $where, $sex, $age_start, $age_end, $search, $page, $user);
        $countFriends = count($friends);
        $myFriends = array();
        if(!empty($friends)){
            for($i=0; $i<$countFriends; $i++){
                $myFriends[$i]['id'] = $friends[$i]->id;
                $myFriends[$i]['name'] = $friends[$i]->nickname;
                $myFriends[$i]['city'] = ($friends[$i]->city === null) ? "" : $friends[$i]->getCity()->one()->name;
                $myFriends[$i]['onlineInd'] = self::getIndicator($friends[$i]->user->lastvisit);
                $myFriends[$i]['isFriend'] = Friend::checkOnFriend($friends[$i]->id);
            }
        }
//var_dump(count($myFriends));die();
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'myFriends' => $myFriends,
            ];
    }

    public static function getFriends($sort, $where, $sex, $age_start, $age_end, $search, $page = 1, $user)
    {
        $query = UserDescription::find()
                ->with(['user'])
                ->join(
                    'INNER JOIN', 
                    '{{%friend}}', 
                    '(({{%user_description}}.`id` = {{%friend}}.`user1` AND {{%friend}}.`user2` = :user AND {{%friend}}.`status` = :status) 
                        OR ({{%user_description}}.`id` = {{%friend}}.`user2` AND {{%friend}}.`user1` = :user AND {{%friend}}.`status` = :status))
                    AND IF(:age_start != "" OR :age_end != "",({{%user_description}}.`birthday` < :age_start AND {{%user_description}}.`birthday` > :age_end), 1=1)
                    AND IF(:sex = "both", {{%user_description}}.`sex`="male" OR {{%user_description}}.`sex`="female", IF (:sex = "NULL", 1=1, {{%user_description}}.`sex`= :sex))'
//                    AND IF(:search != "", MATCH (name, last_name, nickname) AGAINST (:search IN BOOLEAN MODE), 1=1)'
                    ,[
                        ':user' => $user,
                        ':age_start' => $age_start,
                        ':age_end' => $age_end,
//                        ':search' => $search,
                        ':status' => 1,
                        ':sex' => $sex
                    ])
                ->where($where);
        
        if ( $search ) {
            $query->andWhere(['like', "CONCAT(`name`, `last_name`, `nickname`)", $search]);
        }

        $pagination = new Pagination([
                    'defaultPageSize' => 20,
                    'totalCount' => $query->count(),
                    'page' => $page-1,
                ]);

        return $query->orderBy([$sort => SORT_DESC])
                     ->offset($pagination->offset)
                     ->limit($pagination->limit)
                     ->all();
    }

 
    public static function getRequest()
    {
        return UserDescription::find()
                ->with(['user'])
                ->join(
                    'JOIN', 
                    '{{%friend}}', 
                    '({{%user_description}}.`id` = {{%friend}}.`user1` 
                        AND {{%friend}}.`user2` = :user
                        AND {{%friend}}.`status` = :status)',
                    [
                        ':user' => Yii::$app->user->id,
                        ':status' => 0,
                    ])
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
    
//////прием заявки
    public function actionAccept() 
    { 
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $id = $data['idUserRequest'];
            $model = Friend::find()
                                ->where(
                                    "user1 = :id AND user2 = :user AND status = :status", 
                                    [':id' => $id, ':user' => Yii::$app->user->id, ':status' => 0])
                                ->one();
            $model->status = 1;
            if($model->validate()){
                $model->save();
            } 
            $ok = 1;
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'ok' => $ok,
            ];
    }

/////отклонение заявки
    public function actionRefuse() 
    { 
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $id = $data['idUserRefuse'];
            $model = Friend::find()
                                ->where(
                                    "user1 = :id AND user2 = :user AND status = :status", 
                                    [':id' => $id, ':user' => Yii::$app->user->id, ':status' => 0])
                                ->one();
            $model->delete();
            $ok = 1;
        }

        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'ok' => $ok,
            ];
    }
/////удаление из друзей
    public function actionDel() 
    { 
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $id = $data['idDel'];
            $model = Friend::find()
                                ->where(
                                    "(user1 = :id AND user2 = :user AND status = :status)
                                        OR (user1 = :user AND user2 = :id AND status = :status)", 
                                    [':id' => $id, ':user' => Yii::$app->user->id, ':status' => 1])
                                ->one();
            $model->delete();
            $ok = 1;
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'ok' => $ok,
            ];
    }

/////отправка заявки в друзья
    public function actionRequest() 
    { 
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $id = $data['idAdd'];
            $checkRequest = Friend::find()
                                ->where(
                                    "(user1 = :id AND user2 = :user)
                                    OR (user1 = :user AND user2 = :id)", 
                                    [':id' => $id, ':user' => Yii::$app->user->id])
                                ->one();

            if (empty($checkRequest)) {
                $model = new Friend();
                $model->user1 = Yii::$app->user->id;
                $model->user2 = $id;
                $model->status = 0;
                if($model->validate()){
                    $model->save();
                } 
                $ok = 1;
            }
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'ok' => $ok,
            ];
    }
}