<?php

namespace backend\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Photoalbum;

/**
 * PhotoalbumSearch represents the model behind the search form about `backend\models\Photoalbum`.
 */
class PhotoalbumSearch extends Photoalbum
{
    public $photo;
    public $school;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user'], 'integer'],
            [['name', 'text'], 'string'],
            [['created', 'photo', 'school'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied.
     * TODO: Sort for backend GridView. http://www.yiiframework.com/wiki/653/displaying-sorting-and-filtering-model-relations-on-a-gridview/.
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Photoalbum::find();
        $query->joinWith([
          //'photo',
          'school' => function ($query) {
              $query->select([
                '{{%school}}.id',
                '{{%school}}.album',
            ]);
          },
        ])->distinct();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => 30,
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            '{{%photoalbum}}.id' => $this->id,
            '{{%photoalbum}}.user' => $this->user,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', '{{%school}}.album', $this->school]);

        return $dataProvider;
    }
}
