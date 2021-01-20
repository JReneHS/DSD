setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono/cont_sinc/cont_sinc.adf"]} { 
	design create cont_sinc "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono/cont_sinc"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono/cont_sinc.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono/cont_sinc/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono/cont_sinc.vhd"
entity contador
vsim  +access +r contador   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
