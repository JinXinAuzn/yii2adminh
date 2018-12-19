<?php

namespace jx\adminh\controllers;

use jx\adminh\components\AdminLog;
use jx\adminh\components\UserStatus;
use jx\adminh\models\form\ChangePassword;
use jx\adminh\models\form\Login;
use jx\adminh\models\form\PasswordResetRequest;
use jx\adminh\models\form\ResetPassword;
use jx\adminh\models\form\Signup;
use jx\adminh\models\searchs\User as UserSearch;
use jx\adminh\models\User;
use Yii;
use yii\base\InvalidParamException;
use yii\base\UserException;
use yii\mail\BaseMailer;
use yii\web\BadRequestHttpException;
use yii\web\NotFoundHttpException;
use yii\captcha\CaptchaAction;

/**
 * User controller
 */
class UserController extends BaseController
{
    private $_oldMailPath;

	/**
	* 验证码
	* */
	public function actions()
	{
		return [
			'captcha' => [
				'class' => CaptchaAction::className(),
				'minLength' => 4,
				'maxLength' => 4,
				'backColor' => 0x00A17D,
				'foreColor' => 0xFFFFFF,
				'transparent' => FALSE,
			],
		];
	}
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        if (parent::beforeAction($action)) {
            if (Yii::$app->has('mailer') && ($mailer = Yii::$app->getMailer()) instanceof BaseMailer) {
                /* @var $mailer BaseMailer */
                $this->_oldMailPath = $mailer->getViewPath();
                $mailer->setViewPath('@jx/adminh/mail');
            }
            return true;
        }
        return false;
    }

    /**
     * @inheritdoc
     */
    public function afterAction($action, $result)
    {
        if ($this->_oldMailPath !== null) {
            Yii::$app->getMailer()->setViewPath($this->_oldMailPath);
        }
        return parent::afterAction($action, $result);
    }

    /**
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
                'model' => $this->findModel($id),
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
	    $this->showMessage('danger',Yii::t('rbac-admin', 'Delete Success'));
        return $this->redirect(['index']);
    }

    /**
     * Login
     * @return string
     */
    public function actionLogin()
    {
	    if (!Yii::$app->getUser()->isGuest) {
		    return $this->goHome();
	    }
	    $model = new Login();
	    if ($model->load(Yii::$app->getRequest()->post()) && $model->login()) {
		    AdminLog::addLog(1);
		    return $this->goBack();
	    } else {
		    return $this->renderPartial('login', [
			    'model' => $model,
		    ]);
	    }
    }

    /**
     * Logout
     * @return string
     */
    public function actionLogout()
    {
	    AdminLog::addLog(2);
	    Yii::$app->getUser()->logout();
	    return $this->goHome();
    }

    /**
     * Signup new user
     * @return string
     */
    public function actionSignup()
    {
        $model = new Signup();
        if ($model->load(Yii::$app->getRequest()->post())) {
            if ($user = $model->signup()) {
                return $this->goHome();
            }
        }

        return $this->render('signup', [
                'model' => $model,
        ]);
    }

    /**
     * Request reset password
     * @return string
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequest();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->validate()) {
            if ($model->sendEmail()) {
	            $this->showMessage('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
	            $this->showMessage('error', 'Sorry, we are unable to reset password for email provided.');
            }
        }

        return $this->render('requestPasswordResetToken', [
                'model' => $model,
        ]);
    }

    /**
     * Reset password
     * @return string
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPassword($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->getRequest()->post()) && $model->validate() && $model->resetPassword()) {
	        $this->showMessage('success', 'New password was saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
                'model' => $model,
        ]);
    }

    /**
     * Reset password
     * @return string
     */
    public function actionChangePassword()
    {
        $model = new ChangePassword();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->change()) {
            return $this->goHome();
        }

        return $this->render('change-password', [
                'model' => $model,
        ]);
    }

    /**
     * Activate new user
     * @param integer $id
     * @return type
     * @throws UserException
     * @throws NotFoundHttpException
     */
    public function actionActivate($id)
    {
        /* @var $user User */
        $user = $this->findModel($id);
        if ($user->status == UserStatus::INACTIVE) {
            $user->status = UserStatus::ACTIVE;
            if ($user->save()) {
                return $this->goHome();
            } else {
                $errors = $user->firstErrors;
                throw new UserException(reset($errors));
            }
        }
        return $this->goHome();
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
