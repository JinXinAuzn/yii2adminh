<?php

/* @var $this  yii\web\View */
/* @var $model jx\adminh\models\BizRule */

$this->title = Yii::t('rbac-admin', 'Create Rule');
$this->params['breadcrumbs'][] = ['label' => Yii::t('rbac-admin', 'Rules'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="list-table ibox panel-dep-edit">

    <?=
    $this->render('_form', [
        'model' => $model,
    ]);
    ?>

</div>
