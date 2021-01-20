setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/clock_999/clock_999.adf"]} { 
	design create clock_999 "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/clock_999"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/clock_div_28.vhd"
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Oscilador/oscilador_ejemplo.vhd"
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/bin_bcd.vhd"
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/mux11_3.vhd"
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/dec_7_seg.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/clock_999/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/clock_div_28.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Oscilador/oscilador_ejemplo.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/bin_bcd.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/mux11_3.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Top BCD to 7Seg/dec_7_seg.vhd"
entity clk_div
vsim  +access +r clk_div   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
