lappend auto_path "C:/lscc/diamond/3.11_x64/data/script"
package require simulation_generation
set ::bali::simulation::Para(PROJECT) {simu}
set ::bali::simulation::Para(PROJECTPATH) {D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial}
set ::bali::simulation::Para(FILELIST) {"D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/cont_16.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top BCD to 7Seg/dec_7_seg.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/reg_4b.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/clock_div.vhd" "D:/Semestre 2-2020/DSD/Ejercicios/Oscilador/oscilador_ejemplo.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/debounce.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/decoder_1_4.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/mux_4_1.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Teclado Matricial/Top_Teclado.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none" "none" "none" "none" "none" "none" "none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" "work" "work" "work" "work" "work" "work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_machxo2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {top}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {1}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ActiveHDL_Run
