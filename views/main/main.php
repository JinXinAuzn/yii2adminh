<?php
/* @var $this \yii\web\View */

/* @var $content string */


use jx\adminh\assets\AdminHAsset;
use yii\helpers\Html;

AdminHAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
	<meta charset="<?= Yii::$app->charset ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?= Html::csrfMetaTags() ?>
	<title><?= Html::encode($this->title) ?></title>
	<?php $this->head() ?>
</head>
<body class="fixed-sidebar full-height-layout gray-bg  pace-done">
<?php $this->beginBody() ?>
<div id="wrapper">

	<?= $this->render('parts/left') ?>

	<?= $this->render('parts/header') ?>

	<?= $this->render('parts/content') ?>

	<?= $this->render('parts/footer') ?>

	<?= $this->render('parts/sidebar') ?>

	<?= $this->render('parts/modal') ?>

</div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
