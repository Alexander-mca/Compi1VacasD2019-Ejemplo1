/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compi1.ejemplo1;

/**
 *
 * @author alexa
 */
public class CError {
 public String tipo,error;
    public int linean,columna;
    
    public CError(String tipo, String error, int linean, int columna) {
        this.tipo = tipo;
        this.error = error;
        this.linean = linean;
        this.columna = columna;
    }
   
    
}
