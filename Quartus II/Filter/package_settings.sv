//-----------------------------------------------------------------------------
// Title       : package_settings (top level)
//-----------------------------------------------------------------------------
// File        : package_settings.sv
// Company     : INP SB RAS
// Created     : 03/11/2014
// Created by  : Leonid Epshteyn
//-----------------------------------------------------------------------------
// Description : Package of settings
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
package package_settings;
//-----------------------------------------------------------------------------
// Parameter Declaration(s)
//-----------------------------------------------------------------------------
	parameter SIZE_ADC_DATA                                  = 14;
	parameter SIZE_FILTER_DATA                               = 16;
	parameter SIZE_DELAY                                     = 7;
	parameter DELAY_DATA                                     = 14;
	parameter SIZE_TEST_COUNTER                              = 16;
	parameter SIZE_TEST_RAM_ADDR                             = 7;
//-----------------------------------------------------------------------------
endpackage