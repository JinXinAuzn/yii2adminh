<!--右侧部分开始-->
<div id="page-wrapper" class="gray-bg dashbard-1">
	<div class="row border-bottom">
		<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;overflow: hidden">
			<ul class="nav navbar-top-links nav-tops-style">
				<li class="dropdown">
					<a class="navbar-minimalize" href="#">
						<i class="fa fa-bars"></i>
					</a>
				</li>
				<li class="nav-conter-li">
					<?= Yii::t('rbac-admin', 'Backend_name') ?>
				</li>
				<li class="dropdown hidden-xs">
					<a class="right-sidebar-toggle" aria-expanded="false">
						<i class="fa fa-tasks"></i> 主题
					</a>
				</li>
			</ul>
		</nav>
	</div>
	<div class="row content-tabs">
		<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-angle-double-left"></i>
		</button>
		<nav class="page-tabs J_menuTabs J_menuTabs_Monitor" id="rftags">
			<div class="page-tabs-content">
				<a href="javascript:;" class="active J_menuTab"
				   data-id="<?= Yii::t('rbac-admin', 'admin_index'); ?>">首页</a>
			</div>
		</nav>
		<button class="roll-nav roll-right J_tabRight"><i class="fa fa-angle-double-right"></i>
		</button>
		<div class="btn-group roll-nav roll-right">
			<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
			<ul role="menu" class="dropdown-menu dropdown-menu-right">
				<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
				<li class="divider"></li>
				<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
				<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
			</ul>
		</div>
		<?= yii\helpers\Html::a('<i class="fa fa fa-sign-out"></i>' . Yii::t('rbac-admin', 'Logout'), ['/adminh/user/logout'], ['class' => 'roll-nav roll-right J_tabExit', 'data-method' => 'post']) ?>
	</div>
