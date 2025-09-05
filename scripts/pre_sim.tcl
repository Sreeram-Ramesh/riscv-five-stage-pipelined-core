# Copy all .hex files from the project's imported location to the local sim directory.
file copy -force [glob *.srcs/sim_1/imports/hex/*.hex] ./
