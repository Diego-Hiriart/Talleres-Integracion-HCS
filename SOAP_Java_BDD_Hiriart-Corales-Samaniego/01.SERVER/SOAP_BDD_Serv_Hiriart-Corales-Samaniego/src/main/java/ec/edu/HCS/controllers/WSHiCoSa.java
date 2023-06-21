/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package ec.edu.HCS.controllers;

import ec.edu.HCS.models.Movimiento;
import ec.edu.HCS.services.MovimientoService;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;

/**
 *
 * @author Diego Hiriart León
 */
@WebService(serviceName = "WSHiCoSa")
public class WSHiCoSa {

    /**
     * This is a sample web service operation
     *
     * @param account
     * @return List of Movimientos objects
     */
    @WebMethod(operationName = "readMovimientos")
    @WebResult(name = "movimientos-list")
    public List<Movimiento> getMovimientos(@WebParam(name = "account") String account) {
        List<Movimiento> movimientosList;
        try {
            MovimientoService service = new MovimientoService();
            movimientosList = service.readMovimientos(account);
        } catch (Exception e) {
            movimientosList = new ArrayList<>();
            System.out.println("App error: "+e.getMessage());
        }
        return movimientosList;
    }

    /**
     * This is a sample web service operation
     *
     * @param account
     * @param amount
     * @return operations status (successful or not)
     */
    @WebMethod(operationName = "saveDeposito")
    @WebResult(name = "status")
    public int createDeposito(@WebParam(name = "account") String account, @WebParam(name = "amount") double amount) {
        //Operation result
        int status;
        //Burn employee code
        String employeeCode = "0001";
        try {
            MovimientoService service = new MovimientoService();
            service.createDeposito(account, amount, employeeCode);
            status = 1;
        } catch (Exception e) {
            status = -1;
            System.out.println("App error: "+e.getMessage());
        }
        return status;
    }
}
