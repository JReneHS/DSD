lappend auto_path "C:/lscc/diamond/3.12/data/script"
package require simulation_generation
set ::bali::simulation::Para(DEVICEFAMILYNAME) {MachXO2}
set ::bali::simulation::Para(PROJECT) {cerradura_binaria}
set ::bali::simulation::Para(PROJECTPATH) {D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria}
set ::bali::simulation::Para(FILELIST) {"D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria/clk_div.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria/oscilador.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria/detector_secuencia.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria/eliminador_rebotes_pulso.vhd" "D:/Semestre 2-2020/DSD/Practicas/Top Cerradura Binaria/top_det_sec.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none" "none" "none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" "work" "work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" "VHDL" "VHDL" "VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_machxo2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {det_sec}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(INSTALLATIONPATH) {C:/lscc/diamond/3.12}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {1}
set ::bali::simulation::Para(RUNSIMULATION)  {1}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ModelSim_Run
