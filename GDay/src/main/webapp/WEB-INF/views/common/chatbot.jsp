<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<script>
	    /* closer 챗봇 연동 설정(설치 스크립트) */
		(function(c, l, o, s, e, r) {
			c[e] = c[e] || {};
			r = l.createElement('script');
			s && (o += '?botId=' + s);
			e && (r.setAttribute('data-bind', e));
			r.src = o;
			r.async = 1;
			l.head.appendChild(r);
		})(window, document, 'https://app.closer.ai/webchat.js', 'B266ew');
	</script>
</body>
</html>