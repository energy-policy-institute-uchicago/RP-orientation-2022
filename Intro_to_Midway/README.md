This folder contains introduction to Midway2 materials.

For running parallel jobs, 

- `hello.jl` prints out message "Hello, world!" and the first argument passed in from running the script.

- `julia.sbath` submits a bash job to Slurm. 
`#SBATCH --array=1-10:1` defines the the first argument passed into the Julia script.
The 10 jobs will be running parallelly on Midway2 nodes.

- `*.out` files record the outputs produced by the program.
