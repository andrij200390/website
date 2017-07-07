<?php
namespace frontend\controllers;

use Yii;
use yii\data\Pagination;
use yii\web\UploadedFile;
use common\CImageHandler;
use yii\web\HttpException;
use yii\filters\AccessControl;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\NotFoundHttpException;

use app\models\Video;
use app\models\Board;
use app\models\Likes;
use app\models\Comments;
use app\models\Newsfeed;
use app\models\UserPrivacy;
use app\models\Attachments;
use app\models\AuthAssignment;
use app\models\UserDescription;

use frontend\components\ParentController;
use common\components\helpers\CryptoHelper;

class VideoController extends ParentController
{
    public $layout='social';

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
        $model = Video::find()->where("user = :user", [':user' => Yii::$app->user->id])->orderBy("id desc")->all();
        $countVideo = Video::find()->where("user = :user", [':user' => Yii::$app->user->id])->count();
        $modelVideo = array();

        for ($i=0; $i<$countVideo; $i++) {
            $modelVideo[$i]['id'] = $model[$i]->id;
            $modelVideo[$i]['user'] = $model[$i]->user;
            $modelVideo[$i]['title'] = $model[$i]->title;
            $modelVideo[$i]['description'] = $model[$i]->description;
            $modelVideo[$i]['urlImg'] = $model[$i]->url_img;
            $modelVideo[$i]['urlIframe'] = $model[$i]->url_iframe;
            $modelVideo[$i]['created'] = $model[$i]->created;
        }

        return $this->render('index', [
            'modelVideo' => $modelVideo,
            'countVideo' => $countVideo,
            'model' => $model,

        ]);
    }

    /**
     * Single video view
     * Checks videohash, descrypts it, and if it has valid data - renders the view
     *
     * @param  string $videoHash Hashed video ID
     * @return array
     */
    public function actionView($videoHash)
    {
        $videoId = CryptoHelper::unhash($videoHash);
        if (!$videoId && !is_int($videoId)) {
            throw new NotFoundHttpException();
        }

        $video = Video::getById($videoId);
        return $this->render('view', [
            'video' => $video
        ]);
    }

    public function actionListvideo()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $idOwner = $data['idOwner'];
            $page = $data['page'];
            $loadMore = true;
            $check = self::getVideo($idOwner, $page+1);
            if (empty($check)) {
                $loadMore = false;
            }

            $model = self::getVideo($idOwner, $page);
            $count = count($model);
            $countVideo = Video::find()->where("user = :user", [':user' => $idOwner])->count();
            $modelVideo = array();
            $countFalse = 0;

            for ($i=0; $i<$count; $i++) {
                if (!UserPrivacy::getPrivacy($model[$i]->privacy_video, $model[$i]->user) && $idOwner != Yii::$app->user->id) {
                    $countFalse ++;
                    continue;
                }
                $modelVideo[$i-$countFalse]['id'] = $model[$i]->id;
                $modelVideo[$i-$countFalse]['user'] = $model[$i]->user;
                $modelVideo[$i-$countFalse]['title'] = $model[$i]->title;
                $modelVideo[$i-$countFalse]['description'] = $model[$i]->description;
                $modelVideo[$i-$countFalse]['urlImg'] = $model[$i]->url_img;
                $modelVideo[$i-$countFalse]['urlIframe'] = $model[$i]->url_iframe;
                $modelVideo[$i-$countFalse]['created'] = VideoController::getTimeRecord(strtotime($model[$i]->created));
                $modelVideo[$i-$countFalse]['likeCount'] = Likes::countLikes('video', $model[$i]->id);
                $modelVideo[$i-$countFalse]['myLike'] = Likes::myLike('video', $model[$i]->id);
                $modelVideo[$i-$countFalse]['commentsCount'] = $model[$i]->comments()->count();
            }
            $countVideo = $countVideo - $countFalse;
        }

        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'modelVideo' => $modelVideo,
            'loadMore' => $loadMore,
            ];
    }

    public function actionGetvideoinfo()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();

            $model = Video::findOne(['id' => $data['id']]);
            $video = array(
                'id' => $model->id,
                'user' => $model->user,
                'username' => $model->getUserNickname($model->user),
                'title' => $model->title,
                'description' => $model->description,
                'urlImg' => $model->url_img,
                'urlIframe' => $model->url_iframe,
                'created' => VideoController::getAddTimeVideo(strtotime($model->created)),
                'myLike' => Likes::myLike('video', $data['id']),
                'privacyComments' => UserPrivacy::getPrivacy($model->privacy_comments, $model->user),
                'commentsCount' => $model->comments()->count(),
                );

            $countLikes = Likes::countLikes("video", $data['id']);
            $comentVideo = $model->comments()->all();
            $commentsCount = $model->comments()->count();
            $comments = array();

            for ($i=0; $i<$commentsCount; $i++) {
                $comments[$i] = array(
                    'id' => $comentVideo[$i]->id,
                    'elem_type' => $comentVideo[$i]->elem_type,
                    'elem_id' => $comentVideo[$i]->elem_id,
                    'user_id' => $comentVideo[$i]->user_id,
                    'user_name' => UserDescription::getNickname($comentVideo[$i]->user_id),
                    'created' => VideoController::getTimeRecord(strtotime($comentVideo[$i]->created)),
                    'comment' => $comentVideo[$i]->comment,
                    'likeCount' => Likes::countLikes("comments", $comentVideo[$i]->id),
                    'myLike' => Likes::myLike("comments", $comentVideo[$i]->id),
                );
            }

            $isAdmin = AuthAssignment::isAdmin(Yii::$app->user->id);

            $videoInfo = array(
                'video' => $video,
                'comments' => $comments,
                'countLikes' => $countLikes,
                'isAdmin' => $isAdmin,
                );
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'videoInfo' => $videoInfo,
            ];
    }

    public function actionDelvideo()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $id = $data['idDel'];
            $model = Video::find()->where("id = :id", [':id' => $id])->one();
            $model->delete();
            $ok = 1;
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'ok' => $ok,
            ];
    }

    public static function getVideo($idOwner, $page = 1)
    {
        $query = Video::find()->where("user = :user", [':user' => $idOwner]);

        $pagination = new Pagination([
                    'defaultPageSize' => 24,
                    'totalCount' => $query->count(),
                    'page' => $page-1,
                ]);

        return $query->orderBy("id desc")
                     ->offset($pagination->offset)
                     ->limit($pagination->limit)
                     ->all();
    }

    public function actionLoadvideo()
    {
        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->get();
            $url = $data['url'];
            $videoInfo = self::getVideoInfo($url);

////сбор данных в модель
            $videoload = new Video();
            $videoload->user = Yii::$app->user->id;
            $videoload->service = $videoInfo['service'];
            $videoload->video_id = $videoInfo['idVideo'];
            $videoload->title = ($data['name'] != '') ? $data['name'] : $videoInfo['title'];
            $videoload->description = ($data['description'] != '') ? $data['description'] : '';
            $videoload->url_img = $videoInfo['urlImg'];
            $videoload->url_iframe = $videoInfo['iframeUrl'];
            $videoload->created = date("Y-m-d H:i:s", time());
            $videoload->privacy_video = $data['privacyVideo'];
            $videoload->privacy_comments = $data['privacyComments'];
            if ($videoload->validate()) {
                $videoload->save();
            }

            if ($data['repostBoard'] != "false") {
                $model = new Board();
                $model->user = Yii::$app->user->id;
                $model->owner = Yii::$app->user->id;
                $model->created = date("Y-m-d H:i:s", time());
                $model->text = '';

                if ($model->validate()) {
                    $model->save();

                    $modelNewsFeed = new Newsfeed();
                    $modelNewsFeed->elem_type = "board";
                    $modelNewsFeed->elem_id = $model->id;
                    $modelNewsFeed->user_id = $model->user;
                    if ($modelNewsFeed->validate()) {
                        $modelNewsFeed->save();
                    }
                }

                $modelAtt = Board::find()->where(array('user' => Yii::$app->user->id, 'owner' => Yii::$app->user->id))->orderBy('id desc')->limit(1)->one();
                $attachment = Attachments::addAttachment('board', $modelAtt->id, 'video', $videoload->id);
            }
            return $this->redirect(['video/index']);
            $ok = 1;
        }
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'ok' => $ok,
            ];
    }

///получить c сервиса все данные о ссылке
    public static function getVideoInfo($url)
    {
        $videoInfo = array();

        if (stripos($url, 'youtube.com') !== false) {
            preg_match('#v=([^\&]+)#is', $url, $videoId);
            if (count($videoId) > 0) {
                $videoInfo['idVideo'] = $videoId[1];
                $videoInfo['service'] = 'youtube.com';
            }
        }
        if (stripos($url, 'rutube.ru') !== false) {
            preg_match('#video/([^\&]+)#is', $url, $videoId);
            if (count($videoId) > 0) {
                $videoInfo['idVideo'] = $videoId[1];
                $videoInfo['service'] = 'rutube.ru';
            }
        }
        if (stripos($url, 'vimeo.com') !== false) {
            preg_match('#staffpicks/([^\&]+)#is', $url, $videoId);
            if (count($videoId) > 0) {
                $videoInfo['idVideo'] = $videoId[1];
                $videoInfo['service'] = 'vimeo.com';
            }
        }

        switch ($videoInfo['service']) {
            case 'rutube.ru':
                $page = file_get_contents('http://rutube.ru/api/oembed/?url=http://rutube.ru/video/'.$videoInfo['idVideo'].'&format=json');
                $arrPage = json_decode($page);
                $videoInfo['title'] = $arrPage->title;
                $videoInfo['urlImg'] = $arrPage->thumbnail_url;
                $videoInfo['iframeUrl'] = '//rutube.ru/play/embed/'.$videoInfo['idVideo'];
                break;
            case 'vimeo.com':
                $page = file_get_contents('http://vimeo.com/api/v2/video/'.$videoInfo['idVideo'].'.json');
                $arrPage = json_decode($page);
                $videoInfo['title'] = $arrPage[0]->title;
                $videoInfo['urlImg'] = $arrPage[0]->thumbnail_large;
                $videoInfo['iframeUrl'] = 'https://player.vimeo.com/video/'.$videoInfo['idVideo'];
                break;
            case 'youtube.com':
                $page = file_get_contents('https://www.googleapis.com/youtube/v3/videos?key=AIzaSyC0v-FlUSwTvDr8TSKMoIDu5gfl3DVGpXQ&part=snippet&id='.$videoInfo['idVideo']);
                $arrPage = json_decode($page);
                $videoInfo['title'] = $arrPage->items[0]->snippet->title;
                $videoInfo['urlImg'] = $arrPage->items[0]->snippet->thumbnails->medium->url;
                $videoInfo['iframeUrl'] = 'https://www.youtube.com/embed/'.$videoInfo['idVideo'].'?rel=0';
                break;
        }
        return $videoInfo;
    }

    public function actionLike()
    {
        $data = Yii::$app->request->get();

        $response = Likes::addLike($data['elem_type'], $data['id']);
        $response['likeCount'] = Likes::countLikes($data['elem_type'], $data['id']);
        $response['myLike'] = Likes::myLike($data['elem_type'], $data['id']);

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $response;
    }

    public function actionCountlikes()
    {
        $data = Yii::$app->request->get();

        if (Video::find()->where(['id' => $data['id']])->count() > 0) {
            $response = Likes::countLikes('video', $data['id']);
            $response = Likes::myLike('video', $data['id']);
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $response;
    }



    public function actionComment()
    {
        $data = Yii::$app->request->post();

        $atype = (!empty($data['atype'])) ? $data['atype'] : null;
        $aid = (!empty($data['aid'])) ? $data['aid'] : null;

        if (Video::find()->where(array('id' => $data['id']))->count() > 0) {
            $response = Comments::addComment('video', $data['id'], $data['text'], $atype, $aid);
        }

        if ($response['ok']) {
            $model = Comments::find()->where(array('elem_type' => 'video', 'elem_id' => $data['id']))->orderBy('id desc')->limit(1)->one();
            $response['comment'] = $model->comment;
            $response['created'] = self::getTimeRecord(strtotime($model->created));
            $response['elem_id'] = $model->elem_id;
            $response['idComment'] = $model->id;
            $response['user_id'] = $model->user_id;
            $response['user_name'] = UserDescription::getNickname($model->user_id);
            $response['likeCount'] = Likes::countLikes("comments", $model->id);
            $response['myLike'] = Likes::myLike("comments", $model->id);
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $response;
    }

    public function actionCountcomments()
    {
        $data = Yii::$app->request->get();
        if (Video::find()->where(array('id' => $data['id']))->count() > 0) {
            $response = Comments::countComments('video', $data['id']);
            $response = Likes::myLike('video', $data['id']);
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $response;
    }

    public function actionDelcomment()
    {
        $data = Yii::$app->request->get();
        if (Comments::find()->where(array('id' => $data['id']))->count() > 0) {
            $response = Comments::delComment($data['id']);
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return $response;
    }

    public function actionRepost()
    {
        $data = Yii::$app->request->get();

        $model = new Board();
        $model->user = Yii::$app->user->id;
        $model->owner = Yii::$app->user->id;
        $model->created = date("Y-m-d H:i:s", time());
        $model->text = '';

        if ($model->validate()) {
            $model->save();

            $modelNewsFeed = new Newsfeed();
            $modelNewsFeed->elem_type = "board";
            $modelNewsFeed->elem_id = $model->id;
            $modelNewsFeed->user_id = $model->user;
            if ($modelNewsFeed->validate()) {
                $modelNewsFeed->save();
            }
        }

        $modelAtt = Board::find()->where(array('user' => Yii::$app->user->id, 'owner' => Yii::$app->user->id))->orderBy('id desc')->limit(1)->one();
        $attachment = Attachments::addAttachment('board', $modelAtt->id, 'video', $data['id']);

        $ok = false;
        if (!empty($attachment)) {
            $ok = true;
        }

        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        return [
            'ok' => $ok,
            ];
    }

    public static function getTimeRecord($time)
    {
        if (date('d m Y', time()) === date('d m Y', $time)) {
            return "Сегодня в ".date('H:i', $time);
        } elseif ((date('d', time())-date('d', $time)) == 1 && date('m Y', time()) == date('m Y', $time)) {
            return "Вчера в ".date('H:i', $time);
        } else {
            $monthes = array(
            1 => 'января', 2 => 'февраля', 3 => 'марта', 4 => 'апреля',
            5 => 'мая', 6 => 'июня', 7 => 'июля', 8 => 'августа',
            9 => 'сентября', 10 => 'октября', 11 => 'ноября', 12 => 'декабря');

            return date('j', $time).' '. $monthes[(int)date('m', $time)].' в '.date('H:i', $time);
        }
    }

    public static function getAddTimeVideo($time)
    {
        if (date('d m Y', time()) === date('d m Y', $time)) {
            return "Сегодня в ".date('H:i', $time);
        } elseif ((date('d', time())-date('d', $time)) == 1 && date('m Y', time()) == date('m Y', $time)) {
            return "Вчера в ".date('H:i', $time);
        } else {
            $monthes = array(
            1 => 'января', 2 => 'февраля', 3 => 'марта', 4 => 'апреля',
            5 => 'мая', 6 => 'июня', 7 => 'июля', 8 => 'августа',
            9 => 'сентября', 10 => 'октября', 11 => 'ноября', 12 => 'декабря');

            return date('j', $time).' '. $monthes[(int)date('m', $time)].' '.date('Y', $time);
        }
    }
}
