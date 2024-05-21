`timescale 1ns / 1ps


module fsm_vend_mach(

        input quarter_btn, dime_btn, confirm_btn, clk, reset, quarter_uart, confirm_uart, dime_uart,
        input [2:0] select_switch,
        output reg [2:0] state,
        output reg [8:0] balance,
        output reg color_flag, seven_seg_enb, give_change
        
    );
    
    parameter WaitSel = 0;
    parameter SetBal = 1;
    parameter WaitPay = 2;
    parameter GotQuarter = 3;
    parameter GotDime = 4;
    parameter Dispensing = 5;
    parameter Reset_Delay = 6;
    parameter Change_Return = 7;
    
    
    reg [2:0]next_state;
    wire [2:0] item_sel;
    reg [8:0] next_balance;
    wire [8:0]item_cost;
    reg delay_enb, delay_reset;
    wire delay_pulse;
    
    assign item_sel = select_switch;
    
    five_sec_delay fsd_0 (
    
        .clk(clk),
        .enable(delay_enb),
        .reset(delay_reset),
        .pulse(delay_pulse)
    );
    
    
    item_cost ic1 (
    
        .item_sel(item_sel),
        .item_cost(item_cost)
    
    );
    
    always @(posedge clk)
    begin
        if (reset)
            state <= WaitSel;
        else
        begin
        state <= next_state;
        balance <= next_balance;
        end
    end
    
    always @(*)
    begin
        case(state)        
            0: color_flag = 0;
            1: color_flag = 0;
            2: color_flag = 0;
            3: color_flag = 0;
            4: color_flag = 0;
            5: color_flag = 1;
            6: color_flag = 0;
            7: color_flag = 0;
        endcase   
    end
    
    
    always @(*)
    begin
        case(state)       
            0: seven_seg_enb = 1;
            1: seven_seg_enb = 1;
            2: seven_seg_enb = 1;
            3: seven_seg_enb = 1;
            4: seven_seg_enb = 1;
            5: seven_seg_enb = 0;
            6: seven_seg_enb = 1;
            7: seven_seg_enb = 1;
        endcase 
    end   
    
    always @(*)
    begin
        case(state)        
            0: give_change = 0;
            1: give_change = 0;
            2: give_change = 0;
            3: give_change = 0;
            4: give_change = 0;
            5: give_change = 0;
            6: give_change = 0;
            7: give_change = 1;
        endcase   
    end
     
    always @(*) 
    begin
        
        next_state = state;
        next_balance = balance;
        
        case(state)
        
            WaitSel:
            begin
                delay_enb = 0;
                delay_reset = 0;
                next_balance = { 6'b000000, select_switch}; 
                
                if (confirm_btn | confirm_uart)
                    next_state = SetBal;     
                         
            end
            
            SetBal:
            begin
                delay_enb = 0;
                delay_reset = 0;
                next_balance = item_cost;
                next_state = WaitPay;
                
            end 
                
                 
            WaitPay:
            begin
                delay_enb = 0;
                delay_reset = 1;
                             
                if (balance == 0 || balance[8] == 1)
                    next_state = Dispensing;
                else if(quarter_btn | quarter_uart)
                    next_state = GotQuarter;
                else if (dime_btn | dime_uart)
                    next_state = GotDime;
                 
            end
            
            GotQuarter:
            begin
                delay_enb = 0;
                delay_reset = 1;
                next_balance = next_balance - 25;
                next_state = WaitPay;         
            end
            
            GotDime:
            begin
                delay_enb = 0;
                delay_reset = 1;
                next_balance = next_balance - 10;
                next_state = WaitPay;
            
            end
            
            Dispensing:
            begin
                delay_enb = 1;
                delay_reset = 0;
                
                if (balance[8])
                    next_balance = ~next_balance + 1;          
          
                if(delay_pulse)
                    next_state = Reset_Delay;
            
            end
            
            Reset_Delay:
            begin
                delay_enb = 0;
                delay_reset = 1;
                next_state = Change_Return;
            
            end
            
            Change_Return:
            begin
                delay_reset = 0;
                delay_enb = 1;
                if(delay_pulse)
                    next_state = WaitSel;
            
            end
            
        
        
        endcase
    
    end
    
    
endmodule