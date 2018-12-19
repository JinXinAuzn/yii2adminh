<?php

namespace jx\adminh\assets;

use yii\web\AssetBundle;

/**
 * @author Au zn <690550322@qq.com>
 * @since Full version
 */
class AnimateAsset extends AssetBundle
{
    /**
     * @inheritdoc
     */
	public $sourcePath = '@jx/adminh/web';
    /**
     * @inheritdoc
     */
    public $css = [
        'css/admin/animate.css',
    ];

}
