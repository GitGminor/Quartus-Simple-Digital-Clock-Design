module TimeChange(Choose,ia1,ia2,ia3,ia4,ib1,ib2,ib3,ib4,o1,o2,o3,o4);
	input Choose,ia1,ia2,ia3,ia4,ib1,ib2,ib3,ib4;
	output o1,o2,o3,o4;
	reg o1,o2,o3,o4;
	always@(Choose,ia1,ia2,ia3,ia4,ib1,ib2,ib3,ib4)
		case(Choose)
		1'b0:begin//当choose为0时，输出信号为正常的时钟信号
		o1<=ia1;
		o2<=ia2;
		o3<=ia3;
		o4<=ia4;
		end
		1'b1:begin//当choose为1时，输出信号更改为手动的进位信号
		o1<=ib1;
		o2<=ib2;
		o3<=ib3;
		o4<=ib4;
		end
	endcase
endmodule
