<?php
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $user jx\adminh\models\Master */

$resetLink = Url::to(['master/reset-password','token'=>$user->password_reset_token], true);
?>
Hello <?= $user->username ?>,

Follow the link below to reset your password:

<?= $resetLink ?>
