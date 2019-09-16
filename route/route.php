<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
//use think\Route;
/*Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});*/

Route::get('', 'index/index');
//后台首页
Route::rule("/admin","admin/Admin/index");
//账号管理
Route::rule("/account","admin/Account/index");
//会员管理
Route::rule("/member","admin/Member/index");
//认证管理
Route::rule("/authentication","admin/Authentication/index");
//相册管理
Route::rule("/photos","admin/Photos/index");

//访问管理
Route::rule("/visit","admin/Visit/index");
//评论管理
Route::rule("/discuss","admin/Discuss/index");
//节目管理
Route::rule("/program","admin/Program/index");
//动态管理
Route::rule("/trends","admin/Trends/index");
//消费管理
Route::rule("/consume","admin/Consume/index");
//收益管理
Route::rule("/income","admin/Income/index");
//代理管理
Route::rule("/agent","admin/Agent/index");
//举报管理
Route::rule("/accusation","admin/Accusation/index");
//设置管理
Route::rule("/set","admin/Set/index");
//前台用户权限管理
Route::rule("/authority","index/Authority/index");

/*Route::group('admin', [
    ':id'   => 'Admin/index',
    ':name' => 'Blog/read',
])->ext('html')->pattern(['id' => '\d+']);*/
// 路由到默认或者绑定模块

//Route::rule('admin/:id','admin/Admin/index');
return [

];
