<?php
/**
 * @copyright Copyright (C) 2015-2019 AIZAWA Hina
 * @license https://github.com/fetus-hina/stat.ink/blob/master/LICENSE MIT
 * @author AIZAWA Hina <hina@bouhime.com>
 */

declare(strict_types=1);

namespace app\assets;

use jp3cki\yii2\jqueryColor\JqueryColorAsset;
use yii\web\AssetBundle;
use yii\web\JqueryAsset;

class BattleListAsset extends AssetBundle
{
    public $sourcePath = '@app/resources/.compiled/stat.ink';
    public $js = [
        'battle-list.js',
        'battle-list-config.js',
    ];
    public $depends = [
        AppAsset::class,
        JqueryAsset::class,
        JqueryColorAsset::class,
        TableResponsiveForceAsset::class,
    ];
}
