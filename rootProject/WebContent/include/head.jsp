<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% application.setAttribute("imagePath", "http://172.16.3.18:8080"); %>
<%@ include file = "/include/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KyoBo Project</title>
<link rel="stylesheet" href="/static/css/notosanskr.css" />
<link rel="stylesheet" href="/static/css/campton.css" />
<link rel="stylesheet" href="/static/css/nanumbarungothic.css" />
<link rel="stylesheet" href="/static/css/SpoqaHanSans-kr.css" />
<link rel="stylesheet" href="/static/css/reset.css" />
<link rel="stylesheet" href="/static/css/popup_layout.css" />
<link rel="stylesheet" href="/static/css/common.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/static/plugins/jquery.easing.1.3.js"></script>
<link rel="stylesheet" href="/static/plugins/swiper.min.css" />
<script src="/static/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" src="/static/plugins/fancybox/source/jquery.fancybox.css"></link>
<script src="/static/plugins/jquery.gnb.js"></script>
<script src="/static/js/jquery.js"></script>
</head>
<body class=<%= pageCode == "main" ? "main" : "sub" %>>