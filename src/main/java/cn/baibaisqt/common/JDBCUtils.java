package cn.baibaisqt.common;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceStatLoggerImpl;
import com.alibaba.druid.pool.DruidPooledConnection;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author xyh
 * @create 2022-01-12 20:11
 */
public class JDBCUtils {
    private static final DruidDataSource ds = new DruidDataSource();

    /**
     * 加载配置文件 初始化druid
     */
    static {
        Properties properties = new Properties();
        try {
            InputStream inputStream = JDBCUtils.class.getClassLoader().getResource("jdbc.properties").openStream();
            properties.load(inputStream);
            ds.setDriverClassName(properties.getProperty("driverClassName"));
            ds.setUrl(properties.getProperty("url"));
            ds.setUsername(properties.getProperty("username"));
            ds.setPassword(properties.getProperty("password"));
            ds.setStatLogger(new DruidDataSourceStatLoggerImpl());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConn() {
        Connection connection = null;
        try {
            connection = ds.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    public static DataSource getDS() {
        return ds;
    }

    public static void main(String[] args) throws IOException, SQLException {
        DruidPooledConnection connection = ds.getConnection();
        System.out.println(connection);


    }

}