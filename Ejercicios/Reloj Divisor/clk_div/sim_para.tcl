lappend auto_path "C:/lscc/diamond/3.11_x64/data/script"
package require simulation_generation
set ::bali::simulation::Para(PROJECT) {clk_div}
set ::bali::simulation::Para(PROJECTPATH) {D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor}
set ::bali::simulation::Para(FILELIST) {"D:/Semestre 2-2020/DSD/Ejercicios/Reloj Divisor/clk_div.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_machxo2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {clk_div}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {1}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ActiveHDL_Run
