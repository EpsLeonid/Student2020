//-----------------------------------------------------------------------------
// Title       : rom_exp_sig_gen
//-----------------------------------------------------------------------------
// File        : rom_exp_sig_gen.sv
// Company     : INP SB RAS
// Created     : 03/11/2014
// Created by  : Alina Ivanova
//-----------------------------------------------------------------------------
// Description : rom_exp_sig_gen
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
module rom_exp_sig_gen (
//-----------------------------------------------------------------------------
// Input Ports
//-----------------------------------------------------------------------------
	input  wire                                              clk,
	input  wire                                              reset,
//-----------------------------------------------------------------------------
	input  wire [SIZE_TEST_RAM_ADDR-1:0]                     address,
//-----------------------------------------------------------------------------
// Output Ports
//-----------------------------------------------------------------------------
	output reg  [SIZE_ADC_DATA-1:0]                          output_data);
//-----------------------------------------------------------------------------
// Signal declarations
//-----------------------------------------------------------------------------
	reg         [SIZE_ADC_DATA-1:0]                          q;
//-----------------------------------------------------------------------------
// Process Section
//-----------------------------------------------------------------------------
	always @ (negedge reset or posedge clk)
	begin: ROM_EXP_SIG_GEN_OUTPUT_DATA
		if (!reset)
		begin
			output_data                                       <= 0;
		end
		else
		begin
			case (address)
				0 : output_data                                  <= 14'd0;
				1 : output_data                                  <= 14'd0;
				2 : output_data                                  <= 14'd0;
				3 : output_data                                  <= 14'd1221;
				4 : output_data                                  <= 14'd2147;
				5 : output_data                                  <= 14'd2836;
				6 : output_data                                  <= 14'd3334;
				7 : output_data                                  <= 14'd3681;
				8 : output_data                                  <= 14'd3907;
				9 : output_data                                  <= 14'd4039;
				10 : output_data                                  <= 14'd4095;
				11 : output_data                                  <= 14'd4093;
				12 : output_data                                  <= 14'd4047;
				13 : output_data                                  <= 14'd3967;
				14 : output_data                                  <= 14'd3862;
				15 : output_data                                  <= 14'd3739;
				16 : output_data                                  <= 14'd3603;
				17 : output_data                                  <= 14'd3459;
				18 : output_data                                  <= 14'd3311;
				19 : output_data                                  <= 14'd3160;
				20 : output_data                                  <= 14'd3009;
				21 : output_data                                  <= 14'd2860;
				22 : output_data                                  <= 14'd2714;
				23 : output_data                                  <= 14'd2572;
				24 : output_data                                  <= 14'd2435;
				25 : output_data                                  <= 14'd2302;
				26 : output_data                                  <= 14'd2175;
				27 : output_data                                  <= 14'd2053;
				28 : output_data                                  <= 14'd1937;
				29 : output_data                                  <= 14'd1826;
				30 : output_data                                  <= 14'd1721;
				31 : output_data                                  <= 14'd1621;
				32 : output_data                                  <= 14'd1527;
				33 : output_data                                  <= 14'd1437;
				34 : output_data                                  <= 14'd1353;
				35 : output_data                                  <= 14'd1273;
				36 : output_data                                  <= 14'd1197;
				37 : output_data                                  <= 14'd1126;
				38 : output_data                                  <= 14'd1059;
				39 : output_data                                  <= 14'd996;
				40 : output_data                                  <= 14'd936;
				41 : output_data                                  <= 14'd880;
				42 : output_data                                  <= 14'd827;
				43 : output_data                                  <= 14'd778;
				44 : output_data                                  <= 14'd731;
				45 : output_data                                  <= 14'd687;
				46 : output_data                                  <= 14'd645;
				47 : output_data                                  <= 14'd607;
				48 : output_data                                  <= 14'd570;
				49 : output_data                                  <= 14'd536;
				50 : output_data                                  <= 14'd503;
				51 : output_data                                  <= 14'd473;
				52 : output_data                                  <= 14'd444;
				53 : output_data                                  <= 14'd417;
				54 : output_data                                  <= 14'd392;
				55 : output_data                                  <= 14'd368;
				56 : output_data                                  <= 14'd346;
				57 : output_data                                  <= 14'd325;
				58 : output_data                                  <= 14'd305;
				59 : output_data                                  <= 14'd287;
				60 : output_data                                  <= 14'd270;
				61 : output_data                                  <= 14'd253;
				62 : output_data                                  <= 14'd238;
				63 : output_data                                  <= 14'd224;
				64 : output_data                                  <= 14'd210;
				65 : output_data                                  <= 14'd197;
				66 : output_data                                  <= 14'd185;
				67 : output_data                                  <= 14'd174;
				68 : output_data                                  <= 14'd164;
				69 : output_data                                  <= 14'd154;
				70 : output_data                                  <= 14'd144;
				71 : output_data                                  <= 14'd136;
				72 : output_data                                  <= 14'd127;
				73 : output_data                                  <= 14'd120;
				74 : output_data                                  <= 14'd112;
				75 : output_data                                  <= 14'd106;
				76 : output_data                                  <= 14'd99;
				77 : output_data                                  <= 14'd93;
				78 : output_data                                  <= 14'd88;
				79 : output_data                                  <= 14'd82;
				80 : output_data                                  <= 14'd77;
				81 : output_data                                  <= 14'd73;
				82 : output_data                                  <= 14'd68;
				83 : output_data                                  <= 14'd64;
				84 : output_data                                  <= 14'd60;
				85 : output_data                                  <= 14'd57;
				86 : output_data                                  <= 14'd53;
				87 : output_data                                  <= 14'd50;
				88 : output_data                                  <= 14'd47;
				89 : output_data                                  <= 14'd44;
				90 : output_data                                  <= 14'd41;
				91 : output_data                                  <= 14'd39;
				92 : output_data                                  <= 14'd36;
				93 : output_data                                  <= 14'd34;
				94 : output_data                                  <= 14'd32;
				95 : output_data                                  <= 14'd30;
				96 : output_data                                  <= 14'd28;
				97 : output_data                                  <= 14'd27;
				98 : output_data                                  <= 14'd25;
				99 : output_data                                  <= 14'd24;
				100 : output_data                                  <= 14'd22;
				101 : output_data                                  <= 14'd21;
				102 : output_data                                  <= 14'd20;
				103 : output_data                                  <= 14'd18;
				104 : output_data                                  <= 14'd17;
				105 : output_data                                  <= 14'd16;
				106 : output_data                                  <= 14'd15;
				107 : output_data                                  <= 14'd14;
				108 : output_data                                  <= 14'd13;
				109 : output_data                                  <= 14'd13;
				110 : output_data                                  <= 14'd12;
				111 : output_data                                  <= 14'd11;
				112 : output_data                                  <= 14'd10;
				113 : output_data                                  <= 14'd10;
				114 : output_data                                  <= 14'd9;
				115 : output_data                                  <= 14'd9;
				116 : output_data                                  <= 14'd8;
				117 : output_data                                  <= 14'd8;
				118 : output_data                                  <= 14'd7;
				119 : output_data                                  <= 14'd7;
				120 : output_data                                  <= 14'd6;
				121 : output_data                                  <= 14'd6;
				122 : output_data                                  <= 14'd6;
				123 : output_data                                  <= 14'd5;
				124 : output_data                                  <= 14'd5;
				125 : output_data                                  <= 14'd5;
				126 : output_data                                  <= 14'd4;
				127 : output_data                                  <= 14'd4;
				128 : output_data                                  <= 14'd4;
				129 : output_data                                  <= 14'd4;
				130 : output_data                                  <= 14'd3;
				131 : output_data                                  <= 14'd3;
				132 : output_data                                  <= 14'd3;
				133 : output_data                                  <= 14'd3;
				134 : output_data                                  <= 14'd3;
				135 : output_data                                  <= 14'd2;
				136 : output_data                                  <= 14'd2;
				137 : output_data                                  <= 14'd2;
				138 : output_data                                  <= 14'd2;
				139 : output_data                                  <= 14'd2;
				140 : output_data                                  <= 14'd2;
				141 : output_data                                  <= 14'd2;
				142 : output_data                                  <= 14'd2;
				143 : output_data                                  <= 14'd2;
				144 : output_data                                  <= 14'd1;
				145 : output_data                                  <= 14'd1;
				146 : output_data                                  <= 14'd1;
				147 : output_data                                  <= 14'd1;
				148 : output_data                                  <= 14'd1;
				149 : output_data                                  <= 14'd1;
				150 : output_data                                  <= 14'd1;
				151 : output_data                                  <= 14'd1;
				152 : output_data                                  <= 14'd1;
				153 : output_data                                  <= 14'd1;
				154 : output_data                                  <= 14'd1;
				155 : output_data                                  <= 14'd1;
				156 : output_data                                  <= 14'd1;
				157 : output_data                                  <= 14'd1;
				158 : output_data                                  <= 14'd1;
				159 : output_data                                  <= 14'd1;
				160 : output_data                                  <= 14'd1;
				161 : output_data                                  <= 14'd0;
				162 : output_data                                  <= 14'd0;
				163 : output_data                                  <= 14'd0;
				164 : output_data                                  <= 14'd0;
				165 : output_data                                  <= 14'd0;
				166 : output_data                                  <= 14'd0;
				167 : output_data                                  <= 14'd0;
				168 : output_data                                  <= 14'd0;
				169 : output_data                                  <= 14'd0;
				170 : output_data                                  <= 14'd0;
				171 : output_data                                  <= 14'd0;
				172 : output_data                                  <= 14'd0;
				173 : output_data                                  <= 14'd0;
				174 : output_data                                  <= 14'd0;
				175 : output_data                                  <= 14'd0;
				176 : output_data                                  <= 14'd0;
				177 : output_data                                  <= 14'd0;
				178 : output_data                                  <= 14'd0;
				179 : output_data                                  <= 14'd0;
				180 : output_data                                  <= 14'd0;
				181 : output_data                                  <= 14'd0;
				182 : output_data                                  <= 14'd0;
				183 : output_data                                  <= 14'd0;
				184 : output_data                                  <= 14'd0;
				185 : output_data                                  <= 14'd0;
				186 : output_data                                  <= 14'd0;
				187 : output_data                                  <= 14'd0;
				188 : output_data                                  <= 14'd0;
				189 : output_data                                  <= 14'd0;
				190 : output_data                                  <= 14'd0;
				191 : output_data                                  <= 14'd0;
				192 : output_data                                  <= 14'd0;
				193 : output_data                                  <= 14'd0;
				194 : output_data                                  <= 14'd0;
				195 : output_data                                  <= 14'd0;
				196 : output_data                                  <= 14'd0;
				197 : output_data                                  <= 14'd0;
				198 : output_data                                  <= 14'd0;
				199 : output_data                                  <= 14'd0;
				200 : output_data                                  <= 14'd0;
				201 : output_data                                  <= 14'd0;
				202 : output_data                                  <= 14'd0;
				203 : output_data                                  <= 14'd0;
				204 : output_data                                  <= 14'd0;
				205 : output_data                                  <= 14'd0;
				206 : output_data                                  <= 14'd0;
				207 : output_data                                  <= 14'd0;
				208 : output_data                                  <= 14'd0;
				209 : output_data                                  <= 14'd0;
				210 : output_data                                  <= 14'd0;
				211 : output_data                                  <= 14'd0;
				212 : output_data                                  <= 14'd0;
				213 : output_data                                  <= 14'd0;
				214 : output_data                                  <= 14'd0;
				215 : output_data                                  <= 14'd0;
				216 : output_data                                  <= 14'd0;
				217 : output_data                                  <= 14'd0;
				218 : output_data                                  <= 14'd0;
				219 : output_data                                  <= 14'd0;
				220 : output_data                                  <= 14'd0;
				221 : output_data                                  <= 14'd0;
				222 : output_data                                  <= 14'd0;
				223 : output_data                                  <= 14'd0;
				224 : output_data                                  <= 14'd0;
				225 : output_data                                  <= 14'd0;
				226 : output_data                                  <= 14'd0;
				227 : output_data                                  <= 14'd0;
				228 : output_data                                  <= 14'd0;
				229 : output_data                                  <= 14'd0;
				230 : output_data                                  <= 14'd0;
				231 : output_data                                  <= 14'd0;
				232 : output_data                                  <= 14'd0;
				233 : output_data                                  <= 14'd0;
				234 : output_data                                  <= 14'd0;
				235 : output_data                                  <= 14'd0;
				236 : output_data                                  <= 14'd0;
				237 : output_data                                  <= 14'd0;
				238 : output_data                                  <= 14'd0;
				239 : output_data                                  <= 14'd0;
				240 : output_data                                  <= 14'd0;
				241 : output_data                                  <= 14'd0;
				242 : output_data                                  <= 14'd0;
				243 : output_data                                  <= 14'd0;
				244 : output_data                                  <= 14'd0;
				245 : output_data                                  <= 14'd0;
				246 : output_data                                  <= 14'd0;
				247 : output_data                                  <= 14'd0;
				248 : output_data                                  <= 14'd0;
				249 : output_data                                  <= 14'd0;
				250 : output_data                                  <= 14'd0;
				251 : output_data                                  <= 14'd0;
				252 : output_data                                  <= 14'd0;
				253 : output_data                                  <= 14'd0;
				254 : output_data                                  <= 14'd0;
				255 : output_data                                  <= 14'd0;
				256 : output_data                                  <= 14'd0;
				257 : output_data                                  <= 14'd0;
				258 : output_data                                  <= 14'd0;
				259 : output_data                                  <= 14'd0;
				260 : output_data                                  <= 14'd0;
				261 : output_data                                  <= 14'd0;
				262 : output_data                                  <= 14'd0;
				263 : output_data                                  <= 14'd0;
				264 : output_data                                  <= 14'd0;
				265 : output_data                                  <= 14'd0;
				266 : output_data                                  <= 14'd0;
				267 : output_data                                  <= 14'd0;
				268 : output_data                                  <= 14'd0;
				269 : output_data                                  <= 14'd0;
				270 : output_data                                  <= 14'd0;
				271 : output_data                                  <= 14'd0;
				272 : output_data                                  <= 14'd0;
				273 : output_data                                  <= 14'd0;
				274 : output_data                                  <= 14'd0;
				275 : output_data                                  <= 14'd0;
				276 : output_data                                  <= 14'd0;
				277 : output_data                                  <= 14'd0;
				278 : output_data                                  <= 14'd0;
				279 : output_data                                  <= 14'd0;
				280 : output_data                                  <= 14'd0;
				281 : output_data                                  <= 14'd0;
				282 : output_data                                  <= 14'd0;
				283 : output_data                                  <= 14'd0;
				284 : output_data                                  <= 14'd0;
				285 : output_data                                  <= 14'd0;
				286 : output_data                                  <= 14'd0;
				287 : output_data                                  <= 14'd0;
				288 : output_data                                  <= 14'd0;
				289 : output_data                                  <= 14'd0;
				290 : output_data                                  <= 14'd0;
				291 : output_data                                  <= 14'd0;
				292 : output_data                                  <= 14'd0;
				293 : output_data                                  <= 14'd0;
				294 : output_data                                  <= 14'd0;
				295 : output_data                                  <= 14'd0;
				296 : output_data                                  <= 14'd0;
				297 : output_data                                  <= 14'd0;
				298 : output_data                                  <= 14'd0;
				299 : output_data                                  <= 14'd0;
				300 : output_data                                  <= 14'd0;
				default: output_data                               <= 14'd0;
			endcase;
		end
	end
//-----------------------------------------------------------------------------
endmodule
