<?php
namespace frontend\controllers;

use Yii;

use yii\filters\AccessControl;
use frontend\components\ParentController;
use common\models\News;
use app\models\Rss;
use yii\data\ArrayDataProvider;
use yii\db\Query;



class RssController extends ParentController
{

    public $limitItems = 20;

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['yandex','rambler'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],

                ],
            ],
        ];
    }


    /**
     * Creates rss-feed for yandex.
     * Finds in news last records. Sorting by data_create and data_update.
     * * @return string
     */
    public function actionYandex()
    {

        $idsUniq = [];
        $rssArrayParam = [];
        //get ids from last created records
        $idsCreated = News::find()
            ->select(['id'])
            ->orderBy(['created' => SORT_DESC])
            ->limit($this->limitItems)
            ->column();
        //get ids from last updates records
        $idsUpdated = News::find()
            ->select(['id'])
            ->orderBy(['date_redact' => SORT_DESC])
            ->limit($this->limitItems)
            ->column();
        //merge and unique ids
       $idsUniq = array_merge($idsCreated, $idsUpdated);
       $idsUniq = array_unique($idsUniq);
        //get other columns from ids
        $newsArray = (new Query())
            ->select([
                'z_news.id',
                'z_news.name',
                'z_news.url',
                'z_news.category',
                'z_news.user',
                'z_news.title',
                'z_news.description',
                'z_news.small',
                'z_news.text',
                'z_news.created',
                'z_news.img',
                'z_news.date_redact',
                'z_news.status',
				'z_news.article',
                'z_category.name as catName',
                'z_user.username']
            )
            ->from('z_news')
            ->leftJoin('z_category','z_news.category = z_category.id')
            ->leftJoin('z_user','z_news.user = z_user.id')
            ->where(['in', 'z_news.id', $idsUniq])
            ->andWhere(['=','z_news.status','1'])
			->andWhere(['!=','z_news.article','1'])
            ->orderBy(['z_news.created' => SORT_DESC])
            ->limit($this->limitItems)
            ->all();
        //get rows
        $dataProvider = new ArrayDataProvider([
            'allModels' => $newsArray,
            'pagination' => false,
        ]);
        //create array with parameters
        $rssArrayParam = [
            'xmlns:atom'=>'http://www.w3.org/2005/Atom',
            'xmlns:yandex'=>'http://news.yandex.ru',
            'xmlns:media'=>'http://search.yahoo.com/mrss/'
        ];

        //create a new Rss from model
        $feed = new Rss($rssArrayParam);
        //send to view
        return $this->renderPartial('yandex',[
            'model' => $dataProvider->getModels(),
            'feed' => $feed
        ]);


    }


    /**
     * Creates rss-feed for rambler.
     * Finds in news last records. Sorting by data_create and data_update.
     * * @return string
     */
    public function actionRambler()
    {

        $idsUniq = [];
        $rssArrayParam = [];
        //get ids from last created records
        $idsCreated = News::find()
            ->select(['id'])
            ->orderBy(['created' => SORT_DESC])
            ->limit($this->limitItems)
            ->column();
        //get ids from last updates records
        $idsUpdated = News::find()
            ->select(['id'])
            ->orderBy(['date_redact' => SORT_DESC])
            ->limit($this->limitItems)
            ->column();
        //merge and unique ids
        $idsUniq = array_merge($idsCreated, $idsUpdated);
        $idsUniq = array_unique($idsUniq);
        //get other columns from ids
        $newsArray = (new Query())
            ->select([
                    'z_news.id',
                    'z_news.name',
                    'z_news.url',
                    'z_news.category',
                    'z_news.user',
                    'z_news.title',
                    'z_news.description',
                    'z_news.small',
                    'z_news.text',
                    'z_news.created',
                    'z_news.img',
                    'z_news.date_redact',
                    'z_news.status',
                    'z_news.article',
                    'z_category.name as catName',
                    'z_user.username']
            )
            ->from('z_news')
            ->leftJoin('z_category','z_news.category = z_category.id')
            ->leftJoin('z_user','z_news.user = z_user.id')
            ->where(['in', 'z_news.id', $idsUniq])
            ->andWhere(['=','z_news.status','1'])
            ->andWhere(['!=','z_news.article','1'])
            ->orderBy(['z_news.created' => SORT_DESC])
            ->limit($this->limitItems)
            ->all();
        //get rows
        $dataProvider = new ArrayDataProvider([
            'allModels' => $newsArray,
            'pagination' => false,
        ]);
        //create array with parameters
        $rssArrayParam = [
            'version'=>'2.0',
            'xmlns:rambler'=>'http://news.rambler.ru',
        ];

        //create a new Rss from model
        $feed = new Rss($rssArrayParam);
        //send to view
        return $this->renderPartial('rambler',[
            'model' => $dataProvider->getModels(),
            'feed' => $feed
        ]);


    }
}






