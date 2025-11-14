# FPGA Project Documentation

## Introduction 
This document is intended to provide a comprehensive overview of our project's developments and serve as a reference tool for new members joining our team.

This report serves two primary functions:

1. **Project Review:** The document provides details on our established objectives, achievements, encountered challenges, key learnings, and prospective future plans. This reflective evaluation allows our team to track progress, make necessary adjustments, and maintain a clear vision moving forward.  
2. **New Member Orientation:** The report also serves as a detailed onboarding guide designed to assist new members in understanding the project's context, objectives, and intricacies. We intend this guide to expedite the acclimatization process and equip newcomers with the necessary knowledge to contribute effectively in the forthcoming semester.

## About the Project

* Project Title: FPGA Highway Traffic Controller  
* Project Purpose: To familiarize students with the SystemVerilog HDL, Digital Circuits, and Digital System Design  
* Brief Description: The project consists of a visual representation of the traffic lights at a road junction between a highway and a farm road.  
* Contributors Involved:  
  * Sam Mansouri  
  * Idika Kontu   
* Git Repo Link: https://github.com/TBC-Projects/FPGAHighway

## Accomplishments

* Deliverables: FPGA-Controlled LED array  
* Outcome: Currently Testing

## Challenges Faced

* Farm Road is infinitely looping when sensor is active  
  * Create a long timer, “L” that prioritizes Highway until it has elapsed.  
  * Use intermediary logic variables with the clock to extend the duration.  
  * There may be timed elements of differing durations in a circuit. Use alternating logic variables to artificially “extend” the clock time to slow down variables.  
* Syntactical errors with Verilog code  
  * If/else branches can only have conditional arguments after an “if” or “else if” statement, otherwise Quartus will not synthesize  
  * Do not attempt to add conditional logic to else branches   
* Modelsim Testbench only outputs “1” when sensor is “ON”  
* Intersection is stuck in the “red light” state  
  * Ensure the DFF has a ps \<= ns statement  
* After making changes, contributors had a difficult time merging changes  
  * Ensure contributors have core competency with Git version control  
* Lost access to DE1\_SOC at the end of the quarter  
  * Build future FPGA projects on the Arty FPGA platform purchased by The Boring Club

## Potential Improvements

* Run the logic on Arty FPGA  
* Have a greater variety of time lengths (checks, transitions, green lights, red lights, etc.)

## Relevant Resources \[\*\*IMPORTANT\]**

* Software Tools:  
  * GitHub: Git-based configuration management  
    * [https://github.com/TBC-Projects/FPGAHighway](https://github.com/TBC-Projects/FPGAHighway)  
  * Quartus: HDL development, verification, and FPGA interface  
  * ModelSim: Validation testing  
* Hardware Tools:  
  * DE1\_SoC FPGA Board  
  * 16x16 LED Array  
* Key files:  
  * intersection.sv \- Highway intersection module  
  * DE1\_SoC.sv \- Top-level board interfacing module  
  * runlab.do \- Validation testing configuration  
* Languages:  
  * SystemVerilog \- HDL used for Digital System Design  
* State Machine:

## Other Information

* Abbreviations  
  * HDL \- Hardware Description Language  
  * FPGA \- Field Programmable Gate Array  
  * LED \- Light Emitting Diode  
* Team Roles  
  * Sam Mansouri  
    * Advisor  
  * Idika Kontu  
    * Lead Concept Engineer  
  * Cliff Pham  
    * Lead Design Engineer  
  * Zach Yuen  
    * Lead Test Engineer  
  * Sujith Kadagandla  
    * In Training  
  * Adelin Ma  
  * Nicolas Berredo  
    * Trainee  
  * Aashish Kumar  
    * In Training
  
## Directions for setup

* _UW Students ONLY, Credit Prof. Scott Hauck for Quartus Resources_

1. [Download Quartus](https://class.ece.uw.edu/271/hauck2/software/)
2. [Setup Quartus](https://class.ece.uw.edu/271/hauck2/labs/Quartus%20Tutorial.pdf)
3. Download and unpack zip file
   - Replace any updated project files with ones found in repository. So far this includes:
      - `intersection.sv`
      - `DE1_SoC.sv`
4. Upload project to DE1_SoC board
