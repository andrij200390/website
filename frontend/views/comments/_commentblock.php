<?php
use yii\helpers\Html;
use yii\helpers\Url;

use common\components\helpers\ElementsHelper;

/**
 * Single comment view
 * renders as partial from public function actionShow @CommentsController
 */

if (isset($modelComments)) {

    /* --- Base vars for each .comment element --- */
    $comments_api_url_delete = Url::toRoute('comments/delete');
    $comments_api_url_show = Url::toRoute('comments/show');

    $comments_loader_element = '#outstyle_loader'; // Intercooler indicator
    $data = Yii::$app->request->get();
    /* --- Showing each comment from populated model --- */
    foreach ($modelComments as $comment) {
        if (isset($data['elem_id'])) {
          echo '<div id="new_comment">';
        }
        ?>
        <div data-comment-id="<?=$comment['id']; ?>" class="o-grid o-grid--wrap o-grid--top comment">
            <div class="o-grid__cell o-grid__cell--width-fixed comment__avatar">
                <img src="<?=$comment['userAvatar']; ?>"
                     alt="<?=Yii::t('app', 'Аватар пользователя {user}', ['user' => $comment['userNickname']]); ?>"
                     class="roundborder color-<?=$comment['userCulture']; ?>--border avatar avatar--medium">
            </div>

            <div class="o-grid__cell o-grid__cell--no-gutter comment__wrap">
                <div class="o-grid o-grid--wrap o-grid--top o-grid--no-gutter">
                    <div class="o-grid__cell o-grid__cell--width-100 u-letter-box--xsmall comment__info">
                        <a href='javascript:void(0)' class="comment__username">
                            <?=$comment['userNickname']; ?>
                        </a>
                        <span class="color-default u-pull-right comment__time">
                            <?=$comment['created']; ?>
                        </span>
                        <a href='javascript:void(0)'
                           class="i-icon comment__delete"
                           ic-indicator="<?=$comments_loader_element; ?>"
                           ic-include='{"id":<?=$comment['id']; ?>}'
                           ic-get-from="<?=$comments_api_url_delete; ?>">
                            <i class="zmdi zmdi-close"></i>
                        </a>
                    </div>

                    <div class="o-grid__cell o-grid__cell--width-100 comment__body">
                        <?=$comment['commentText']; ?>
                    </div>

                    <div class="o-grid__cell o-grid__cell--width-100 u-letter-box--medium comment__actions">
                        <a href="javascript:void(0);"
                               class="i-repost i-icon"
                               title="<?=Yii::t('app', 'Репост на стену'); ?>">
                            <i class="zmdi zmdi-more"></i>
                        </a>

                        <div class="u-pull-right">
                          <?=ElementsHelper::likeButton('comments', $comment['id'], $comment['likeCount'], $comment['myLike']); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php
      if (isset($data['elem_id'])) {
        echo '</div>';
      }
    }
} ?>
