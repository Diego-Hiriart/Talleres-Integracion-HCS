/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.controllers;

import ec.edu.HCS.WSClients.HCSServiceClient;
import ec.edu.hcs.controllers.Movimiento;
import java.util.List;

/**
 *
 * @author Diego Hiriart León
 */
public class HCSServiceController {

    public List<Movimiento> getMovements(String account) {
        HCSServiceClient client = new HCSServiceClient();
        return client.readMovimientos(account);
    }

    public int makeDeposito(String account, double amount) {
        HCSServiceClient client = new HCSServiceClient();
        return client.saveDeposito(account, amount);
    }
}
