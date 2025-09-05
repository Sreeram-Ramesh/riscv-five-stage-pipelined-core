set project_name "riscv_five_stage_pipelined_core"
set part_name "xc7z020clg400-1"
set top_module "pl_riscv_cpu"
set testbench_module "pl_riscv_cpu_tb"

# Creating the project in a build directory
create_project ${project_name} -part ${part_name}

# Adding the source rtl files
add_files -norecurse [glob ../rtl/*.v]

# Adding the testbench
add_files -fileset sim_1 -norecurse [glob ../tb/*.v]

# Adding the hex files to the simulation set
add_files -fileset sim_1 -norecurse [glob ../hex/*.hex]

# Setting up the hex file to be copied to the simulation directory before running the simulation
# Ensuring Verilog's `$readmemh("your_hex_file.hex")` call will always find the file
set_property xsim.compile.tcl.pre ./scripts/pre_sim.tcl [get_filesets sim_1]

# Setting the top module for both the synthesis and simulation
set_property top ${top_module} [get_filesets sources_1]
set_property top ${testbench_module} [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Setting the simulation time to 1000ms
set_property -name {xsim.simulate.runtime} -value {2000ms} -objects [get_filesets sim_1]

puts "INFO: Project '${project_name}' created and configured successfully."
puts "INFO: To run simulation, open the project in the GUI and run Behavioral Simulation."
