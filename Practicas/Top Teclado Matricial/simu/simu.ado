setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/simu/simu.adf"]} { 
	design create simu "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/simu"
cd "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/cont_16.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top BCD to 7Seg/dec_7_seg.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/reg_4b.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/clock_div.vhd"
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Oscilador/oscilador_ejemplo.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/debounce.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/decoder_1_4.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/mux_4_1.vhd"
addfile "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/Top_Teclado.vhd"
vlib "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/simu/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/cont_16.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top BCD to 7Seg/dec_7_seg.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/reg_4b.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/clock_div.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Oscilador/oscilador_ejemplo.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/debounce.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/decoder_1_4.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/mux_4_1.vhd"
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/Top_Teclado.vhd"
entity top
vsim  +access +r top   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
