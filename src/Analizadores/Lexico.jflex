package Analizadores;
import java_cup.runtime.Symbol; 


%% 
%class Lexico
%public
%line
%char 
%cup 
%full
%unicode


%init{
    yyline = 1; 
    yychar = 1; 
%init} 
 
%{
	String aux = "";
%}


%state COMENTARIO_MULTI, ESTADO_CADENA


id=([A-ZÑa-zñ]["_"0-9A-ZÑa-zñ]*)|(["_"]+[0-9A-ZÑa-zñ]["_"0-9A-ZÑa-zñ]*)

entero=[0-9]+
doble=[0-9]+"."[0-9]+
caracter='.'
comentario_linea=("//".*\r\n)|("//".*\n)|("//".*\r)
BLANCOS=[ \r\t]+

%%


<YYINITIAL> \n { yychar=1;}
<YYINITIAL> {BLANCOS} {}
<YYINITIAL> {comentario_linea} {yychar=1;}
<YYINITIAL> "/*" {yybegin(COMENTARIO_MULTI);}
<COMENTARIO_MULTI> "*/" {yybegin(YYINITIAL);}
<COMENTARIO_MULTI> \n { yychar=1;}
<COMENTARIO_MULTI> {BLANCOS} {}
<COMENTARIO_MULTI> . {}

<YYINITIAL> "\"" {yybegin(ESTADO_CADENA); aux = ""; }
<ESTADO_CADENA> "\"" {yybegin(YYINITIAL); return new Symbol(sym.cadena,yyline,yychar,aux);}
<ESTADO_CADENA> . {aux = aux + yytext(); }


<YYINITIAL> "++" {return new Symbol(sym.masmas,yyline,yychar, yytext());}
<YYINITIAL> "--" {return new Symbol(sym.menosmenos,yyline,yychar, yytext());}

<YYINITIAL> "+" {return new Symbol(sym.mas,yyline,yychar, yytext());}
<YYINITIAL> "-" {return new Symbol(sym.menos,yyline,yychar, yytext());}
<YYINITIAL> "*" {return new Symbol(sym.por,yyline,yychar, yytext());}
<YYINITIAL> "/" {return new Symbol(sym.division,yyline,yychar, yytext());}
<YYINITIAL> "%" {return new Symbol(sym.modulo,yyline,yychar, yytext());}
<YYINITIAL> "(" {return new Symbol(sym.parizquierdo,yyline,yychar, yytext());}
<YYINITIAL> ")" {return new Symbol(sym.parderecho,yyline,yychar, yytext());}
<YYINITIAL> "=" {return new Symbol(sym.igual,yyline,yychar, yytext());}


<YYINITIAL> "<" {return new Symbol(sym.menorque,yyline,yychar, yytext());}
<YYINITIAL> ">" {return new Symbol(sym.mayorque,yyline,yychar, yytext());}
<YYINITIAL> "<=" {return new Symbol(sym.menorigualque,yyline,yychar, yytext());}
<YYINITIAL> ">=" {return new Symbol(sym.mayorigualque,yyline,yychar, yytext());}
<YYINITIAL> "==" {return new Symbol(sym.igualigual,yyline,yychar, yytext());}
<YYINITIAL> "!=" {return new Symbol(sym.diferenteque,yyline,yychar, yytext());}

<YYINITIAL> "||" {return new Symbol(sym.or,yyline,yychar, yytext());}
<YYINITIAL> "&&" {return new Symbol(sym.and,yyline,yychar, yytext());}
<YYINITIAL> "^" {return new Symbol(sym.xor,yyline,yychar, yytext());}
<YYINITIAL> "!" {return new Symbol(sym.not,yyline,yychar, yytext());}

<YYINITIAL> "," {return new Symbol(sym.coma,yyline,yychar, yytext());}
<YYINITIAL> ";" {return new Symbol(sym.puntoycoma,yyline,yychar, yytext());}
<YYINITIAL> "{" {return new Symbol(sym.llaveizq,yyline,yychar, yytext());}
<YYINITIAL> "}" {return new Symbol(sym.llaveder,yyline,yychar, yytext());}
<YYINITIAL> ":" {return new Symbol(sym.dospuntos,yyline,yychar, yytext());}
<YYINITIAL> "?" {return new Symbol(sym.interrogacion,yyline,yychar, yytext());}
<YYINITIAL> "[" {return new Symbol(sym.corizquierdo,yyline,yychar, yytext());}
<YYINITIAL> "]" {return new Symbol(sym.corderecho,yyline,yychar, yytext());}
<YYINITIAL> "." {return new Symbol(sym.punto,yyline,yychar, yytext());}




<YYINITIAL> "int" {return new Symbol(sym.rint,yyline,yychar, yytext());}
<YYINITIAL> "double" {return new Symbol(sym.rdouble,yyline,yychar, yytext());}
<YYINITIAL> "char" {return new Symbol(sym.rchar,yyline,yychar, yytext());}
<YYINITIAL> "boolean" {return new Symbol(sym.rboolean,yyline,yychar, yytext());}
<YYINITIAL> "String" {return new Symbol(sym.rstring,yyline,yychar, yytext());}

<YYINITIAL> "class" {return new Symbol(sym.rclass,yyline,yychar, yytext());}
<YYINITIAL> "extends" {return new Symbol(sym.rextends,yyline,yychar, yytext());}
<YYINITIAL> "void" {return new Symbol(sym.rvoid,yyline,yychar, yytext());}
<YYINITIAL> "println" {return new Symbol(sym.rprintln,yyline,yychar, yytext());}
<YYINITIAL> "print" {return new Symbol(sym.rprint,yyline,yychar, yytext());}
<YYINITIAL> "printtabla" {return new Symbol(sym.rprinttabla,yyline,yychar, yytext());}


<YYINITIAL> "if" {return new Symbol(sym.rif,yyline,yychar, yytext());}
<YYINITIAL> "else" {return new Symbol(sym.relse,yyline,yychar, yytext());}
<YYINITIAL> "while" {return new Symbol(sym.rwhile,yyline,yychar, yytext());}
<YYINITIAL> "break" {return new Symbol(sym.rbreak,yyline,yychar, yytext());}
<YYINITIAL> "continue" {return new Symbol(sym.rcontinue,yyline,yychar, yytext());}
<YYINITIAL> "for" {return new Symbol(sym.rfor,yyline,yychar, yytext());}
<YYINITIAL> "do" {return new Symbol(sym.rdo,yyline,yychar, yytext());}
<YYINITIAL> "switch" {return new Symbol(sym.rswitch,yyline,yychar, yytext());}
<YYINITIAL> "case" {return new Symbol(sym.rcase,yyline,yychar, yytext());}
<YYINITIAL> "default" {return new Symbol(sym.rdefault,yyline,yychar, yytext());}
<YYINITIAL> "pow" {return new Symbol(sym.rpow,yyline,yychar, yytext());}

<YYINITIAL> "void" {return new Symbol(sym.rvoid,yyline,yychar, yytext());}
<YYINITIAL> "return" {return new Symbol(sym.rreturn,yyline,yychar, yytext());}
<YYINITIAL> "new" {return new Symbol(sym.rnew,yyline,yychar, yytext());}

<YYINITIAL> "public" {return new Symbol(sym.rpublic,yyline,yychar, yytext());}
<YYINITIAL> "protected" {return new Symbol(sym.rprotected,yyline,yychar, yytext());}
<YYINITIAL> "private" {return new Symbol(sym.rprivate,yyline,yychar, yytext());}
<YYINITIAL> "abstract" {return new Symbol(sym.rabstract,yyline,yychar, yytext());}
<YYINITIAL> "static" {return new Symbol(sym.rstatic,yyline,yychar, yytext());}
<YYINITIAL> "final" {return new Symbol(sym.rfinal,yyline,yychar, yytext());}

<YYINITIAL> "str" {return new Symbol(sym.rstr,yyline,yychar, yytext());}
<YYINITIAL> "toDouble" {return new Symbol(sym.rtoDouble,yyline,yychar, yytext());}
<YYINITIAL> "toInt" {return new Symbol(sym.rtoInt,yyline,yychar, yytext());}
<YYINITIAL> "toChar" {return new Symbol(sym.rtoChar,yyline,yychar, yytext());}

<YYINITIAL> "this" {return new Symbol(sym.rthis,yyline,yychar, yytext());}
<YYINITIAL> "super" {return new Symbol(sym.rsuper,yyline,yychar, yytext());}
<YYINITIAL> "null" {return new Symbol(sym.rnull,yyline,yychar, yytext());}
<YYINITIAL> "import" {return new Symbol(sym.rimport,yyline,yychar, yytext());}

<YYINITIAL> "graph" {return new Symbol(sym.rgraph,yyline,yychar, yytext());}
<YYINITIAL> "read_file" {return new Symbol(sym.rread_file,yyline,yychar, yytext());}
<YYINITIAL> "write_file" {return new Symbol(sym.rwrite_file,yyline,yychar, yytext());}

<YYINITIAL> "instanceof" {return new Symbol(sym.rinstanceof,yyline,yychar, yytext());}
<YYINITIAL> "read" {return new Symbol(sym.rread,yyline,yychar, yytext());}

<YYINITIAL> {entero} {return new Symbol(sym.entero,yyline,yychar, yytext());}
<YYINITIAL> {doble} {return new Symbol(sym.doble,yyline,yychar, yytext());}
<YYINITIAL> "true" {return new Symbol(sym.rtrue,yyline,yychar, yytext());}
<YYINITIAL> "false" {return new Symbol(sym.rfalse,yyline,yychar, yytext());}

<YYINITIAL> {caracter} { return new Symbol(sym.caracter,yyline,yychar, yytext());}
<YYINITIAL> {id} {return new Symbol(sym.id,yyline,yychar, yytext());}








. {
    System.err.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);
    //Interfaz.lista_errores.add(new CError("Léxico", "Caractér incorrecto '" + yytext() + "'", yyline, yychar));
    

}