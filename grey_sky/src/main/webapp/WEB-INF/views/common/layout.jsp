<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		<div>
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		</div>
		<div>
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div>
	</div>
</body>
</html>