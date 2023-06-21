/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ec.edu.HCS.controllers;

import javax.xml.ws.Endpoint;

/**
 *
 * @author Diego Hiriart León
 */
public class WSHiCoSaService {

    private static final String URL = "http://localhost:8081/WSHiCoSa";

    public static void main(String[] args) {
        System.out.println("Service published at: " + URL);
        Endpoint.publish(URL, new WSHiCoSa());
    }

}
