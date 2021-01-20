setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD/bin_bcd/bin_bcd.adf"]} { 
	design create bin_bcd "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD/bin_bcd"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD/bin_BCD.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD/bin_bcd/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Bin_BCD/bin_BCD.vhd"
entity conv
vsim  +access +r conv   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
