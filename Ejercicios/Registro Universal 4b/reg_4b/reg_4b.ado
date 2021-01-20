setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b/reg_4b/reg_4b.adf"]} { 
	design create reg_4b "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b"
  set newDesign 1
}
design open "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b/reg_4b"
cd "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b/reg_u_4b.vhd"
vlib "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b/reg_4b/work"
set worklib work
adel -all
vcom -dbg -work work "D:/Semestre 2-2020/DSD/Ejercicios/Registro Universal 4b/reg_u_4b.vhd"
entity reg
vsim  +access +r reg   -PL pmi_work -L ovi_machxo2
add wave *
run 1000ns
