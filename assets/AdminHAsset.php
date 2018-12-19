<?php

namespace jx\adminh\assets;


use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AdminHAsset extends AssetBundle
{
	public $sourcePath = '@jx/adminh/web';
    public $css = [
        'css/admin/font-awesome.min.css',
        'css/admin/animate.css',
        'css/admin/style.css',
    ];
    public $js = [
    	'js/admin/jquery.metisMenu.js',
    	'js/admin/jquery.slimscroll.min.js',
	    'js/admin/layer/layer.min.js',
    	'js/admin/hplus.js',
    	'js/admin/contabs.js',
    	'js/admin/pace.min.js',
    ];
    public $depends = [
	    'backend\assets\AppAsset'
    ];
}
