/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.WSClients;

/**
 *
 * @author Diego Hiriart León
 */
public class HCSServiceClient {

    public java.util.List<ec.edu.hcs.controllers.Movimiento> readMovimientos(java.lang.String account) {
        ec.edu.hcs.controllers.WSHiCoSa_Service service = new ec.edu.hcs.controllers.WSHiCoSa_Service();
        ec.edu.hcs.controllers.WSHiCoSa port = service.getWSHiCoSaPort();
        return port.readMovimientos(account);
    }

    public int saveDeposito(java.lang.String account, double amount) {
        ec.edu.hcs.controllers.WSHiCoSa_Service service = new ec.edu.hcs.controllers.WSHiCoSa_Service();
        ec.edu.hcs.controllers.WSHiCoSa port = service.getWSHiCoSaPort();
        return port.saveDeposito(account, amount);
    }

}
