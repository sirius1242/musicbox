## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict { PACKAGE_PIN B8   IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
#set_property -dict { PACKAGE_PIN P15  IOSTANDARD LVCMOS33 } [get_ports { CLK20MHZ }]; 
#set_property -dict { PACKAGE_PIN C11  IOSTANDARD LVCMOS33 } [get_ports { nRESET }]; 

##Switches

set_property -dict { PACKAGE_PIN D4   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]; 
set_property -dict { PACKAGE_PIN F3   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]; 
set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]; 
set_property -dict { PACKAGE_PIN H4   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]; 
set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports { SW[4] }]; 
set_property -dict { PACKAGE_PIN T10  IOSTANDARD LVCMOS33 } [get_ports { SW[5] }]; 
set_property -dict { PACKAGE_PIN R10  IOSTANDARD LVCMOS33 } [get_ports { SW[6] }]; 
set_property -dict { PACKAGE_PIN R11  IOSTANDARD LVCMOS33 } [get_ports { SW[7] }]; 
set_property -dict { PACKAGE_PIN T16  IOSTANDARD LVCMOS33 } [get_ports { SW[8] }]; 
set_property -dict { PACKAGE_PIN M16  IOSTANDARD LVCMOS33 } [get_ports { SW[9] }]; 
set_property -dict { PACKAGE_PIN J14  IOSTANDARD LVCMOS33 } [get_ports { SW[10] }];
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { SW[11] }];
set_property -dict { PACKAGE_PIN G16  IOSTANDARD LVCMOS33 } [get_ports { SW[12] }];
set_property -dict { PACKAGE_PIN F16  IOSTANDARD LVCMOS33 } [get_ports { SW[13] }];
set_property -dict { PACKAGE_PIN E16  IOSTANDARD LVCMOS33 } [get_ports { SW[14] }];
set_property -dict { PACKAGE_PIN E15  IOSTANDARD LVCMOS33 } [get_ports { SW[15] }];


##Buttons

#set_property -dict { PACKAGE_PIN    IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }]; 

set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { left }]; 
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { mode }]; 
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { play }]; 
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { rst_n }]; 
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { right }]; 

## LEDs

set_property -dict { PACKAGE_PIN C4   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; 
set_property -dict { PACKAGE_PIN D3   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; 
set_property -dict { PACKAGE_PIN G4   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; 
set_property -dict { PACKAGE_PIN D5   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; 
set_property -dict { PACKAGE_PIN J4   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; 
set_property -dict { PACKAGE_PIN J5   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; 
set_property -dict { PACKAGE_PIN T9   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; 
set_property -dict { PACKAGE_PIN T11  IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; 
set_property -dict { PACKAGE_PIN R12  IOSTANDARD LVCMOS33 } [get_ports { LED[8] }]; 
set_property -dict { PACKAGE_PIN N15  IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]; 
set_property -dict { PACKAGE_PIN K16  IOSTANDARD LVCMOS33 } [get_ports { LED[10] }];
set_property -dict { PACKAGE_PIN H16  IOSTANDARD LVCMOS33 } [get_ports { LED[11] }];
set_property -dict { PACKAGE_PIN H15  IOSTANDARD LVCMOS33 } [get_ports { LED[12] }];
set_property -dict { PACKAGE_PIN G13  IOSTANDARD LVCMOS33 } [get_ports { LED[13] }];
set_property -dict { PACKAGE_PIN F15  IOSTANDARD LVCMOS33 } [get_ports { LED[14] }];
set_property -dict { PACKAGE_PIN C16  IOSTANDARD LVCMOS33 } [get_ports { LED[15] }];

## RGB_LEDs
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { en }]; 
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { en_2 }]; 
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { uart_test }]; 

set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { electone}]; 
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { music_box }]; 
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { writing }]; 

##7 segment display

set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { segment[0] }]; 
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { segment[1] }]; 
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { segment[2] }]; 
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { segment[3] }]; 
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { segment[4] }]; 
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { segment[5] }]; 
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { segment[6] }]; 
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { DP }]; 

set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { sel[0] }]; 
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { sel[1] }]; 
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { sel[2] }]; 



##VGA Connector

#set_property -dict { PACKAGE_PIN A14    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }]; 
#set_property -dict { PACKAGE_PIN B13    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }]; 
#set_property -dict { PACKAGE_PIN A15    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }]; 
#set_property -dict { PACKAGE_PIN B14    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[3] }]; 

#set_property -dict { PACKAGE_PIN B11    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }]; 
#set_property -dict { PACKAGE_PIN A11    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }]; 
#set_property -dict { PACKAGE_PIN A13    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }]; 
#set_property -dict { PACKAGE_PIN B12    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[3] }]; 

#set_property -dict { PACKAGE_PIN B9     IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }]; 
#set_property -dict { PACKAGE_PIN A8     IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }]; 
#set_property -dict { PACKAGE_PIN A10    IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }]; 
#set_property -dict { PACKAGE_PIN A9     IOSTANDARD LVCMOS33 } [get_ports { VGA_R[3] }]; 

#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }]; 
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }]; 


##Buzzer

set_property -dict { PACKAGE_PIN H17    IOSTANDARD LVCMOS33 } [get_ports { bell }]; 

##Speaker

#set_property -dict { PACKAGE_PIN L15    IOSTANDARD LVCMOS33 } [get_ports { SPK_CLK }]; 
#set_property -dict { PACKAGE_PIN T15    IOSTANDARD LVCMOS33 } [get_ports { SPK_DATA }]; 


##Temperature Sensor

#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { DS18B20 }]; 

##Speaker

#set_property -dict { PACKAGE_PIN L15    IOSTANDARD LVCMOS33 } [get_ports { SPK_CLK }]; 
#set_property -dict { PACKAGE_PIN T15    IOSTANDARD LVCMOS33 } [get_ports { SPK_DATA }]; 

#USB UART

#set_property -dict { PACKAGE_PIN G17    IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];  
set_property -dict { PACKAGE_PIN G18    IOSTANDARD LVCMOS33 } [get_ports { UART_RX }]; 
#  

##Micro SD Connector

#set_property -dict { PACKAGE_PIN J17    IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }];  
#set_property -dict { PACKAGE_PIN P17    IOSTANDARD LVCMOS33 } [get_ports { SD_CD }];     
#set_property -dict { PACKAGE_PIN M17    IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }];    
#set_property -dict { PACKAGE_PIN M18    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }];    
#set_property -dict { PACKAGE_PIN N17    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; 
#set_property -dict { PACKAGE_PIN P18    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; 
#set_property -dict { PACKAGE_PIN J18    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; 
#set_property -dict { PACKAGE_PIN L18    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; 


##Quad SPI Flash

#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]; 
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]; 
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]; 
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]; 
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }];   
#set_property -dict { PACKAGE_PIN E9    IOSTANDARD LVCMOS33 } [get_ports { QSPI_CLK }];   


##NAND Flash

#set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_RY }]; 
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_RE }];
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_CE }];
#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_CLE }];
#set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_ALE }];
#set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_WE }];
#set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[0] }];      
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[1] }];
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[2] }];
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[3] }];
#set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[4] }];
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[5] }];
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[6] }];
#set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { NFLASH_D[7] }];


##DDR3 SDRAM

#set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_OTD      }];
#set_property -dict { PACKAGE_PIN L5   IOSTANDARD LVCMOS15 } [get_ports { DDR3_RESET    }];
#set_property -dict { PACKAGE_PIN U9   IOSTANDARD LVCMOS15 } [get_ports { DDR3_CLK_P    }];
#set_property -dict { PACKAGE_PIN V9   IOSTANDARD LVCMOS15 } [get_ports { DDR3_CLK_N    }];
#set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_CKE      }];
#set_property -dict { PACKAGE_PIN V1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_CS       }];
#set_property -dict { PACKAGE_PIN P2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_RAS      }];
#set_property -dict { PACKAGE_PIN R1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_CAS      }];
#set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_WE       }];
#set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_BA[0]    }];
#set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_BA[1]    }];
#set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_BA[2]    }];
#set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_DQS0_P   }];
#set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_DQS0_N   }];
#set_property -dict { PACKAGE_PIN L6   IOSTANDARD LVCMOS15 } [get_ports { DDR3_DM[0]    }];
#set_property -dict { PACKAGE_PIN U3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[0]     }];
#set_property -dict { PACKAGE_PIN T5   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[1]     }];
#set_property -dict { PACKAGE_PIN N4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[2]     }];
#set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[3]     }];
#set_property -dict { PACKAGE_PIN R5   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[4]     }];
#set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[5]     }];
#set_property -dict { PACKAGE_PIN M6   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[6]     }];
#set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[7]     }];
#set_property -dict { PACKAGE_PIN R6   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[8]     }];
#set_property -dict { PACKAGE_PIN P4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[9]     }];
#set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[10]    }];
#set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[11]    }];
#set_property -dict { PACKAGE_PIN T4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[12]    }];
#set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[13]    }];
#set_property -dict { PACKAGE_PIN N6   IOSTANDARD LVCMOS15 } [get_ports { DDR3_A[14]    }];
#set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[0]     }];
#set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[1]     }];
#set_property -dict { PACKAGE_PIN K5   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[2]     }];
#set_property -dict { PACKAGE_PIN L4   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[3]     }];
#set_property -dict { PACKAGE_PIN L1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[4]     }];
#set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[5]     }];
#set_property -dict { PACKAGE_PIN M3   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[6]     }];
#set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS15 } [get_ports { DDR3_D[7]     }];


##SMSC Ethernet PHY

#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { RMII_MDC }];   
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { RMII_MDIO }];  
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { RMII_RESET }];  
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { RMII_TX_EN }]; 
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { RMII_TXD[0] }]; 
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { RMII_TXD[1] }];
#set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { RMII_RX_CLK }];
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { RMII_RX_DV }];  
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { RMII_RX_D[0] }];
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { RMII_RX_D[1] }];


##STM32

#set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports { STM_PA5 }];
#set_property -dict { PACKAGE_PIN C1   IOSTANDARD LVCMOS33 } [get_ports { STM_SPI_SCK }];
#set_property -dict { PACKAGE_PIN K1   IOSTANDARD LVCMOS33 } [get_ports { STM_SPI_MISO }];
#set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports { STM_SPI_MOSI }];
#set_property -dict { PACKAGE_PIN C9   IOSTANDARD LVCMOS33 } [get_ports { STM_UART_TX }];
#set_property -dict { PACKAGE_PIN E7   IOSTANDARD LVCMOS33 } [get_ports { STM_UART)RX }];
#set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[8] }];
#set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[9] }];
#set_property -dict { PACKAGE_PIN G1   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[10] }];
#set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[11] }];
#set_property -dict { PACKAGE_PIN F1   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[12] }];
#set_property -dict { PACKAGE_PIN E1   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[13] }];
#set_property -dict { PACKAGE_PIN E2   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[14] }];
#set_property -dict { PACKAGE_PIN D2   IOSTANDARD LVCMOS33 } [get_ports { STM_PE[15] }];

##Pmod Headers


##Pmod Header JA

#set_property -dict { PACKAGE_PIN A3   IOSTANDARD LVCMOS33 } [get_ports { PMOD[0] }]; 
#set_property -dict { PACKAGE_PIN A4   IOSTANDARD LVCMOS33 } [get_ports { PMOD[1] }]; 
#set_property -dict { PACKAGE_PIN H5   IOSTANDARD LVCMOS33 } [get_ports { PMOD[2]}];
#set_property -dict { PACKAGE_PIN G6   IOSTANDARD LVCMOS33 } [get_ports { PMOD[3] }]; 
#set_property -dict { PACKAGE_PIN B3   IOSTANDARD LVCMOS33 } [get_ports { PMOD[4] }]; 
#set_property -dict { PACKAGE_PIN B4   IOSTANDARD LVCMOS33 } [get_ports { PMOD[5] }]; 
#set_property -dict { PACKAGE_PIN H6   IOSTANDARD LVCMOS33 } [get_ports { PMOD[6] }]; 
#set_property -dict { PACKAGE_PIN F5   IOSTANDARD LVCMOS33 } [get_ports { PMOD[7] }]; 
#set_property -dict { PACKAGE_PIN C7   IOSTANDARD LVCMOS33 } [get_ports { PMOD[8] }];
#set_property -dict { PACKAGE_PIN D9   IOSTANDARD LVCMOS33 } [get_ports { PMOD[9] }]; 
#set_property -dict { PACKAGE_PIN B1   IOSTANDARD LVCMOS33 } [get_ports { PMOD[10]}];
#set_property -dict { PACKAGE_PIN A1   IOSTANDARD LVCMOS33 } [get_ports { PMOD[11]}];
#set_property -dict { PACKAGE_PIN D7   IOSTANDARD LVCMOS33 } [get_ports { PMOD[12]}];
#set_property -dict { PACKAGE_PIN D8   IOSTANDARD LVCMOS33 } [get_ports { PMOD[13]}];
#set_property -dict { PACKAGE_PIN C2   IOSTANDARD LVCMOS33 } [get_ports { PMOD[14]}];
#set_property -dict { PACKAGE_PIN B2   IOSTANDARD LVCMOS33 } [get_ports { PMOD[15]}];
#set_property -dict { PACKAGE_PIN D10  IOSTANDARD LVCMOS33 } [get_ports { PMOD[16]}];
#set_property -dict { PACKAGE_PIN D12  IOSTANDARD LVCMOS33 } [get_ports { PMOD[17]}];
#set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { PMOD[18]}];
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { PMOD[19]}];
#set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { PMOD[20]}];
#set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { PMOD[21]}];
#set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { PMOD[22]}];
#set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { PMOD[23]}];

#set_property -dict { PACKAGE_PIN C6   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[0]}];
#set_property -dict { PACKAGE_PIN C5   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[1]}];
#set_property -dict { PACKAGE_PIN B7   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[2]}];
#set_property -dict { PACKAGE_PIN B6   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[3]}];
#set_property -dict { PACKAGE_PIN A6   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[4]}];
#set_property -dict { PACKAGE_PIN A5   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[5]}];
#set_property -dict { PACKAGE_PIN E6   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[6]}];
#set_property -dict { PACKAGE_PIN E5   IOSTANDARD LVCMOS33 } [get_ports { XPMOD[7]}]; 



# I/O virtual clock
#create_clock -period 20.000 -name "clk_virt"


# EJTAG virtual clock
#create_clock -name "tck" -period 20.0

# cut all paths to and from "clk_virt", "tck"
#set_clock_groups -physically_exclusive -group "clk_virt"
#set_clock_groups -physically_exclusive -group "tck"

# tsu/th constraints
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {SW[*]}]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {SW[*]}]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports CPU_RESETN]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports CPU_RESETN]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNU]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNU]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[1]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[1]]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[2]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[2]]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[4]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[4]]


#set_output_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {LED[*]}]
#set_output_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {LED[*]}]
#set_output_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {JB[3]}]
#set_output_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {JB[3]}]



