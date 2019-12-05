/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizadores;

import Arbol.Entorno.Tipo;

/**
 *
 * @author alexa
 */
public class Literal {
    String nombre;
     sym tipo;
    public Literal(sym tipo,String nombre){
        this.nombre=nombre;
        this.tipo=tipo;
    }
}
