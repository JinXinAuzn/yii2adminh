<?php

namespace jx\adminh\assets;

use yii\web\AssetBundle;

/**
 * @author Au zn <690550322@qq.com>
 * @since Full version
 */
class AutocompleteAsset extends AssetBundle
{
    /**
     * @inheritdoc
     */
	public $sourcePath = '@jx/adminh/web';
    /**
     * @inheritdoc
     */
    public $css = [
        'css/admin/jquery-ui.css',
    ];
    /**
     * @inheritdoc
     */
    public $js = [
        'js/admin/jquery-ui.js',
    ];
    /**
     * @inheritdoc
     */
    public $depends = [
        'yii\web\JqueryAsset',
    ];

}
