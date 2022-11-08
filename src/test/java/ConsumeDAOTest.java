import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bora.domain.report.ConsumeAllListVO;
import com.bora.domain.report.ConsumeLastThisListVO;
import com.bora.persistence.ConsumeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ConsumeDAOTest {
	
	@Inject
	SqlSession session;
	
	@Inject
	ConsumeDAO dao;
	
	final static String NAMESPACE = "com.bora.mapper.ConsumeMapper";
	private static final Logger log = LoggerFactory.getLogger(ConsumeDAOTest.class);
	
//	@Test
	public void test() throws Exception {
		log.info("♡♡♡♡♡♡♡♡♡♡test");
		log.info(dao+"");
	}
	
	// 저번, 이번 달 소비 비교 리스트
		public void getConsumeLastMonList() throws Exception{
			String loginID = "admin";
			List<ConsumeLastThisListVO> consumeLastMon = 
					session.selectList(NAMESPACE+".consumeLastMonList", loginID);
			log.info("♡♡♡♡♡♡♡♡♡♡ 불러온 정보: ");
			log.info("♡♡♡♡♡♡♡♡♡♡ "+consumeLastMon);
		}
		
		
		// 저번달 소비 비교 리스트
		public void getConsumeAllList() throws Exception{
			String loginID = "admin";
			List<ConsumeAllListVO> consumeList = 
					session.selectList(NAMESPACE+".consumeAllList", loginID);
			log.info("♡♡♡♡♡♡♡♡♡♡ 불러온 정보: ");
			log.info("♡♡♡♡♡♡♡♡♡♡ "+consumeList);
		}

		
}
