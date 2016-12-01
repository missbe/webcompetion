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
                    <h3>We are on GitHub</h3>
                    <div class="tweet"></div>
                </div>

                <div class="percent-one-half column-last">
                    <h3>Get in Touch with Us</h3>
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
                <p>COPYRIGHT &copy; 2016 - missbe | ALL RIGHTS RESERVED</p>
				&nbsp;&nbsp;<a target="_blank" href="<%=basePath%>sitemap.xml">网站地图</a></p>

            </div><!--end one-half-->

            <div class="one-half column-last">
                <ul id="social">
                    <li><a class="rss" href="#">RSS Feed</a></li>
                    <li><a class="facebook" href="#">Facebook</a></li>
                    <li><a class="twitter" href="#">Twitter</a></li>
                    <li><a class="flickr" href="#">Flickr</a></li>
                    <li><a class="google" href="#">Google</a></li>

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