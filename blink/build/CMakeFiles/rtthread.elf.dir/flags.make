# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.29

# compile ASM with C:/Program Files (x86)/Arm GNU Toolchain arm-none-eabi/13.2 Rel1/bin/arm-none-eabi-gcc.exe
# compile C with C:/Program Files (x86)/Arm GNU Toolchain arm-none-eabi/13.2 Rel1/bin/arm-none-eabi-gcc.exe
ASM_DEFINES = -DGD32F407 -DUSE_STDPERIPH_DRIVER

ASM_INCLUDES = -IC:\Users\liucj\Documents\gd32f407\blink\app -IC:\Users\liucj\Documents\gd32f407\blink\bsp -IC:\Users\liucj\Documents\gd32f407\blink\board -IC:\Users\liucj\Documents\gd32f407\blink\bsp\led -IC:\Users\liucj\Documents\gd32f407\blink\bsp\uart -IC:\Users\liucj\Documents\gd32f407\blink\libraries\CMSIS -IC:\Users\liucj\Documents\gd32f407\blink\libraries\CMSIS\GD\GD32F4xx\Include -IC:\Users\liucj\Documents\gd32f407\blink\libraries\GD32F4xx_standard_peripheral\Include -IC:\Users\liucj\Documents\gd32f407\blink\libraries\GD32F4xx_Firmware_Library\CMSIS\GD\GD32F4xx\Include -IC:\Users\liucj\Documents\gd32f407\blink\module\soft_timer -IC:\Users\liucj\Documents\gd32f407\blink\module\ringbuffer -IC:\Users\liucj\Documents\gd32f407\blink\module\buzzer

ASM_FLAGS =  -c -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -x assembler-with-cpp -Wa,-mimplicit-it=thumb  -gdwarf-2

C_DEFINES = -DGD32F407 -DUSE_STDPERIPH_DRIVER

C_INCLUDES = -IC:\Users\liucj\Documents\gd32f407\blink\app -IC:\Users\liucj\Documents\gd32f407\blink\bsp -IC:\Users\liucj\Documents\gd32f407\blink\board -IC:\Users\liucj\Documents\gd32f407\blink\bsp\led -IC:\Users\liucj\Documents\gd32f407\blink\bsp\uart -IC:\Users\liucj\Documents\gd32f407\blink\libraries\CMSIS -IC:\Users\liucj\Documents\gd32f407\blink\libraries\CMSIS\GD\GD32F4xx\Include -IC:\Users\liucj\Documents\gd32f407\blink\libraries\GD32F4xx_standard_peripheral\Include -IC:\Users\liucj\Documents\gd32f407\blink\libraries\GD32F4xx_Firmware_Library\CMSIS\GD\GD32F4xx\Include -IC:\Users\liucj\Documents\gd32f407\blink\module\soft_timer -IC:\Users\liucj\Documents\gd32f407\blink\module\ringbuffer -IC:\Users\liucj\Documents\gd32f407\blink\module\buzzer

C_FLAGS =  -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -Dgcc -O0 -gdwarf-2 -g -std=gnu11

