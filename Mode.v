module Mode(C,h1,m1,s1,h2,m2,s2,H,M,S);
      input [7:0]h1,m1,s1,h2,m2,s2;
		input C;
		output [7:0]H,M,S;
		reg [7:0]H,M,S;
		always @(h1,m1,s1,h2,m2,s2)
		  case(C)
		  1'b0:begin H<=h1;M<=m1;S<=s1;end
		  1'b1:begin H<=h2;M<=m2;S<=s2;end 
		  endcase
endmodule
