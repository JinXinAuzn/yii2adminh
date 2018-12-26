<?php

namespace jx\adminh\models\form;

use Yii;
use yii\base\Model;
use jx\adminh\models\Master;

/**
 * Login form
 */
class Login extends Model
{
    public $username;
    public $password;
    public $rememberMe = true;
	public $verifyCode;
    private $_user = false;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
	        ['verifyCode', 'captcha', 'captchaAction' => 'adminh/master/captcha'],
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Incorrect username or password.');
            }
        }
    }

    /**
     * Logs in a master using the provided username and password.
     *
     * @return boolean whether the master is logged in successfully
     */
    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->getUser()->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        } else {
            return false;
        }
    }

    /**
     * Finds master by [[username]]
     *
     * @return Master|null
     */
    public function getUser()
    {
        if ($this->_user === false) {
            $class = Yii::$app->getUser()->identityClass ? : 'jx\adminh\models\Master';
            $this->_user = $class::findByUsername($this->username);
        }

        return $this->_user;
    }
}
