<?php
/**
 * User music player
 * Used in social.php layout, #player__container section
 * Questions? Feel free to ask: <scsmash3r@gmail.com> or skype: smash3rs
 *
 * TODO: redo form with Yii's HTML helpers and vars
 */

use yii\helpers\Url;

?>
     <div class="player">
        <a href="javascript:void(0);"><img src="<?=Url::to(['/css/img/player_row_left.png']);?>" alt="back"></a>
        <a href="javascript:void(0);"><img src="<?=Url::to(['/css/img/player_go.png']);?>" alt="go"></a>
        <a href="javascript:void(0);"><img src="<?=Url::to(['/css/img/player_row_right.png']);?>" alt="next"></a>
        <a href="javascript:void(0);" class="repeat">1</a>
        <span>0:46</span>
        <img src="<?=Url::to(['/css/img/player_girl.png']);?>" alt="photo">
        <div class="progressDiv">
            <span>Lana Del Rey – Serial Killer (K Theory Remix)</span>
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
            </div>
        </div>
        <span>4:19</span>
        <a href="javascript:void(0);"><img src="<?=Url::to(['/css/img/player_volume.png']);?>" alt="volume"></a>
        <a href="javascript:void(0);"><img src="<?=Url::to(['/css/img/player_list.png']);?>" alt="listing track"></a>
    </div>
