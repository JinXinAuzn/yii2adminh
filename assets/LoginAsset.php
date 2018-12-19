<?php

namespace jx\adminh\assets;


use yii\web\AssetBundle;

/**
 * @author Au zn <690550322@qq.com>
 * @since Full version
 */
class LoginAsset extends AssetBundle
{
	public $sourcePath = '@jx/adminh/web';
	public $css = [
		'css/login/reset.css',
		'css/login/login.css',
	];
	public $js=[
		'js/login/FSS.js'
	];
	public $depends = [
		'yii\web\YiiAsset',
	];
}
