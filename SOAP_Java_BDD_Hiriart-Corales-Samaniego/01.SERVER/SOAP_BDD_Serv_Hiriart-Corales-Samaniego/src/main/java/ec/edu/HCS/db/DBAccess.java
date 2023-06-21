/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Diego Hiriart León
 */
public class DBAccess {

    private static final String URL = "jdbc:mysql://localhost:3306/wssoap";
    private static final String USER = "root";
    private static final String PASS = "admin";

    public DBAccess() {
    }

    public static Connection getConnection() throws SQLException {
        Connection cn = null;
        try {
            //Declare driver type
            String driver = "com.mysql.cj.jdbc.Driver";
            //Load driver
            Class.forName(driver).newInstance();
            //Stablish connection
            cn = DriverManager.getConnection(URL, USER, PASS);
        } catch (SQLException e) {
            throw e;
        } catch (ClassNotFoundException e) {
            throw new SQLException("ERROR, no se encuentra el dirver");
        } catch (Exception e) {
            throw new SQLException("ERROR, no se tiene acceso el servidor");
        }
        return cn;
    }

}
