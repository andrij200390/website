<?php

namespace frontend\controllers;

use Yii;
use yii\helpers\Url;
use yii\helpers\Json;
use yii\web\Controller;
use yii\data\Pagination;
use yii\web\UploadedFile;
use common\CImageHandler;
use yii\web\HttpException;
use kartik\depdrop\DepDrop;
use yii\filters\AccessControl;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;

use app\models\User;
use app\models\Board;
use app\models\Likes;
use app\models\Video;
use app\models\Photo;
use app\models\Photoalbum;
use app\models\UserPrivacy;
use app\models\UserDescription;
use frontend\models\UserAvatar;

use frontend\components\ParentController;

class UsersController extends ParentController {
	
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

    public function check() {
        die(var_dump($_POST, $_FILES));
    }

    public function actionIndex()
    { 
        
        $model = User::findOne(Yii::$app->user->id);
        
        $newBoard = new Board();
        if($newBoard->load(Yii::$app->request->post())){
            $newBoard->created = date("Y-m-d H:i:s");
            $newBoard->user = Yii::$app->user->id;
            $newBoard->owner = Yii::$app->user->id;
            if($newBoard->photo > 0 || $newBoard->text || $newBoard->notice > 0){
                if($newBoard->validate()){
                    $newBoard->save();
                    return $this->refresh();
                }
            }
        }
        $boards = Board::find()->where("user = :user", [':user' => Yii::$app->user->id])->orderBy("id desc")->all();

        $lastPhotoAlbum = Photoalbum::find()->where("user = :user", [':user' => Yii::$app->user->id])->orderBy('id desc')->one();
        $countPhotoAlbum = Photoalbum::find()->where("user = :user", [':user' => Yii::$app->user->id])->count();
        
    /// вывод видео в левый сайдбар
        $videoModel = Video::find()->where("user = :user", [':user' => Yii::$app->user->id])->orderBy("id desc")->all();
        $countVideo = Video::find()->where("user = :user", [':user' => Yii::$app->user->id])->count();

        $modelVideo = array();
        $countForVideo = ($countVideo > 2) ? 2 : $countVideo;
        
        if(!empty($videoModel)){
            for($i=0; $i<$countForVideo; $i++){
                $modelVideo[$i]['id'] = $videoModel[$i]->id;
                $modelVideo[$i]['user'] = $videoModel[$i]->user;
                $modelVideo[$i]['service'] = $videoModel[$i]->service;
                $modelVideo[$i]['title'] = $videoModel[$i]->title;
                $modelVideo[$i]['description'] = $videoModel[$i]->description;
                $modelVideo[$i]['urlImg'] = $videoModel[$i]->url_img;
                $modelVideo[$i]['urlIframe'] = $videoModel[$i]->url_iframe;
                $modelVideo[$i]['created'] = $videoModel[$i]->created;
            }
        }

    ///определение последнего визита и статуса онлайн
        $statusMy = self::getStatus($model->lastvisit);
        
    ///выборка друзей
        $friendsCnt = \app\models\Friend::all();
        $friends = self::getFriends(Yii::$app->user->id);

        $friendsMy = array();
        for($i=0; $i<count($friends); $i++){
            $friendsMy[$i]['id'] = $friends[$i]->id;
            $friendsMy[$i]['nickname'] = $friends[$i]->nickname;

            $friendsMy[$i]['onlineInd'] = self::getIndicator($friends[$i]->user->lastvisit);
        }

    ///редактирование профиля
        $modelDescription = UserDescription::findOne($model->id);

        ///день рожд-я

        if($modelDescription->birthday != NULL){
            $day = (int)date('d',strtotime($modelDescription->birthday));
            $month = (int)date('m',strtotime($modelDescription->birthday));
            $year = (int)date('Y',strtotime($modelDescription->birthday));
        }else{
            $day = 0;
            $month = 0;
            $year = 0;                
        }
        $dayChoice = self::getDayList();
        $monthChoice = self::getMonthList();
        $yearsChoice = self::getYearsList();
        $optionsDay = ['options' => [ $day => ['selected ' => true]]];
        $optionsMonth = ['options' => [ $month => ['selected ' => true]]];
        $optionsYear = ['options' => [ $year => ['selected ' => true]]];

        $birthdayShow = $modelDescription->birthday_show;

    ////////загрузка аватара
        $dir = Yii::getAlias('@frontend/web/images/avatar/');
        if(!file_exists($dir)){
            @mkdir($dir, 0777);
        }
        $uploaded = false;
        $modelin = new UserAvatar();
        if ($modelin->load($_POST)) {
            if($file= UploadedFile::getInstance($modelin, 'image')){
                $modelin->image = $file;
                if ($modelin->validate()) {
                    $fullName = $dir . Yii::$app->user->id . '.jpg';
                    $fullNameMini = $dir . Yii::$app->user->id . '_small.jpg';
                    $uploaded = $file->saveAs( $fullName );
                    $ih = new CImageHandler();
                    $ih->load($fullName)
                        ->thumb(120, 120, true)
                        ->crop(80, 80, false, false)
                        ->save($fullNameMini)
                        ->reload()
                        ->thumb(200, 200, true)
                        ->crop(200, 200, false, false)     
                        ->save($fullName);
                }
                $modelDescription->avatar = Yii::$app->user->id . '.jpg';
                $modelDescription->avatar_small = Yii::$app->user->id . '_small.jpg';
                if($modelDescription->validate()){
                   $modelDescription->save();
                }
            }
        }

        $modelPrivacy = UserPrivacy::findOne($model->id);
        $privacyChoice = UserPrivacy::setNames();

        if($modelPrivacy->load(Yii::$app->request->post())){
            if($modelPrivacy->validate()){
                $modelPrivacy->save();
            }
        }

        if($modelDescription->load(Yii::$app->request->post())){
            $dayNew = $_POST["UserDescription"]['day'];
            $monthNew = $_POST["UserDescription"]['month'];
            $yearNew = $_POST["UserDescription"]['year'];

            if( $dayNew != 0 && $monthNew != 0 && $yearNew != 0 ){
                $modelDescription->birthday = $yearNew.'-'.$monthNew.'-'.$dayNew;
            }elseif( $dayNew == 0 && $monthNew == 0 && $yearNew == 0 ){
                $modelDescription->birthday = NULL;
            }

            if($modelDescription->validate()){
               $modelDescription->save();
               Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Успешно сохраненно'));
               return $this->refresh();
            }

        } 

        /// находим последние фото для топа страницы
        $modelPhoto = self::getPhoto(Yii::$app->user->id);
        $modelPhotoCount = count($modelPhoto);
        // die(var_dump($modelPhoto));
        $checkRating = UserDescription::find()->where(['id' => Yii::$app->user->id])->one();
        $i=0;
        foreach ($checkRating as $key => $value) {
            if(!empty($checkRating[$key]) && $key != 'id' && $key != 'birthday_show' && $key != 'language' && $key != "rating" && $key != "avatar_small"){
                $i++;
            }
        }
        $checkRating->rating = $i;
        if($checkRating->validate()){
            $checkRating->save();
        }

        return $this->render('index', [
            'model' => $model,
            'modelDescription' => $modelDescription,
            'newBoard' => $newBoard,
            'boards' => $boards,
            'lastPhotoAlbum' => $lastPhotoAlbum,
            'countPhotoAlbum' => $countPhotoAlbum,
            'friendsMy' => $friendsMy,
            'friendsCnt' => $friendsCnt,
            'statusMy' => $statusMy,
            'yearsChoice' => $yearsChoice,
            'dayChoice' => $dayChoice,
            'monthChoice' => $monthChoice,
            'optionsDay' => $optionsDay,
            'optionsMonth' => $optionsMonth,
            'optionsYear' => $optionsYear,
            'birthdayShow' => $birthdayShow,
            'modelin' => $modelin,
            'modelPrivacy' => $modelPrivacy,
            'privacyChoice' => $privacyChoice,
            'modelVideo' => $modelVideo,
            'countVideo' => $countVideo,
            'modelPhoto' => $modelPhoto,
            'modelPhotoCount' => $modelPhotoCount,
         ]);
    } 
 
    public function actionView($user)
    {
        if ($user == Yii::$app->user->id){
            return $this->redirect('/myprofile/');
        }
     
        $model = User::find()->where("id = :id", [':id' => $user])->one();
        if(!$model){
            throw new HttpException(404, 'Указанная запись не найдена');
        }
        $modelDescription = UserDescription::findOne($model->id);

        $newBoard = new Board();
        if($newBoard->load(Yii::$app->request->post())){
            $newBoard->created = date("Y-m-d H:i:s");
            $newBoard->user = $model->id;
            $newBoard->owner = Yii::$app->user->id;
            if($newBoard->photo > 0 || $newBoard->text || $newBoard->notice > 0){
                if($newBoard->validate()){
                    $newBoard->save();
                    return $this->refresh();
                }
            }
        }
        $boards = Board::find()->where("user = :user", [':user' => $model->id])->orderBy("id desc")->all();

        $lastPhotoAlbum = Photoalbum::find()->where("user = :user", [':user' => $model->id])->orderBy('id desc')->one();
        $countPhotoAlbum = Photoalbum::find()->where("user = :user", [':user' => $model->id])->count();
    
    /// вывод видео в левый сайдбар

        $videoModel = Video::find()->where("user = :user", [':user' => $model->id])->orderBy("id desc")->all();
        $countVideo = Video::find()->where("user = :user", [':user' => $model->id])->count();

        $modelVideo = array();
        $countShow = ($countVideo > 2 ) ? 2 : $countVideo ;

        if(!empty($videoModel)){
            for($i=0; $i<$countShow; $i++){
                if(!empty($videoModel[$i]->id)){
                    $modelVideo[$i]['id'] = $videoModel[$i]->id;
                    $modelVideo[$i]['user'] = $videoModel[$i]->user;
                    $modelVideo[$i]['service'] = $videoModel[$i]->service;
                    $modelVideo[$i]['title'] = $videoModel[$i]->title;
                    $modelVideo[$i]['description'] = $videoModel[$i]->description;
                    $modelVideo[$i]['urlImg'] = $videoModel[$i]->url_img;
                    $modelVideo[$i]['urlIframe'] = $videoModel[$i]->url_iframe;
                    $modelVideo[$i]['created'] = $videoModel[$i]->created;
                    $modelVideo[$i]['privacyVideo'] = UserPrivacy::getPrivacy($videoModel[$i]->privacy_video, $videoModel[$i]->user);
                    if($modelVideo[$i]['privacyVideo'] == false){
                        $countShow += 1;
                    }
                }
            }
        }

        //маркер онлайн
        $userStatus = self::getStatus($model->lastvisit);
        //друзья юзера
        $friends = self::getFriends($model->id);
        // Всего друзей
        $friendsCnt = \app\models\Friend::all( $model->id );
        
        $userFriends = array();
        $userFriendsId=[]; ///для приватности "друзья друзей" - ПЕРЕДЕЛАТЬ / УБРАТЬ
        for($i=0; $i<count($friends); $i++){
            $userFriends[$i]['id'] = $friends[$i]->id;
            $userFriends[$i]['nickname'] = $friends[$i]->nickname;
            $userFriends[$i]['onlineInd'] = self::getIndicator($friends[$i]->user->lastvisit);
            $userFriendsId[] = $friends[$i]->id; // ПЕРЕДЕЛАТЬ / УБРАТЬ
        }

////Приватность 
        $list = UserDescription::listLabels();
        $modelPrivacy = UserPrivacy::find()->where("`id` = :id", [':id' => $model->id])->asArray()->one();
        $messagePrivacy = UserPrivacy::getPrivacy($modelPrivacy['private_messages'], $model->id);
        $boardPrivacy = UserPrivacy::getPrivacy($modelPrivacy['board_comment'], $model->id);
        
        $userList = array();
        foreach ($list as $key => $value) {
            if(!UserDescription::showInfo($key, $modelDescription) || (!empty($modelPrivacy[$key]) && !UserPrivacy::getPrivacy($modelPrivacy[$key], $model->id))){ 
                continue; 
            }
            $userList[$value] = UserDescription::showInfo($key, $modelDescription);
        }
        
        $modelPhoto = self::getPhoto($user);
        $modelPhotoCount = count($modelPhoto);

        return $this->render('view', [
            'model' => $model,
            'modelDescription' => $modelDescription,
            'newBoard' => $newBoard,
            'boards' => $boards,
            'lastPhotoAlbum' => $lastPhotoAlbum,
            'countPhotoAlbum' => $countPhotoAlbum,
            'userStatus' => $userStatus,
            'userFriends' => $userFriends,
            'friendsCnt' => $friendsCnt,
            'modelPrivacy' => $modelPrivacy,
            'modelVideo' => $modelVideo,
            'countVideo' => $countVideo,
            'userList' => $userList,
            'messagePrivacy' => $messagePrivacy,
            'boardPrivacy' => $boardPrivacy,
            'modelPhoto' => $modelPhoto,
            'modelPhotoCount' => $modelPhotoCount,
        ]);
    }

    public static function getPhoto($id)
    {
        $modelAlbums = Photoalbum::find()->where(['user'=> $id, 'portal_album' => 0])->orderBy("id desc")->all();
        $countmodelAlbums = count($modelAlbums);
        $albumsId = array();
        for($j=0; $j<$countmodelAlbums; $j++){
            if(!UserPrivacy::getPrivacy($modelAlbums[$j]->privacy_album, $id) && $id != Yii::$app->user->id){
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

    public static function getStatus($lastvisit)
    {
        if( time() - $lastvisit < 900){
            return "online";
        }else{
            if(date('d', $lastvisit) == date('d', time())){
                return "Был сегодня в ".date('H:i', $lastvisit);
            }else{
                $monthes = array(
                1 => 'января', 2 => 'февраля', 3 => 'марта', 4 => 'апреля',
                5 => 'мая', 6 => 'июня', 7 => 'июля', 8 => 'августа',
                9 => 'сентября', 10 => 'октября', 11 => 'ноября', 12 => 'декабря');
                
                return "Был в сети ".date('j', $lastvisit).' '. $monthes[(int)date('m', $lastvisit)].' в '.date('H:i', $lastvisit);
            }
        }
    } 

    public static function getIndicator($lastvisit)
    {
        if( time()-$lastvisit < 900){
            return '1';
        }else{
            return '0';
        }
    } 

    public static function getTimeRecord($time)
    {
        if( date('d m Y', time()) === date('d m Y', $time)){
            return "Сегодня в ".date('H:i', $time);
        }elseif( (date('d', time())-date('d', $time)) == 1 && date('m Y', time()) == date('m Y', $time)){
            return "Вчера в ".date('H:i', $time);
        }else{
            $monthes = array(
            1 => 'января', 2 => 'февраля', 3 => 'марта', 4 => 'апреля',
            5 => 'мая', 6 => 'июня', 7 => 'июля', 8 => 'августа',
            9 => 'сентября', 10 => 'октября', 11 => 'ноября', 12 => 'декабря');
            
            return date('j', $time).' '. $monthes[(int)date('m', $time)].' в '.date('H:i', $time);
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