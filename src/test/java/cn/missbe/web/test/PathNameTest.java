package cn.missbe.web.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockServletContext;
import org.springframework.web.context.request.RequestContextListener;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2016/11/13 0013.
 */
public class PathNameTest {
    private HttpServletRequest request;
    private ServletContext context;
    @Before
    public void before(){
        RequestContextListener listener = new RequestContextListener();
        context = new MockServletContext();
        request = new MockHttpServletRequest(context);
        listener.requestInitialized(new ServletRequestEvent(context, request));
//        Member member = memberService.findById(Long.valueOf(1));
//        session = new MockHttpSession();
//        session.setAttribute(Constants.LOGIN_SESSION_NAME, member.getId());
//        session.setAttribute(Constants.SESSION_USER, member);
//        request.setSession(session);
    }
    @Test
    public void suffixTest(){
        String path="image.jpg";
        System.out.println("Index:"+path.lastIndexOf("."));
        String suffix=path.substring(path.lastIndexOf("."));
        System.out.println("Suffix:"+suffix);
    }
    @Test
    public void getRealPath(){
        System.out.println("Path:"+request.getContextPath());
    }
}
