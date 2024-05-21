`timescale 1ns / 1ps

module uart_driver(

    input UART_RX, clk, give_change, reset,
    input [11:0] dabbled, 
    output UART_TX, confirm_uart, quarter_uart, dime_uart

    );
    
    wire rx_dv;
    wire [7:0] rx_byte, tx_byte;
    
    wire confirm, quarter, dime, tx_dv, tx_ready, o_tx_done, o_tx_ready;
    
    uart_rx_vlog rx0 (
    
        .i_Clock(clk),
        .i_Rx_Serial(UART_RX),
        .o_Rx_DV(rx_dv),
        .o_Rx_Byte(rx_byte)
    
    );
    
    
    rx_parse rxp0 (
    
        .clk(clk),
        .reset(reset),
        .rx_dv(rx_dv),
        .rx_byte(rx_byte),
        .select_rx(confirm),
        .q25_rx(quarter),
        .d10_rx(dime)
    
    );
    
    assign confirm_uart = confirm;
    assign quarter_uart = quarter;
    assign dime_uart = dime;
    
    assign tx_ready = rx_dv | o_tx_ready;
    
    tx_parse txp0 (
    
        .clk(clk),
        .reset(reset),
        .tx_dv(tx_dv),
        .tx_byte(tx_byte),
        .tx_ready(tx_ready),
        .give_change(give_change),
        .amount_bcd(dabbled)
    
    );
    
    
    uart_tx_vlog tx0 (
        
        .i_Clock(clk),
        .i_Tx_DV(tx_dv),
        .i_Tx_Byte(tx_byte),
        .o_Tx_Serial(UART_TX),
        .o_Tx_Done(o_tx_done),
        .o_Tx_Ready(o_tx_ready)
    
    );
    
    
    
    
endmodule
