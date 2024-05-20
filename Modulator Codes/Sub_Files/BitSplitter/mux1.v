module mux1(
    input a,b,s,
    output ot
    );
    assign ot=s?b:a;
endmodule
