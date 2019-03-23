<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
  <head>
    <%@include file="/common/header.jsp"%>
    <title>My JSP 'page.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="${ctx}/static/${uploadFivePath}/jquery.uploadifive.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/${uploadFivePath}/uploadifive.css" />
	<link>
	
	<script type="text/javascript">
		$(function() {
			$('#file_upload').uploadifive({
				'auto'             : false,
				'checkScript'      : '',				
				'queueID'          : 'queue',
				'fileObjName'	   : 'file',
				'uploadScript'     : '${ctx}/resource/save',
				//'fileType'         : 'text/plain',
				'onUploadComplete' : function(file, data) { 
				                         console.log(file);
					                     console.log(data);
					                 },
				'onError'		   : function(file, fileType, data) {
									     console.log("file:", file);
									     console.log("fileType:", fileType);
									     console.log("data:", data);
									     console.log(fileType.xhr.statusText);
								     },
				'buttonText'	   : '选择文件'
			});
		});
	</script>
	
	<style type="text/css">
	body {
	font: 13px Arial, Helvetica, Sans-serif;
		}
		.uploadifive-button {
			float: left;
			margin-right: 10px;
		}
		#queue {
			border: 1px solid #E5E5E5;
			height: 177px;
			overflow: auto;
			margin-bottom: 10px;
			padding: 0 3px 3px;
			width: 300px;
		}
	
	</style>
  </head>
  
  <body>
   	<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
		<a class="btn btn-default" style="position: relative; top: 8px;" 
		  href="javascript:$('#file_upload').uploadifive('upload')">即刻上传</a>
		<a class="btn btn-default" href="${ctx}/sys/upload/list">返回</button>
	</form>
  </body>
</html>
