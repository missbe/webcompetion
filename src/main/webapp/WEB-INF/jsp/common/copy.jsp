<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/11/8 0008
  Time: 下午 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<footer id="footer">
    <div class="centered-wrapper">
        <div id="topfooter">
            <div class="one-half">
                <h3>关于我们</h3>
                <p>四川理工学院 汇南4栋 612 </p>
                <div class="footer-logo"></div>
            </div><!--end percent-one-half-->
            <div class="one-half column-last">
                <div class="percent-one-half">
                    <ul style="margin-right:80%;">
                      <li><a style="font-size: 14px;" href="<%=basePath%>">&nbsp;Home</a></li>
                      <li><a style="font-size: 14px;" href="<%=basePath%>blog/list">&nbsp;博&nbsp;客</a></li>
                      <li><a style="font-size: 14px;" href="<%=basePath%>gallery/list">&nbsp;画&nbsp;廊</a></li>
                      <li><a style="font-size: 14px;" href="<%=basePath%>contact">&nbsp;留&nbsp;言</a></li>
                      <li><a style="font-size: 12px;" href="#"></a></li>
                    </ul>
                </div>

                <div class="percent-one-half column-last">
                    <h3>--联系我们--</h3>
                    <ul>
                        <li>Address: 四川省自贡市自流井区学苑街108号</li>
                        <li>Phone: 0813-5505909<br/>
                            E-mail: <a href="mailto:">missbe@missbe.cn</a></li>
                    </ul>
                </div><!--end one-half-->
            </div><!--end one-half-->
        </div><!--end topfooter-->
    </div><!--end centered-wrapper-->

    <div id="bottomfooter">
        <div class="centered-wrapper">
            <div class="one-half">
                <p>COPYRIGHT &copy; 2016 - 盐都科技【Missbe】 | ALL RIGHTS RESERVED
				&nbsp;&nbsp;<a target="_blank" href="<%=basePath%>static/sitemap.xml">网站地图</a></p>

            </div><!--end one-half-->

            <div class="one-half column-last">
                <ul id="social">
                    <li><a class="rss" href="#" title="Rss Feed">RSS Feed</a></li>
                    <li><a class="facebook" href="#" title="Facebook">Facebook</a></li>
                    <li><a class="twitter" href="#" title="Twitter">Twitter</a></li>
                    <li><a class="flickr" href="#" title="Flickr">Flickr</a></li>
                    <li><a class="google"  href="#" title="Google">Google</a></li>

                    <!-- You can add social icons for forrst, dribbble, vimeo, linkedin and skype. Take the ones you need from the list and paste them above

                        <li><a class="forrst" href="#">Forrst</a></li>
                        <li><a class="dribbble" href="#">Dribbble</a></li>
                        <li><a class="vimeo" href="#">Vimeo</a></li>
                        <li><a class="linkedin" href="#">LinkedIn</a></li>
                        <li><a class="skype" href="#">Skype</a></li>
                    -->
                </ul>
            </div><!--end one-half-->
        </div><!--end centered-wrapper-->
    </div><!--end bottomfooter-->
</footer><!--end footer-->