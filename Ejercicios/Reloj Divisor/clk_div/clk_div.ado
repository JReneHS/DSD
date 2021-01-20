setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div/clk_div.adf"]} { 
	design create clk_div "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div.vhd"
entity clk_div
vsim  +access +r clk_div   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
