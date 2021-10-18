<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../display/top.jsp"%>
  <style>
      video { max-width: 80%; display: block; margin: 20px auto; }
      video[poster]{ 
    height:100%;
    width:100%;
    }
    </style>
   <video controls poster="resources/images/poster/${watch.video_image}">
      <source src="resources/videos/Dog.mp4" type="video/mp4">
      <strong>Your browser does not support the video tag.</strong>
    </video>
    
    <%@include file="../display/bottom.jsp"%>