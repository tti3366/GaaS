package config;

import java.net.URL;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class DatabaseConfig {
	
	//mysql 설정
	public DataSource dataSource_mysql() {
		DataSource ds = new DataSource();
		
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/SW?characterEncoding=utf8");
		
		ds.setUsername("root");
		ds.setPassword("root");
		ds.setInitialSize(10);
		ds.setMaxActive(30);
		
		System.out.println("[DB] CONNECT MYSQL");
		return ds;
	}
	
	//오라클 설정
	@Bean(destroyMethod = "close")
	public DataSource dataSource_oracle() {
		DataSource ds = new DataSource();
		
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@61.255.235.171:1521:xe");
		//ds.setUrl("jdbc:oracle:thin:@gaasdb_medium?TNS_ADMIN=C:/Wallet_gaasDB");
		//ds.setUrl("jdbc:oracle:thin:@gaasdb_medium?TNS_ADMIN=/home/ubuntu/Wallet_gaasDB");
		
		ds.setUsername("GaaS");
		ds.setPassword("GaaS");
		//ds.setUsername("admin");
		//ds.setPassword("Qwer1234!@#$");

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
    		
		System.out.println("[DB] CONNECT ORACLE");
		return ds;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate() {
		System.out.println("[DB] DATASOURCE");
		return new JdbcTemplate(dataSource_oracle());
	}
}
