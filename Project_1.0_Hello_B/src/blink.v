module blink (
    input wire clk,      // Тактовый сигнал 27 МГц (ножка 52)
    output wire led      // Светодиод LED1 (ножка 10)
);

// Счётчик на 24 бита (2^24 = 16.8 миллионов)
// Тактовая частота 27 МГц → старший бит меняется ~1.6 раза в секунду
reg [23:0] counter = 0;

always @(posedge clk) begin
    counter <= counter + 1;
end

// Берём старший бит счётчика для мигания
assign led = counter[23];

endmodule