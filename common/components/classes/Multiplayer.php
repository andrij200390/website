<?php
/**
 *  A tiny library to build nice HTML embed codes for videos.
 *  This is an extending class, that adds some other services to parse from.
 *
 *  @see: https://github.com/felixgirault/multiplayer
 *	@author [SC]Smash3r <scsmash3r@gmail.com>
 *	@license FreeBSD License (http://opensource.org/licenses/BSD-2-Clause)
 */
namespace common\components\classes;

/**
 *	Builds HTML embed codes for videos.
 */
class Multiplayer extends \Multiplayer\Multiplayer
{
    /**
   * @inheritdoc
   */
    public $services = [
        'rutube' => [
            'id' => '#rutube\.ru/play/embed/(?<id>[a-z0-9]+)#i',
            'url' => '//rutube.ru/play/embed/%s/',
            'map' => [
              'autoPlay' => 'autoplay',
              'showInfos' => 'showinfo',
              'showRelated' => 'rel'
            ]
        ]
    ];

    /**
     * @inheritdoc
     */
    public function __construct()
    {
        parent::__construct($this->services);
    }
}
