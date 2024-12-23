module Timebar(
    input wire clk,              // 1Hz时钟信号
    input wire [7:0] hour,        // 当前小时值输入
    input wire equal,            // 新增输入信号，用于额外的判断条件
    output reg hour_changed       // 小时数改变时输出高电平信号
);

reg [7:0] prev_hour;
reg [2:0] counter;

// 检测小时数是否改变
always @(posedge clk) begin
    if ((hour!= prev_hour) || equal) begin  // 修改此处，加入equal的判断逻辑
        hour_changed <= 1'b1;
        prev_hour <= hour;
        counter <= 0;
    end else if (hour_changed && counter <= 2'b11) begin
        counter <= counter + 1;
    end else
        hour_changed <= 1'b0;
end

endmodule
