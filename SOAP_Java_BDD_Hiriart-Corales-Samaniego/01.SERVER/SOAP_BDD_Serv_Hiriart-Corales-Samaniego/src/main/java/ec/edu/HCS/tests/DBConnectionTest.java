/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.tests;

import ec.edu.HCS.db.DBAccess;
import java.sql.Connection;

/**
 *
 * @author Diego Hiriart León
 */
public class DBConnectionTest {

    public static void main(String[] args) {
        try {
            Connection cn = DBAccess.getConnection();
            System.out.println("OK");
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
