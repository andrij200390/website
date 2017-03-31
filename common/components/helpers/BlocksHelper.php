<?php

namespace common\components\helpers;

class BlocksHelper
{
    /**
     * These 2 functions below are needed to convert $img_block_size to readable string.
     *
     * @return array block size data (mainly for using with Packery and current 'squared' layout)
     */
    public static function getBlockSizeList()
    {
        return [
          1 => '500x500',
          2 => '500x250',
          3 => '250x250',
        ];
    }

    /**
     * Gets block size by %controllername% $img_block_size.
     *
     * @param int $img_block_size Must be a valid int, matching size from getBlockSizeList() - defaults to 1 (500x500 block)
     *
     * @return array
     */
    public static function getBlockSizeStatus($img_block_size = 1)
    {
        $r = self::getBlockSizeList();
        if (isset($r[$img_block_size])) {
            return $r[$img_block_size];
        }

        return $r[1];
    }
}
