/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arbol;

import Arbol.Entorno.Entorno;
import java.util.LinkedList;

/**
 *
 * @author alexa
 */
public class AST {
    LinkedList<Instruccion> lista_instrucciones;
    Entorno tablaGlobal;
    public AST(LinkedList<Instruccion> lista_instrucciones){
        this.lista_instrucciones=lista_instrucciones;
        tablaGlobal=new Entorno(null);
    }
    public void Ejecutar(){
        for(Instruccion instruccion:lista_instrucciones){
            instruccion.ejecutar(tablaGlobal);
        }
    }
    
}
