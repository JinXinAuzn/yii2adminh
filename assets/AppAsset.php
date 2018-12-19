<?php

namespace jx\adminh\assets;

use yii\web\AssetBundle;

/**
 * @author Au zn <690550322@qq.com>
 * @since Full version
 */
class AppAsset extends AssetBundle
{
	public $sourcePath = '@jx/adminh/web';
    public $css = [
	    'css/admin/admin-custom.min.css',
	    'css/admin/skin-custom.min.css',
    ];
    public $js=[
    	'js/admin/admin.js'
    ];
    public $depends = [
	    'yii\web\YiiAsset',
	    'yii\bootstrap\BootstrapPluginAsset',
    ];
}
