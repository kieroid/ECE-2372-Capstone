# ECE 2372: Modern Digital System Design Capstone

## Overview
This repository contains the code to the verilog project, as well as the images and video evidence of the work we have already done.

Hardware Project Criteria: [here](https://links.shellfish.racing/-WPqNnPAbBD)

Software Project Criteria: [here](https://links.shellfish.racing/-6WxszyVYi7)

## Repository Layout

Here is the layout of the project:
```text
ECE 2372 CAPSTONE
──────────────────
├── README.md              <- readme file
├── verilog                <- verilog project
│   ├── waveform/          <- folder containing the waveform graphs
│   ├── inctop.v           <- the final top module of the project
│   └── testbench.v        <- the testbench to the verilog file
└── traffic                <- folder containing all of the files regarding the traffic light
    ├── photos/            <- photos
    ├── k_maps/            <- k maps, including the templates
    ├── circuitjs.txt      <- circuitjs circuit (https://www.falstad.com/circuit/circuitjs.html)
    └── traffic_light.vcb  <- visual circuit board circuit
```
## Traffic Project
Traffic lights gif:

![visual circuit board](traffic/photos/circuit_2.gif?raw=true "vcb")

Traffic lights gif 2:

![irl photo](traffic/photos/circuit_3.gif?raw=true "real")


## Verilog Project
Verilog Graphviz Graph: [here](https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0A%20%20%20%20rankdir%20%3D%20TB%0A%20%20%20%20ranksep%20%3D%20%221%22%0A%20%20%20%20nodesep%20%3D%20%221%22%0A%20%20%20%20pad%20%3D%20%221%22%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_inputs%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%22Inputs%22%3B%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20input_v1%20%5Blabel%20%3D%20%22increment%20display%201%22%5D%3B%0A%20%20%20%20%20%20%20%20input_v2%20%5Blabel%20%3D%20%22increment%20display%202%22%5D%3B%0A%20%20%20%20%20%20%20%20input_v3%20%5Blabel%20%3D%20%22reset%22%5D%3B%0A%20%20%20%20%20%20%20%20input_v4%20%5Blabel%20%3D%20%22set%22%5D%3B%0A%20%20%20%20%20%20%20%20input_v5%20%5Blabel%20%3D%20%22sign%22%5D%3B%0A%20%20%20%20%7D%0A%20%20%20%20%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_outputs%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%22Outputs%22%3B%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20output_v1%20%5Blabel%20%3D%20%227%20seg%20display%201%22%5D%3B%0A%20%20%20%20%20%20%20%20output_v2%20%5Blabel%20%3D%20%227%20seg%20display%202%22%5D%3B%0A%20%20%20%20%20%20%20%20output_v3%20%5Blabel%20%3D%20%22add%2Fsubtract%22%5D%3B%0A%20%20%20%20%20%20%20%20output_v4%20%5Blabel%20%3D%20%22product%20sign%22%5D%0A%20%20%20%20%7D%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_top_module%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%22Top%20Module%22%3B%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20vt1%20%5Blabel%20%3D%20%22wire%5Cnnum_1%5Cn(first%20number)%22%5D%3B%0A%20%20%20%20%20%20%20%20vt2%20%5Blabel%20%3D%20%22wire%5Cnnum_2%5Cn(second%20number)%22%5D%3B%0A%20%20%20%20%20%20%20%20vt3%20%5Blabel%20%3D%20%22wire%5Cnprod%5Cn(product)%22%5D%3B%0A%20%20%20%20%20%20%20%20vt4%20%5Blabel%20%3D%20%22set%22%5D%3B%0A%20%20%20%20%20%20%20%20vt5%20%5Blabel%20%3D%20%22sign%22%5D%3B%0A%20%20%20%20%20%20%20%20vt6%20%5Blabel%20%3D%20%22inc_up%22%5D%3B%0A%20%20%20%20%20%20%20%20vt7%20%5Blabel%20%3D%20%22inc_down%22%5D%3B%0A%20%20%20%20%20%20%20%20vt8%20%5Blabel%20%3D%20%22reset%22%5D%3B%0A%20%20%20%20%7D%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_increment%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%22Increment%20Module%22%3B%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20vi1%20%5Blabel%20%3D%20%22incrementer%22%5D%3B%0A%20%20%20%20%7D%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_add_sub%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%22Adder%20Subtractor%20Module%22%3B%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20va1%20%5Blabel%20%3D%20%22ripple%20carry%20adder%22%5D%3B%0A%20%20%20%20%7D%0A%20%20%20%20%0A%20%20%20%20subgraph%20cluster_segment%20%7B%0A%20%20%20%20%20%20%20%20node%20%5Bshape%20%3D%20record%5D%3B%0A%20%20%20%20%20%20%20%20label%20%3D%20%227%20Segment%20Module%22%0A%20%20%20%20%20%20%20%20%0A%20%20%20%20%20%20%20%20vs1%20%5Blabel%20%3D%20%22display%201%22%5D%3B%0A%20%20%20%20%20%20%20%20vs2%20%5Blabel%20%3D%20%22display%202%22%5D%3B%0A%20%20%20%20%7D%0A%20%20%20%20%2F%2Finputs%20to%20to%20top%20module%0A%20%20%20%20input_v1%20-%3E%20vt6%3B%0A%20%20%20%20input_v2%20-%3E%20vt7%3B%0A%20%20%20%20input_v3%20-%3E%20vt8%3B%0A%20%20%20%20input_v4%20-%3E%20vt4%3B%0A%20%20%20%20input_v5%20-%3E%20vt5%3B%0A%20%20%20%20%0A%20%20%20%20%2F%2Ftop%20module%20to%20incrementer%0A%20%20%20%20vt6%20-%3E%20vi1%20-%3E%20vt1%3B%20%2F%2Fincrement%20a%0A%20%20%20%20vt7%20-%3E%20vi1%20-%3E%20vt2%3B%20%2F%2Fincrement%20b%0A%20%20%20%20vt8%20-%3E%20vi1%3B%0A%20%20%20%20%0A%20%20%20%20%0A%20%20%20%20%2F%2Fadder%20subtractor%0A%20%20%20%20vt1%20-%3E%20va1%3B%0A%20%20%20%20vt2%20-%3E%20va1%3B%0A%20%20%20%20vt4%20-%3E%20va1%3B%0A%20%20%20%20vt5%20-%3E%20va1%3B%0A%20%20%20%20va1%20-%3E%20vt3%3B%0A%20%20%20%20%0A%20%20%20%20%2F%2F7%20segment%20display%0A%20%20%20%20vt1%20-%3E%20vs1%3B%0A%20%20%20%20vt2%20-%3E%20vs2%3B%0A%20%20%20%20vt3%20-%3E%20vs1%3B%0A%20%20%20%20vt3%20-%3E%20vs2%3B%0A%20%20%20%20%0A%20%20%20%20%2F%2Foutputs%0A%20%20%20%20vs1%20-%3E%20output_v1%3B%0A%20%20%20%20vs2%20-%3E%20output_v2%3B%0A%20%20%20%20vt3%20-%3E%20output_v1%3B%0A%20%20%20%20vt3%20-%3E%20output_v2%3B%0A%20%20%20%20vt3%20-%3E%20output_v4%3B%0A%20%20%20%20vt5%20-%3E%20output_v3%3B%0A%7D)

Final waveform:
![final waveform](verilog/waveform/waveform_5.png?raw=true "verilog")
