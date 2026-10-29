module mux4_4bit(
    input  [3:0] A, B, C, D,
    input  [1:0] Sel,
    input        Enable,
    output [3:0] Y
);
    assign Y = !Enable      ? 4'b0 :
               Sel == 2'b00 ? A :
               Sel == 2'b01 ? B :
               Sel == 2'b10 ? C : D;
endmodule

module demux4_4bit(
    input  [3:0] In,
    input  [1:0] Sel,
    input        Enable,
    output [3:0] Y0, Y1, Y2, Y3
);
    assign Y0 = (Enable && Sel == 2'b00) ? In : 4'b0;
    assign Y1 = (Enable && Sel == 2'b01) ? In : 4'b0;
    assign Y2 = (Enable && Sel == 2'b10) ? In : 4'b0;
    assign Y3 = (Enable && Sel == 2'b11) ? In : 4'b0;
endmodule

module top(
    input  [15:0] sw,
    input  btnL, btnU, btnD, btnR, btnC,
    output [15:0] led
);
    wire [3:0] internet_line;

    mux4_4bit mux (
        .A(sw[3:0]),     // CEO
        .B(sw[7:4]),     // Me
        .C(sw[11:8]),    // Fred
        .D(sw[15:12]),   // Jill
        .Sel({btnU, btnL}),   // btnU = Sel[1], btnL = Sel[0]
        .Enable(btnC),
        .Y(internet_line)
    );

    demux4_4bit demux (
        .In(internet_line),
        .Sel({btnR, btnD}),   // btnR = Sel[1], btnD = Sel[0]
        .Enable(btnC),
        .Y0(led[3:0]),        // local_lib
        .Y1(led[7:4]),        // fire department
        .Y2(led[11:8]),       // school
        .Y3(led[15:12])       // rib shack
    );
endmodule