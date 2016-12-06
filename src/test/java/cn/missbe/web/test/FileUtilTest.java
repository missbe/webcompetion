package cn.missbe.web.test;

import cn.missbe.web.competition.util.FileUploadUtil;
import org.junit.Test;

/**
 * Created by Administrator on 2016/12/6 0006.
 */
public class FileUtilTest {
	@Test
	public void testDelete(){
		String path="E:\\GitHub\\webpage\\target\\missbe\\static\\upload\\gallery\\201612\\201612061054011849.jpeg";
		FileUploadUtil.delete(path);
	}
}
