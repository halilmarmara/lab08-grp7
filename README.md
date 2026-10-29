# Multiplexers and Demultiplexers

In this lab you have learned about multiplexers and demultiplexers.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

## Summary
In this lab, we worked with combinational logic and learned about multiplexers (MUX) and demultiplexers (DEMUX) using Verilog. We designed a 4-bit 4-to-1 multiplexer using chained ternary operators to select data from four distinct 4-bit input sources. Next, we created a 4-bit 1-to-4 demultiplexer to route the incoming data stream to one of four destinations. We then connected both components together in a top-level module, routing the output of the multiplexer directly into the input of the demultiplexer. Finally, we assigned the inputs, select lines (pushbuttons), and outputs to the Basys3 FPGA board using the constraints file and verified the full system functionality on hardware.
## Lab Questions

### In plain English describe the function and use of a multiplexer.
A multiplexer (MUX) acts as a digitally controlled switch or data selector. It takes multiple data inputs and routes a single selected input to a single output line based on control signals called select bits.
### In plain English describe the function and use of a demultiplexer.
A demultiplexer (DEMUX) operates in reverse of a multiplexer as a data distributor. It takes a single data input and routes it to one of several possible output lines depending on the state of the select bits
### What other uses might these circuits have? (Think Shannon’s)
Beyond data routing, multiplexers can function as universal logic generators to implement any Boolean function without needing standard logic gates. Based on Shannon’s Expansion Theorem, any Boolean function F can be decomposed relative to a variable A as:
F = A · F_A + A' · F_A'
Because a multiplexer naturally evaluates this exact logic structure (Y=Sel⋅B+Sel′⋅A), a 2^N-to-1 MUX can evaluate any arbitrary Boolean function of N+1 variables by wiring the select lines to control inputs and tying data pins to 0, 1, or the remaining variable.
