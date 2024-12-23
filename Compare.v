module Compare(
    input [7:0] num1, num2, num3,  // 第一组三个8位二进制输入
    input [7:0] num4, num5, num6,  // 第二组三个8位二进制输入
    output reg equal               // 输出信号，相等为1，不等为0
);

    wire [23:0] sum1;  // 用于组合第一组三个8位数的连线
    wire [23:0] sum2;  // 用于组合第二组三个8位数的连线

    assign sum1 = {num1, num2, num3};  // 拼接第一组三个8位二进制数
    assign sum2 = {num4, num5, num6};  // 拼接第二组三个8位二进制数

    always @(*) begin
        if (sum1 == sum2)
            equal = 1'b1;
        else
            equal = 1'b0;
    end

endmodule
