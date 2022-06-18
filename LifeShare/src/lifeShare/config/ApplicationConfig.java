package lifeShare.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages = {"lifeShare.dao","lifeShare.service"})
@Import({MyBatisConfig.class})  //myBatis�겢�옒�뒪瑜� �룷�븿�븯寃�
@EnableTransactionManagement
public class ApplicationConfig {
	@Bean   
	public DataSource dataSource() {
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
	
		dataSource.setDriverClass(com.mysql.jdbc.Driver.class);
		dataSource.setUrl("jdbc:mysql://52.79.86.54:3306/sys");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");
		return dataSource;
}
}
