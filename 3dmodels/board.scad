anchocuadrado = 200;
altocuadrado = 20;
radiocamaficha=35;
alturacama=2;
cuanadentro=1.5;
seguridadcorte=5;
tamanochecker=altocuadrado*0.65;
anchobarrachecker=5;

module conector() {
    color("Turquoise",1.0) {
        cylinder(altocuadrado+seguridadcorte,altocuadrado,altocuadrado);
        translate([-altocuadrado/2,-altocuadrado-altocuadrado/2,0]) cube([altocuadrado,altocuadrado,altocuadrado+seguridadcorte]);
        translate([0,-altocuadrado*2.3,0]) rotate([0,0,180]) {
            cylinder(altocuadrado+5,altocuadrado,altocuadrado);
            translate([-altocuadrado/2,-altocuadrado-altocuadrado/2,0]) cube([altocuadrado,altocuadrado,altocuadrado+seguridadcorte]);
           }
        
     }
}

module piezacalado(hsec=1,wsec=1,dismin=1) {
	color("Turquoise",1.0) {
        cylinder(altocuadrado+seguridadcorte*hsec,altocuadrado-dismin,altocuadrado-dismin);
        translate([-(altocuadrado-dismin*2)/2,radiocamaficha/cuanadentro-altocuadrado,0]) cube([altocuadrado-dismin*2,altocuadrado,altocuadrado+seguridadcorte*hsec]);
}}

module calado(hagocalado1,hagocalado2,hagocalado3) {
    if (hagocalado1) 
		translate([anchocuadrado/2,anchocuadrado-radiocamaficha/cuanadentro,-1]){
			cylinder(altocuadrado+5,altocuadrado,altocuadrado);
			translate([-altocuadrado/2,radiocamaficha/cuanadentro-altocuadrado,0]) cube([altocuadrado,altocuadrado+5,altocuadrado+5]);
        }
    if (hagocalado2) translate([radiocamaficha/cuanadentro,anchocuadrado/2,-1]) {
        cylinder(altocuadrado+5,altocuadrado,altocuadrado);
        translate([-altocuadrado-altocuadrado/2,-altocuadrado/2,0]) cube([altocuadrado,altocuadrado,altocuadrado+5]);
        }
    if (hagocalado3) translate([anchocuadrado-radiocamaficha/cuanadentro,anchocuadrado/2,-1]) {
        cylinder(altocuadrado+5,altocuadrado,altocuadrado);
        translate([+altocuadrado-altocuadrado/2,-altocuadrado/2,0]) cube([altocuadrado,altocuadrado,altocuadrado+5]);
        }        
    }


module cajafin(tipo=1) {
	extensioncajafin=1.1;
	margen1=2*anchocuadrado/6;
	distancia1=2*anchocuadrado/4.5;
	margen2=2*anchocuadrado/7.5;
	distancia2=2*anchocuadrado/6;
	margen=0.05;
	difference () {
		cube([anchocuadrado*2,anchocuadrado*2*extensioncajafin,altocuadrado]);
		for (fila=[0:3])
			for (columna=[0:5])	{	
				translate([fila*distancia1+margen1,columna*distancia2+margen2,altocuadrado*alturacama]) 
					sphere(radiocamaficha);
				}		
        if  (tipo==1 || tipo==3)
            translate([anchocuadrado,anchocuadrado*2*extensioncajafin-radiocamaficha/cuanadentro,-1]){
                cylinder(altocuadrado+5,altocuadrado,altocuadrado);
                translate([-altocuadrado/2,radiocamaficha/cuanadentro-altocuadrado,0]) cube([altocuadrado,altocuadrado+5,altocuadrado+5]);
                }		
       
    translate([anchocuadrado*margen*1.8,anchocuadrado*margen,17]) 
        cube([2*anchocuadrado*(1-margen*1.9),altocuadrado/3,altocuadrado/2]);
    translate([anchocuadrado*margen*1.8,anchocuadrado*2.2-anchocuadrado*margen*1.6,17]) 
        cube([2*anchocuadrado*(1-margen*1.9),altocuadrado/3,altocuadrado/2]);
        
    translate([distancia1*0.1+anchocuadrado*margen*1.6,anchocuadrado*margen,17]) 
        rotate([0,0,90]) cube([2.2*anchocuadrado*(1-1*margen),altocuadrado/3,altocuadrado/2]);
    translate([distancia1*1.1+anchocuadrado*margen*1.6,anchocuadrado*margen,17]) 
        rotate([0,0,90]) cube([2.2*anchocuadrado*(1-1*margen),altocuadrado/3,altocuadrado/2]);
    translate([distancia1*2.1+anchocuadrado*margen*1.6,anchocuadrado*margen,17]) 
        rotate([0,0,90]) cube([2.2*anchocuadrado*(1-1*margen),altocuadrado/3,altocuadrado/2]);
    translate([distancia1*3.1+anchocuadrado*margen*1.6,anchocuadrado*margen,17]) 
        rotate([0,0,90]) cube([2.2*anchocuadrado*(1-1*margen),altocuadrado/3,altocuadrado/2]);
    translate([distancia1*4.1+anchocuadrado*margen*1.6,anchocuadrado*margen,17]) 
        rotate([0,0,90]) cube([2.2*anchocuadrado*(1-1*margen),altocuadrado/3,altocuadrado/2]);
	}
    if (tipo==2 || tipo==3)
        translate([anchocuadrado,-altocuadrado-3,0]) piezacalado(hsec=0,wsec=0);
}

module cuadrado(x,y,hagocalado1,hagocalado2,hagocalado3,hagoconector,rotar) {
        translate([x,y,0]) {
            margen=0.05;
            rotate([0,0,rotar]) {
				difference () {
					cube([anchocuadrado,anchocuadrado,altocuadrado]);
					translate([anchocuadrado/3,anchocuadrado/3,altocuadrado*alturacama]) 
						sphere(radiocamaficha);
					translate([2*anchocuadrado/3,anchocuadrado/3,altocuadrado*alturacama]) 
						sphere(radiocamaficha);
					translate([anchocuadrado/3,2*anchocuadrado/3,altocuadrado*alturacama]) 
						sphere(radiocamaficha);
					translate([2*anchocuadrado/3,2*anchocuadrado/3,altocuadrado*alturacama]) 
						sphere(radiocamaficha);
					
					translate([anchocuadrado*margen,anchocuadrado*margen,17]) 
						cube([anchocuadrado*(1-2*margen),altocuadrado/3,altocuadrado/2]);
					translate([anchocuadrado*margen,anchocuadrado*(1-margen)-altocuadrado/3,17]) 
						cube([anchocuadrado*(1-2*margen),altocuadrado/3,altocuadrado/2]);
					translate([anchocuadrado,0,0]) rotate([0,0,90]) {
						translate([anchocuadrado*margen,anchocuadrado*margen,17]) 
							cube([anchocuadrado*(1-2*margen),altocuadrado/3,altocuadrado/2]);
						translate([anchocuadrado*margen,anchocuadrado*(1-margen)-altocuadrado/3,17]) 
							cube([anchocuadrado*(1-2*margen),altocuadrado/3,altocuadrado/2]);
					}
					calado(hagocalado1,hagocalado2,hagocalado3);
				}
				if (hagoconector) 
					translate([anchocuadrado/2,-altocuadrado-3,0]) {
						piezacalado(hsec=0,wsec=0,dismin=1);
						}
			}
        }
   }


module tabla_completa() {
    for (fila=[0:3])
    for (columna=[0:5])
        cuadrado(fila*anchocuadrado,columna*anchocuadrado);

    translate([0,0,altocuadrado]) 
        cube([altocuadrado,anchocuadrado*7,altocuadrado]);
    translate([anchocuadrado*4-altocuadrado,0,altocuadrado]) cube([altocuadrado,anchocuadrado*7,altocuadrado]);
    translate([0,0,altocuadrado]) cube([anchocuadrado*4,altocuadrado,altocuadrado]);
    translate([anchocuadrado,anchocuadrado*6-altocuadrado,altocuadrado]) cube([anchocuadrado*2,altocuadrado,altocuadrado]);
        
    translate([anchocuadrado-altocuadrado,anchocuadrado,altocuadrado]) cube([altocuadrado,anchocuadrado*5,altocuadrado]);
    translate([anchocuadrado*2-altocuadrado,0,altocuadrado]) cube([altocuadrado,anchocuadrado*5,altocuadrado]);
    translate([anchocuadrado*3-altocuadrado,anchocuadrado,altocuadrado]) cube([altocuadrado,anchocuadrado*5,altocuadrado]);
    translate([0,anchocuadrado*6,0]) 
        cube([anchocuadrado*4,anchocuadrado*1,altocuadrado]);
        
    translate([0,anchocuadrado*7-altocuadrado,altocuadrado]) 
        cube([anchocuadrado*4,altocuadrado,altocuadrado]);
        
    translate([anchocuadrado*2-altocuadrado,anchocuadrado*6,altocuadrado]) 
        cube([altocuadrado,anchocuadrado,altocuadrado]);
}
//translate([anchocuadrado/2,altocuadrado,0]) conector();

module ele() {
	translate([anchocuadrado,0,0]) rotate([0,0,90]) cuadrado(0,0,0,1,0,0,0);
	cuadrado(anchocuadrado,0,0,0,0,0,0);
	cuadrado(anchocuadrado*2,0,0,0,0,0,0);
	cuadrado(anchocuadrado*3,0,0,0,0,0,0);
	cuadrado(anchocuadrado*4,0,0,0,0,0,0);
	cuadrado(anchocuadrado*5,anchocuadrado*2,0,0,0,1,180);
}

//ele();
module ele2() {
    cuadrado(0,0,1,1,1,1);
    cuadrado(0,anchocuadrado,1,1,1,1);
    cuadrado(anchocuadrado,anchocuadrado*2,1,1,1,1,-90);
    cuadrado(anchocuadrado*2,anchocuadrado*2,1,1,1,1,-90);
    cuadrado(anchocuadrado*3,anchocuadrado*2,1,1,1,1,-90);
    cuadrado(anchocuadrado*4,anchocuadrado*2,1,1,1,1,-90);
}

module ele2_invertida() {
    cuadrado(0,0,1,1,1,1);
    cuadrado(0,anchocuadrado,1,1,1,1);
    cuadrado(0,anchocuadrado,1,1,1,1,90);
    cuadrado(-anchocuadrado,anchocuadrado,1,1,1,1,90);
    cuadrado(-anchocuadrado*2,anchocuadrado,1,1,1,1,90);
    cuadrado(-anchocuadrado*3,anchocuadrado,1,1,1,1,90);
    }

module culebra1() {
    translate ([-anchocuadrado/2,-anchocuadrado*2.2,0]) cajafin(1);
    ele2_invertida();
    translate([-anchocuadrado*4,anchocuadrado*2,0]) ele2();
    translate([0,anchocuadrado*4,0]) ele2_invertida();
    translate([-anchocuadrado*4,anchocuadrado*6,0]) ele2();
    translate ([anchocuadrado,anchocuadrado*8.5,0]) rotate([0,0,-90]) cajafin(2);
}

module culebra2() {
    translate ([-anchocuadrado/2,-anchocuadrado*2.2,0]) cajafin(1);
    ele2_invertida();
    translate([-anchocuadrado*5,anchocuadrado,0]) ele2();
    translate([0,anchocuadrado*2,0]) ele2_invertida();
    translate([-anchocuadrado*5,anchocuadrado*3,0]) ele2();
    translate ([anchocuadrado,anchocuadrado*8.5,0]) rotate([0,0,-90]) cajafin(2);
}


/* -------------------------------------------------------------*/
/* ---------------------Checkers!! -------------------------*/
/* -------------------------------------------------------------*/

module checker_base() {
	scale([1,1,0.6]) difference() {
		sphere(tamanochecker*2);
		translate([0,0,-tamanochecker*2]) cube([tamanochecker*4,tamanochecker*4,tamanochecker*4],true);
		}
    cylinder(2,tamanochecker*2.3,tamanochecker*2.3);
}

module checker_top() {
	translate([0,0,tamanochecker*0]) cylinder(tamanochecker*4,tamanochecker*2,tamanochecker/3);
	translate([0,0,tamanochecker*4]) sphere(tamanochecker*1.2);
}

module checker() {
	rotate([180,0,0]) checker_base();
	checker_top();
}

module checker_doble_head() {
	difference() {
		checker();
		translate([0,0,tamanochecker*4]) rotate([90,135,0]) argollacorte215();
		translate([0,0,tamanochecker*4]) rotate([90,135,90]) argollacorte215();
		}
}

module checker_simple(color1) {
	color(color1) checker();
	}

module checker_pin(color1,color2) {
    tamanocorteesferachecker=0.5;
    desplazamientoesferachecker=1.3;
    color(color1) difference() {
        checker();
        translate([0,tamanochecker*desplazamientoesferachecker,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([tamanochecker*desplazamientoesferachecker,0,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([0,-tamanochecker*desplazamientoesferachecker,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([-tamanochecker*desplazamientoesferachecker,0,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([0,0,tamanochecker*5]) sphere(tamanochecker*2*tamanocorteesferachecker);
        }
	color(color2) translate([0,0,tamanochecker*1.3]) sphere(tamanochecker*1.2);
	color(color2) translate([0,0,tamanochecker*4]) sphere(tamanochecker*1.18);
}

module checker_doble(color1,color2) {
	color(color1) difference() {
		checker();
		translate([0,0,tamanochecker*1]) rotate([0,0,0]) scale([1.3,1.3,1]) argollacorte();
		translate([0,0,tamanochecker*2]) rotate([0,0,0]) argollacorte();
		}
	color(color2) translate([0,0,tamanochecker*1]) rotate([0,0,0]) scale([1.2,1.2,1]) argollacorte_gra();
	color(color2) translate([0,0,tamanochecker*2]) rotate([0,0,0]) scale([0.85,0.85,1]) argollacorte_gra();
}



module argollacorte() {
	difference() {
		cylinder(anchobarrachecker,tamanochecker*1.2,tamanochecker*1.2);
		translate([0,0,-1]) cylinder(anchobarrachecker+2,tamanochecker*1,tamanochecker*1);
	}
}

module argollacorte_gra() {
	difference() {
		cylinder(anchobarrachecker,tamanochecker*1.4,tamanochecker*1.2);
		translate([0,0,-1]) cylinder(anchobarrachecker+2,tamanochecker*1,tamanochecker*1);
	}
}


module argollacorte215() {
	difference() {
		cylinder(anchobarrachecker,tamanochecker*1.2,tamanochecker*1.2);
		translate([0,0,-1]) cylinder(anchobarrachecker+2,tamanochecker*1,tamanochecker*1);
		translate([0,0,-1]) cube([tamanochecker*1.2,tamanochecker*1.2,tamanochecker*1.2]);
	}
}

module set_fichas(color1,color2,pos) {
	translate([anchocuadrado/3+anchocuadrado*pos,anchocuadrado/3,altocuadrado]) checker_pin(color1,color2);
	translate([anchocuadrado/3+anchocuadrado*pos,2*anchocuadrado/3,altocuadrado]) checker_doble(color1,color2);
	translate([2*anchocuadrado/3+anchocuadrado*pos,anchocuadrado/3,altocuadrado]) checker_simple(color1);
	translate([2*anchocuadrado/3+anchocuadrado*pos,2*anchocuadrado/3,altocuadrado]) checker_simple(color1);
}

module imprimir_checker_normal() {
    checker_top();
    translate([tamanochecker*4.5,0,0]) checker_base();    
    }

module imprimir_checker_doble(color1) {
    difference() {
		checker_top();
		translate([0,0,tamanochecker*1]) rotate([0,0,0]) scale([1.3,1.3,1]) argollacorte_gra();
		translate([0,0,tamanochecker*2]) rotate([0,0,0]) argollacorte_gra();
		}    
    translate([tamanochecker*4.5,0,0]) checker_base();    
    }
module imprimir_checker_pin() {
    tamanocorteesferachecker=0.5;
    desplazamientoesferachecker=1.3;
    color(color1) difference() {
        checker_top();
        translate([0,tamanochecker*desplazamientoesferachecker,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([tamanochecker*desplazamientoesferachecker,0,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([0,-tamanochecker*desplazamientoesferachecker,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([-tamanochecker*desplazamientoesferachecker,0,tamanochecker*2]) sphere(tamanochecker*tamanocorteesferachecker);
        translate([0,0,tamanochecker*5]) sphere(tamanochecker*2*tamanocorteesferachecker);
        }   
	color(color2) translate([0,0,tamanochecker*1.3]) sphere(tamanochecker*1.15);
	color(color2) translate([0,0,tamanochecker*4.25]) sphere(tamanochecker*1);
    translate([tamanochecker*4.5,0,0]) checker_base();    
    }

module equipo() {
    translate([0,tamanochecker*4.7*0,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*1,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*2,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*3,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*4,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*5,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*6,0]) imprimir_checker_normal();
    translate([0,tamanochecker*4.7*7,0]) imprimir_checker_doble();
    translate([0,tamanochecker*4.7*8,0]) imprimir_checker_doble();
    translate([0,tamanochecker*4.7*9,0]) imprimir_checker_pin();
    }

//ele();
//culebra1();
//translate([anchocuadrado,anchocuadrado,anchocuadrado]) culebra1();
//piezacalado();
//cajafin();
//calado();
//color("red") translate([anchocuadrado/3,2*anchocuadrado/3,altocuadrado]) checker_doble();	
//color("#111111") cuadrado(0,0,1,1,1,1);
//color("#BBBBBB") cuadrado(anchocuadrado,0,1,1,1,1);
//color("#333333") cuadrado(2*anchocuadrado,0,1,1,1,1);
//color("#BBBBBB") cuadrado(3*anchocuadrado,0,1,1,1,1);
//cuadrado(-anchocuadrado,anchocuadrado,1,1,1,1);
//cuadrado(0,anchocuadrado,1,1,1,1);
//cuadrado(-anchocuadrado,anchocuadrado,1,1,1,1);
//tabla_completa();
//checker_pin("blue","white");
//translate([0,0,altocuadrado*0.1]) set_fichas("blue","white",0);
//set_fichas("#BBBBBB","#FF3333",1);
//set_fichas("red","white",2);
//set_fichas("green","yellow",0);
cajafin(3);
//equipo();
//translate([tamanochecker*9*1,0,0]) equipo();
//translate([tamanochecker*9*2,0,0]) equipo();
//imprimir_checker_normal();
