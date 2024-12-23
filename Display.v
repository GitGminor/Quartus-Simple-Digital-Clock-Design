module Display(AI, BI, CI, DI, a, b, c, d, e, f, g, enable);
    input AI, BI, CI, DI; // 数码管输入二进制位
    input enable; // 控制按钮输入，1表示正常工作，0表示关闭状态
    output a, b, c, d, e, f, g; // 数码管各段输出	 
    reg a, b, c, d, e, f, g;

    always @ (AI, BI, CI, DI, enable) begin
        if (enable == 1'b1) begin
            case ({DI, CI, BI, AI}) // 共阳极数码管十进制顺序输入二进制数
                4'b0000: {a, b, c, d, e, f, g} <= 7'b0000001;
                4'b0001: {a, b, c, d, e, f, g} <= 7'b1001111;
                4'b0010: {a, b, c, d, e, f, g} <= 7'b0010010;
                4'b0011: {a, b, c, d, e, f, g} <= 7'b0000110;
                4'b0100: {a, b, c, d, e, f, g} <= 7'b1001100;
                4'b0101: {a, b, c, d, e, f, g} <= 7'b0100100;
                4'b0110: {a, b, c, d, e, f, g} <= 7'b0100000;
                4'b0111: {a, b, c, d, e, f, g} <= 7'b0001111;
                4'b1000: {a, b, c, d, e, f, g} <= 7'b0000000;
                4'b1001: {a, b, c, d, e, f, g} <= 7'b0000100;
                default: {a, b, c, d, e, f, g} <= 7'b1111110; // 没有输出时间的部分只输出g（即横杠）
            endcase
        end
        else begin
            // 当enable为0，关闭数码管，所有段输出高电平（共阳极数码管特性）
            {a, b, c, d, e, f, g} <= 7'b1111111;
        end
    end
endmodule
