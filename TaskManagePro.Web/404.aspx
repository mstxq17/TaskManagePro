<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>


<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>404 - TaskManagePro</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="TaskManagePro 最好的任务展示平台">
<meta name="description" content="TaskManagePro是一个基于Bootstrap v3.3.7开发优秀任务展示平台">
<meta name="author" content="xq17">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<style>
body{
    background-color: #fff;
}
.error-page {
    height: 100%;
    position: fixed;
    width: 100%;
}
.error-body {
    padding-top: 5%;
}
.error-body h1 {
    font-size: 210px;
    font-weight: 700;
    text-shadow: 4px 4px 0 #f5f6fa, 6px 6px 0 #33cabb;
    line-height: 210px;
    color: #33cabb;
}
.error-body h4 {
    margin: 30px 0px;
}
</style>
</head>
  
<body>
<section class="error-page">
  <div class="error-box">
    <div class="error-body text-center">
      <h1>404</h1>
      <h4>很抱歉，但是那个页面看起来已经不存在了。</h4>
      <a href="/index.aspx" class="btn btn-primary ">返回首页</a>
    </div>
  </div>
</section>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">;</script>
</body>
</html>