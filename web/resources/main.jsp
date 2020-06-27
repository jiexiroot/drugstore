<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/18
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>Title</title>
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <script>
    function showpages(pages){
      $.ajax({
        url:"/drugstore/api/selectAll",
        type:"post",
        async:false,
        data:{pages: pages},
        success: (data) => {
          let json = $.parseJSON(data);
          console.log(json.result)
          window.location.href="resources/index.jsp"
        }
      })
    }
    $(() => {
      showpages(1);
    })
  </script>
</head>
<body>

</body>
</html>
