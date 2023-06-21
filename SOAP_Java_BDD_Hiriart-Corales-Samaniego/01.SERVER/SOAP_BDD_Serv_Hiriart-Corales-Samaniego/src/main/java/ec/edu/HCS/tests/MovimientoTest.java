/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.tests;

import ec.edu.HCS.models.Movimiento;
import ec.edu.HCS.services.MovimientoService;
import java.util.List;

/**
 *
 * @author Diego Hiriart León
 */
public class MovimientoTest {

    public static void main(String[] args) {
        try {
            //dato de la prueba
            String cuenta = "00100001";

            //proceso
            MovimientoService service = new MovimientoService();
            List<Movimiento> lista = service.readMovimientos(cuenta);

            //reporte
            for (Movimiento r : lista) {
                System.out.println(r.getNromov() + " - " + r.getAccion() + " - " + r.getImporte());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
