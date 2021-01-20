setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2/cont_sinc_27412/cont_sinc_27412.adf"]} { 
	design create cont_sinc_27412 "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2/cont_sinc_27412"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2/cont_sinc_27412.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2/cont_sinc_27412/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Contador Sincrono 2_7_4_1_2/cont_sinc_27412.vhd"
entity contador
vsim  +access +r contador   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
