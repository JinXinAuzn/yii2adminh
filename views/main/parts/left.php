<?php

use jx\adminh\components\MenuHelper;

/**
 * @param $menu
 * @return array
 */
$callback = function ($menu) {
	$data = json_decode($menu['data'], true) ? json_decode($menu['data'], true) : ['icon' => 'fa fa-list', 'visible' => true];
	$items = $menu['children'];
	$return = [
		'label' => $menu['name'],
		'url' => [$menu['route']],
	];
	//处理我们的配置
	if ($data) {
		//visible
		isset($data['visible']) && $return['visible'] = $data['visible'];
		//icon
		isset($data['icon']) && $data['icon'] && $return['icon'] = $data['icon'];
		//other attribute e.g. class...
		$return['options'] = $data;
	}
	//没配置图标的显示默认图标
	(!isset($return['icon']) || !$return['icon']) && $return['icon'] = 'fa fa-list';
	(!isset($return['visible']) || !$return['visible']) && $return['visible'] = true;
	$items && $return['items'] = $items;
	return $return;
};
$item = MenuHelper::getAssignedMenu(Yii::$app->user->id, null, $callback);
?>
<!--左侧导航开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="nav-close"><i class="fa fa-times-circle"></i>
	</div>
	<div class="sidebar-collapse">
		<ul class="nav" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element text-center">
					<a class="dropdown-toggle" href="/">
                        <span class="clear">
                            <span class="block m-t-xs">
	                            <strong class="font-bold">
		                            <?= isset(Yii::$app->user->identity->username) ? Yii::$app->user->identity->username : 'admin' ?>
	                            </strong>
                            </span>
                        </span>
					</a>
				</div>
				<div class="logo-element"><?= Yii::t('rbac-admin', 'Admin_name') ?></div>
			</li>
			<?php foreach ($item as $value): ?>
				<?php if (!$value['options']['visible'] === false): ?>
					<li>
						<a href="<?= current($value['url']) ?>">
							<i class="<?= $value['options']['icon'] ?>"></i>
							<span class="nav-label"><?= $value['label'] ?></span>
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<?php foreach ($value['items'] as $v): ?>
								<?php if (!$v['visible'] === false): ?>
									<li>
										<a class="J_menuItem" href="<?= current($v['url']) ?>">
											<i class="fa <?= $v['icon'] ?>"></i>
											<?= $v['label'] ?>
										</a>
									</li>
								<?php endif; ?>
							<?php endforeach; ?>
						</ul>
					</li>
				<?php endif; ?>
			<?php endforeach; ?>
		</ul>
	</div>
</nav>
<!--左侧导航结束-->
