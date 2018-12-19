<?php
namespace jx\adminh\controllers;
/**
 * 主控制器
 *
 * Class MainController
 * @package backend\controllers
 */
class MainController extends BaseController
{
    /**
     * 系统首页
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->renderPartial('main');
    }
}
