/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.tests;

import ec.edu.HCS.WSClients.HCSServiceClient;
import ec.edu.hcs.controllers.Movimiento;
import java.util.List;

/**
 *
 * @author Diego Hiriart León
 */
public class MovimientosTest {

    public static void main(String[] args) {
        try {
            String account = "00100001";
            HCSServiceClient service = new HCSServiceClient();
            List<Movimiento> lista = service.readMovimientos(account);
            for (Movimiento r : lista) {
                System.out.println(r.getNromov() + " - " + r.getAccion() + " - " + r.getImporte());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
