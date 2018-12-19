$(document).ready(function () {
	$('.kv-grid-table thead .filters td:last').remove()
});
window.setTimeout(function () {
	$('.alert').alert('close');
}, 2000);
//设置标题
$("title",window.parent.document).text($('title').text());
// 刷新
$(document).on('click','.home-refresh',function () {
	parent.location.reload()
})
