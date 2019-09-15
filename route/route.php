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

//Route::get('hello/:name', 'index/hello');
Route::get('', 'index/index');
Route::get('say', 'index/index/say');
Route::rule("admin","admin/Admin/index");
Route::get("main","sample/test/index");
/*Route::group('admin', [
    ':id'   => 'Admin/index',
    ':name' => 'Blog/read',
])->ext('html')->pattern(['id' => '\d+']);*/
// 路由到默认或者绑定模块

//Route::rule('admin/:id','admin/Admin/index');
return [

];
