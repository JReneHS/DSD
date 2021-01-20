setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop/Flip_Flop/Flip_Flop.adf"]} { 
	design create Flip_Flop "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop/Flip_Flop"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop/Flip_Flop.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop/Flip_Flop/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Flip_Flop/Flip_Flop.vhd"
entity flip
vsim  +access +r flip   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
