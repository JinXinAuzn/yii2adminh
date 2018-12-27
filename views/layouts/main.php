<?php
/* @var $this \yii\web\View */

/* @var $content string */

use jx\adminh\assets\AppAsset;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use \common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" style="background: #f3f3f4">
<head>
	<meta charset="<?= Yii::$app->charset ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?= Html::csrfMetaTags() ?>
	<title><?= Html::encode($this->title) ?></title>
	<?php $this->head() ?>
</head>
<body class="skin-custom sidebar-mini">
<?php $this->beginBody() ?>
<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content-header" style="overflow: hidden">
			<?= Breadcrumbs::widget([
				'homeLink' => [
					'label' => '首页',
					'url' => '#',
					'class' => 'home-refresh'
				],
				'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
				'options' => ['class' => 'pull-left breadcrumb home-url']
			]) ?>
			<ul class="breadcrumb pull-right">
				<li><a href="javascript:history.back()">返回</a></li>
				<li><a href="">刷新</a></li>
			</ul>
		</section>
		<!-- Main content -->
		<section class="content">
			<!-- Your Page Content Here -->
			<?= Alert::widget() ?>
			<?= $content ?>
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
</div>
<?= $this->render('./modal') ?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
