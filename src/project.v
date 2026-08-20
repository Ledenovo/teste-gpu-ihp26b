/*
 * Copyright (c) 2026 Seu Nome / Sock
 * SP-DX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Entradas dedicadas
    output wire [7:0] uo_out,   // Saídas dedicadas
    input  wire [7:0] uio_in,   // Pinos bidirecionais (Entrada)
    output wire [7:0] uio_out,  // Pinos bidirecionais (Saída)
    output wire [7:0] uio_oe,   // Pinos bidirecionais (Habilitação)
    input  wire       ena,      // Habilita o chip (always 1 no teste)
    input  wire       clk,      // Clock do sistema
    input  wire       rst_n     // Reset ativo em nível baixo
);

    // Desativa saídas bidirecionais não utilizadas
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Lógica simples de teste:
    // Soma as duas metades da entrada ui_in (Ex: 4 bits + 4 bits)
    // E altera o resultado com base no sinal de clock/reset
    reg [7:0] result_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_reg <= 8'b0;
        end else if (ena) begin
            result_reg <= ui_in[3:0] + ui_in[7:4];
        end
    end

    assign uo_out = result_reg;

endmodule
