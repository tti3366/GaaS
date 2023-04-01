package config;

import java.net.URL;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class DatabaseConfig {
	
	//mysql 설정
	public DataSource dataSource() {
		DataSource ds=new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/SW?characterEncoding=utf8");
		ds.setUsername("root");
		ds.setPassword("root");
		ds.setInitialSize(10);
		ds.setMaxActive(30);
		
		System.out.println("db연결");
		return ds;
	}
	
	//오라클 설정
	@Bean(destroyMethod = "close")
	public DataSource dataSource2() {
		DataSource ds=new DataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@gaasdb_medium?TNS_ADMIN=C:/Wallet_gaasDB");
		//ds.setUrl("jdbc:oracle:thin:@gaasdb_medium?TNS_ADMIN=/home/ubuntu/Wallet_gaasDB");
		ds.setUsername("admin");
		ds.setPassword("Qwer1234!@#$");
		//ds.setInitialSize(10);
		ds.setMaxActive(20);
		ds.setMaxIdle(20);
    		
		ds.setTestOnBorrow(true);
		ds.setTestOnReturn(false);
		ds.setMaxWait(3000);
		ds.setValidationQuery("SELECT 1 FROM DUAL");
    		
		ds.setTestWhileIdle(true);
		ds.setTimeBetweenEvictionRunsMillis(150000);
		ds.setNumTestsPerEvictionRun(4);
		ds.setMinEvictableIdleTimeMillis(-1);
    		
		
		System.out.println("db연결");
		return ds;
	}
	
	//db에 맞게 dataSource 다르게 하면 될듯
	@Bean
	public JdbcTemplate jdbcTemplate() {
		System.out.println("의존주입");
		return new JdbcTemplate(dataSource2());
	}
	
}
