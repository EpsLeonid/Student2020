//-----------------------------------------------------------------------------
// Title       : exp_sig_gen
//-----------------------------------------------------------------------------
// File        : exp_sig_gen.sv
// Company     : INP SB RAS
// Created     : 03/11/2017
// Created by  : Leonid Epshteyn
//-----------------------------------------------------------------------------
// Description : exp_sig_gen
//-----------------------------------------------------------------------------
// Revision    : 1.0
//-----------------------------------------------------------------------------
// Copyright (c) 2014 INP SB RAS
// This work may not be copied, modified, re-published, uploaded, executed, or
// distributed in any way, in any medium, whether in whole or in part, without
// prior written permission from INP SB RAS.
//-----------------------------------------------------------------------------
// list of modules
//-----------------------------------------------------------------------------
/* ram_exp_sig_gen,
 * rom_exp_sig_gen*/
//-----------------------------------------------------------------------------
module exp_sig_gen (
//-----------------------------------------------------------------------------
// Input Ports
//-----------------------------------------------------------------------------
	input  wire                                              clk,
	input  wire                                              reset,
//-----------------------------------------------------------------------------
	input  wire                                              overlay,
	input  wire                                              rate,
	input  wire [SIZE_DELAY-1:0]                             delay,
//-----------------------------------------------------------------------------
// Output Ports
//-----------------------------------------------------------------------------
	output wire [SIZE_ADC_DATA-1:0]                          output_data);
//-----------------------------------------------------------------------------
// Signal declarations
//-----------------------------------------------------------------------------
	wire        [SIZE_ADC_DATA-1:0]                          rom_data_out;
	wire        [SIZE_ADC_DATA-1:0]                          ram1_q;
	reg         [SIZE_ADC_DATA-1:0]                          data_ram2;
	wire        [SIZE_ADC_DATA-1:0]                          ram2_q;
	reg         [SIZE_DELAY-1:0]                             ram_addr;

	reg         [SIZE_ADC_DATA-1:0]                          dataShift;
	reg         [SIZE_TEST_COUNTER-1:0]                      rm_addr;
	reg         [SIZE_ADC_DATA-1:0]                          dataOverlay;
	reg         [SIZE_ADC_DATA-1:0]                          data_last;
	wire                                                     reset_ram;

	reg         [SIZE_ADC_DATA-1:0]                          adder_1;
	reg         [SIZE_ADC_DATA-1:0]                          adder_2;
	reg         [SIZE_ADC_DATA-1:0]                          result_add_1;
	reg         [SIZE_ADC_DATA-1:0]                          result_add_2;
//-----------------------------------------------------------------------------
// Sub Module Section
//-----------------------------------------------------------------------------
	rom_exp_sig_gen RomExpSigGen (
		.clk                                                 (clk),
		.reset                                               (reset),
		.address                                             (rm_addr[SIZE_TEST_RAM_ADDR-1:0]),
		.output_data                                         (rom_data_out));
//-----------------------------------------------------------------------------
	ram_exp_sig_gen RamExpSigGen1 (
		.aclr                                                (reset_ram),
		.clock                                               (clk),
		.data                                                (dataShift),
		.rdaddress                                           (ram_addr),
		.rden                                                (1),
		.wraddress                                           (rm_addr[SIZE_DELAY-1:0]),
		.wren                                                (1),
		.q                                                   (ram1_q));
//-----------------------------------------------------------------------------
	ram_exp_sig_gen RamExpSigGen2 (
		.aclr                                                (reset_ram),
		.clock                                               (clk),
		.data                                                (data_ram2),
		.rdaddress                                           (ram_addr),
		.rden                                                (1),
		.wraddress                                           (rm_addr[SIZE_DELAY-1:0]),
		.wren                                                (1),
		.q                                                   (ram2_q));
//-----------------------------------------------------------------------------
// Signal Section
//-----------------------------------------------------------------------------
	assign output_data                                       = data_last;
	assign reset_ram                                         = ~reset;
//-----------------------------------------------------------------------------
// Process Section
//-----------------------------------------------------------------------------
	always @ (negedge overlay or posedge clk)
	begin
		if (!overlay)
		begin
			result_add_1                                    <= 0;
			result_add_2                                    <= 0;
		end
		else
		begin
			result_add_1                                    <= adder_1 + adder_2;
			result_add_2                                    <= result_add_1 + dataShift;
		end
	end
//-----------------------------------------------------------------------------
	always @ (negedge reset or posedge clk)
	begin
		if (!reset)
		begin
			dataShift                                        <= 0;
			rm_addr                                          <= 0;
			dataOverlay                                      <= 0;
			data_last                                        <= 0;
			ram_addr                                         <= 0;
			data_ram2                                        <= 0;
			adder_1                                          <= 0;
			adder_2                                          <= 0;
		end
		else
		begin
			adder_1                                          <= {2'b0, ram1_q[SIZE_ADC_DATA-1: 2]};
			adder_2                                          <= {3'b0, ram2_q[SIZE_ADC_DATA-1: 3]};
			rm_addr                                          <= rm_addr + 16'd1;
			if (rm_addr[SIZE_DELAY-1:0] < delay + 3)
			begin
				ram_addr                                     <= 0;
				data_ram2                                    <= 0;
			end
			else if(rm_addr[SIZE_DELAY-1:0] >= delay + 3)
			begin
				ram_addr                                     <= (rm_addr[SIZE_DELAY-1:0] - delay);
				data_ram2                                    <= ram1_q;
			end
			if (rate)
			begin
				case(rm_addr[10:7])
					 0: dataShift                            <= rom_data_out[SIZE_ADC_DATA-1:0];
					 1: dataShift                            <= {1'b0, rom_data_out[SIZE_ADC_DATA-1:1]};
					 2: dataShift                            <= {2'b0, rom_data_out[SIZE_ADC_DATA-1:2]};
					 3: dataShift                            <= {3'b0, rom_data_out[SIZE_ADC_DATA-1:3]};
					 4: dataShift                            <= {4'b0, rom_data_out[SIZE_ADC_DATA-1:4]};
					 5: dataShift                            <= {5'b0, rom_data_out[SIZE_ADC_DATA-1:5]};
					 6: dataShift                            <= {6'b0, rom_data_out[SIZE_ADC_DATA-1:6]};
					 7: dataShift                            <= {7'b0, rom_data_out[SIZE_ADC_DATA-1:7]};
					 8: dataShift                            <= {7'b0, rom_data_out[SIZE_ADC_DATA-1:7]};
					 9: dataShift                            <= {6'b0, rom_data_out[SIZE_ADC_DATA-1:6]};
					10: dataShift                            <= {5'b0, rom_data_out[SIZE_ADC_DATA-1:5]};
					11: dataShift                            <= {4'b0, rom_data_out[SIZE_ADC_DATA-1:4]};
					12: dataShift                            <= {3'b0, rom_data_out[SIZE_ADC_DATA-1:3]};
					13: dataShift                            <= {2'b0, rom_data_out[SIZE_ADC_DATA-1:2]};
					14: dataShift                            <= {1'b0, rom_data_out[SIZE_ADC_DATA-1:1]};
					15: dataShift                            <= rom_data_out[SIZE_ADC_DATA-1:0];
					default: dataShift                       <= rom_data_out[SIZE_ADC_DATA-1:0];
				endcase
			end
			else
				dataShift                                    <= rom_data_out;
			if (overlay)
			begin
				if (rm_addr[SIZE_DELAY-1:0] <= delay)
					dataOverlay                              <= dataShift;
				else if (rm_addr[SIZE_DELAY-1:0] > delay)
					dataOverlay                              <= result_add_2;
			end
			else
				dataOverlay                                  <= dataShift;
			data_last                                        <= dataOverlay;
		end
	end
endmodule

