yii2-adminh
==========
Can be directly to development

Installation
------------

The preferred way to install this extension is through [composer](http://getcomposer.org/download/).

Either run

```
composer require --prefer-dist jinxinauzn/yii2-adminh "*"
```

or add

```
"jinxinauzn/yii2-adminh": "*"
```

to the require section of your `composer.json` file.


Usage
-----

Once the extension is installed, simply use it in your code by  :
notice Due to the  with  conflict So only jQuery_2*
```php
return [
    ...
    'aliases' => [
        '@jx/adminh' => 'path/to/your/extracted',
        // for example: '@jx/adminh' => '@backend/runtime/tmp-extensions/yii2-adminh',
        ...
    ]
];
```

In the main
-----

```php
return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
	'language' => 'zh-CN',
	'defaultRoute' => '/adminh/main/index',
	'homeUrl' => ['/'],
	'layout' => '@jx/adminh/views/layouts/main.php',
    'bootstrap' => ['log'],
    'modules' => [
	    'adminh' => [
		    'class' => 'jx\adminh\Module',
		    'layout' => 'main',
	    ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-backend',
        ],
        'user' => [
	        'identityClass' => 'jx\adminh\models\Master',
	        'enableAutoLogin' => true,
	        'loginUrl' => ['/adminh/master/login'],
	        'identityCookie' => ['name' => '_identity-backend', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-backend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
	    'i18n' => [
		    'translations' => [
			    '*' => [
				    'class' => 'yii\i18n\PhpMessageSource',
				    'basePath' => '@jx/adminh/messages',
			    ],
		    ],
	    ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
	    'authManager' => [
		    'class' => 'yii\rbac\DbManager', // use 'yii\rbac\DbManager'
	    ],
	    'assetManager' => [
		    'assetMap' => [
			    'jquery.js' => '@web/js/jquery.js', // jquery v3.2.1 和 jQuery UI 1.11.4 版本冲突 @https://stackoverflow.com/questions/37914869/jquery-ui-error-f-getclientrects-is-not-a-function
			    'jquery.min.js' => '@web/js/jquery.min.js',
		    ]
	    ],
	    'urlManager' => [
		    //用于表明urlManager是否启用URL美化功能，在Yii1.1中称为path格式URL，
		    // Yii2.0中改称美化。
		    // 默认不启用。但实际使用中，特别是产品环境，一般都会启用。
		    "enablePrettyUrl" => true,
		    // 是否启用严格解析，如启用严格解析，要求当前请求应至少匹配1个路由规则，
		    // 否则认为是无效路由。
		    // 这个选项仅在 enablePrettyUrl 启用后才有效。
		    "enableStrictParsing" => false,
		    // 是否在URL中显示入口脚本。是对美化功能的进一步补充。
		    "showScriptName" => false,
		    // 指定续接在URL后面的一个后缀，如 .html 之类的。仅在 enablePrettyUrl 启用时有效。
		    "suffix" => "",
		    'rules' => [
			    "<controller:\w+>/<action:\w+>" => "<controller>/<action>",
			    "<module:\w+>/<controller:\w+>/<action:\w+>" => "<module>/<controller>/<action>",
			    "<controller:\w+>/<action:\w+>/<id:\d+>" => "<controller>/<action>",
			    "<controller:\w+>/<action:\w+>/<id:\w+>" => "<controller>/<action>",
			    "<module:\w+>/<controller:\w+>/<action:\w+>/<id:\d+>" => "<module>/<controller>/<action>",
			    "<module:\w+>/<controller:\w+>/<action:\w+>/<id:\w+>" => "<module>/<controller>/<action>",
		    ],
	    ],
    ],
    
/*	'aliases' => [
		'@jx/adminh' => '@backend/runtime/tmp-extensions/yii2-adminh',
	],*/
	
	'as access' => [
		'class' => 'jx\adminh\components\AccessControl',
		'allowActions' => [
			'adminh/master/captcha',
			'adminh/master/login',
			'adminh/master/logout',
//			    '*'
		]
	],
    'params' => $params,
	'on beforeRequest' => function ($event) {
		\yii\base\Event::on(\yii\db\BaseActiveRecord::className(), \yii\db\BaseActiveRecord::EVENT_AFTER_UPDATE, ['jx\adminh\components\AdminLog', 'afterUpdate']);
		\yii\base\Event::on(\yii\db\BaseActiveRecord::className(), \yii\db\BaseActiveRecord::EVENT_AFTER_INSERT, ['jx\adminh\components\AdminLog', 'afterInsert']);
		\yii\base\Event::on(\yii\db\BaseActiveRecord::className(), \yii\db\BaseActiveRecord::EVENT_AFTER_DELETE, ['jx\adminh\components\AdminLog', 'afterDelete']);
	},
];
```
