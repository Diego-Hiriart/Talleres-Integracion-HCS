/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.tests;

import ec.edu.HCS.WSClients.HCSServiceClient;

/**
 *
 * @author Diego Hiriart León
 */
public class DepositoTest {

    public static void main(String[] args) {
        try {
            String account = "00100001";
            double amount = 47;
            HCSServiceClient service = new HCSServiceClient();
            int status = service.saveDeposito(account, amount);
            System.out.println("Proceso ok: " + status);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
