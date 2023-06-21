/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.tests;

import ec.edu.HCS.services.MovimientoService;

/**
 *
 * @author Diego Hiriart León
 */
public class DepositoTest {

    public static void main(String[] args) {
        try {
            //datos
            String cuenta = "00100001";
            double importe = 206;
            String codEmp = "0001";
            //proceso
            MovimientoService service = new MovimientoService();
            service.createDeposito(cuenta, importe, codEmp);
            System.out.println("Proceso ok");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
