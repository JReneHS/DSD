setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der/barrel_shifter_id/barrel_shifter_id.adf"]} { 
	design create barrel_shifter_id "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der/barrel_shifter_id"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der/barrel_shifter_izq_der.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der/barrel_shifter_id/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Barrel Shifter Izq Der/barrel_shifter_izq_der.vhd"
entity barrel_izq_der
vsim  +access +r barrel_izq_der   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
