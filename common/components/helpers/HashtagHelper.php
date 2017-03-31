<?php
namespace common\components\helpers;

use Yii;

class HashtagHelper
{

    /**
     * Working with text to process and form hastags out of text
     * We also need to keep in mind that user can add his custom hashtags into text message body, so we need to parse them out
     *
     * [misc]
     * <a href="#" class="hashtag color-default">#hashtagname</a>
     *
     * @access	public
     * @param	  string Input text to process and search or form tags
     * @return	string
     */
    public static function processHashtagsFromText($text)
    {
        return;
    }

    public static function getExistingHashtags($text)
    {
        return;
    }

    public static function processHashtagsAsLinks($hashtags = [])
    {
        return;
    }
}
