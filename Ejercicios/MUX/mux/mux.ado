setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/MUX/mux/mux.adf"]} { 
	design create mux "D:/Semestre 2-2020/DSD/Ejercicios/MUX"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/MUX/mux"
cd "D:/Semestre 2-2020/DSD/Ejercicios/MUX"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/MUX/mux.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/MUX/mux/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/MUX/mux.vhd"
entity multiplexor
vsim  +access +r multiplexor   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
