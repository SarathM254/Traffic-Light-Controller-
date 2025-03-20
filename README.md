# Traffic-Light-Controller 🚦

A Traffic Light Controller is a digital circuit that manages traffic signals at an intersection. It ensures smooth traffic flow and minimizes congestion by controlling when vehicles and pedestrians can move. This project implements a finite state machine (FSM)-based traffic light system using Verilog HDL (Hardware Description Language).

#  Working Principle

The Traffic Light Controller operates using a state machine with multiple states representing different traffic light conditions. It cycles through these states based on an external input (X), which could represent a pedestrian crossing request or a sensor detecting approaching vehicles.

Finite State Machine (FSM) Design
The controller follows a sequence of traffic light transitions:

State S0:  Highway road (HW) → Green, Common road (CR) → Red

State S1:  Highway road (HW) → Yellow, Common road (CR) → Red

State S2:  Both roads → Red (transition state, ensures double safety) 

State S3:  Highway road (HW) → Red, Common road (CR) → Green

State S4:  Highway road (HW) → Red, Common road (CR) → Yellow

##  How to Run the Simulation

### Open the Terminal & Type the following 
```sh
cd C:\iverilog\bin
iverilog -o TrafficLightController_tb.vvp TrafficLightController_tb.v TrafficLightController.v
vvp TrafficLightController_tb.vvp
gtkwave idonnofile12.vcd

