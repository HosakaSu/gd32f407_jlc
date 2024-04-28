CMAKE_MINIMUM_REQUIRED(VERSION 3.10)

SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m4)
#SET(CMAKE_VERBOSE_MAKEFILE ON)

SET(CMAKE_EXPORT_COMPILE_COMMANDS ON)
SET(CMAKE_C_COMPILER arm-none-eabi-gcc)
SET(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
SET(CMAKE_C_FLAGS " -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -Dgcc -O0 -gdwarf-2 -g")
SET(CMAKE_ASM_FLAGS " -c -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -x assembler-with-cpp -Wa,-mimplicit-it=thumb  -gdwarf-2")
SET(CMAKE_C_COMPILER_WORKS TRUE)

SET(CMAKE_CXX_COMPILER arm-none-eabi-g++)
SET(CMAKE_CXX_FLAGS " -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -Dgcc -O0 -gdwarf-2 -g")
SET(CMAKE_CXX_COMPILER_WORKS TRUE)

SET(CMAKE_OBJCOPY arm-none-eabi-objcopy)
SET(CMAKE_SIZE arm-none-eabi-size)

SET(CMAKE_EXE_LINKER_FLAGS " -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -ffunction-sections -fdata-sections -DGD32F407 -Wl,--gc-sections,-Map=rtthread.map,-cref,-u,Reset_Handler -T ${CMAKE_SOURCE_DIR}/board/linker_scripts/link.ld")

SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_C_STANDARD 11)

SET(LIBRARY_PATH ${CMAKE_SOURCE_DIR}/libraries)
SET(BSP_PATH ${CMAKE_SOURCE_DIR}/bsp)
SET(MODULE_PATH ${CMAKE_SOURCE_DIR}/module)
PROJECT(rtthread C CXX ASM)
INCLUDE_DIRECTORIES(
		app
		bsp
		board
		${BSP_PATH}/led
		${BSP_PATH}/uart
		${LIBRARY_PATH}/CMSIS
		${LIBRARY_PATH}/CMSIS/GD/GD32F4xx/Include
		${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Include
		${LIBRARY_PATH}/GD32F4xx_Firmware_Library/CMSIS/GD/GD32F4xx/Include
		${MODULE_PATH}/soft_timer
		${MODULE_PATH}/ringbuffer
		${MODULE_PATH}/buzzer
)

ADD_DEFINITIONS(
	-DGD32F407
	-DUSE_STDPERIPH_DRIVER
)

#SET(PROJECT_SOURCES
#	app/main.c
#	board/board.c
#	${LIBRARY_PATH}/CMSIS/GD/GD32F4xx/Source/system_gd32f4xx.c
#	${LIBRARY_PATH}/CMSIS/GD/GD32F4xx/Source/GCC/startup_gd32f4xx.s
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_timer.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_i2c.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_dma.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_syscfg.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_sdio.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_exti.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_gpio.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_rcu.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_misc.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_usart.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_spi.c
#	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_adc.c
#	${BSP_PATH}/led/bsp_led.c
#	${BSP_PATH}/uart/bsp_uart.c
#	${MODULE_PATH}/soft_timer/soft_timer.c
#	${MODULE_PATH}/ringbuffer/ringbuffer.c
#)

SET(BLINK_FILES
	app/blink/main.c
	board/board.c
	${LIBRARY_PATH}/CMSIS/GD/GD32F4xx/Source/system_gd32f4xx.c
	${LIBRARY_PATH}/CMSIS/GD/GD32F4xx/Source/GCC/startup_gd32f4xx.s
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_timer.c
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_syscfg.c
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_gpio.c
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_rcu.c
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_misc.c
	${LIBRARY_PATH}/GD32F4xx_standard_peripheral/Source/gd32f4xx_usart.c
	${BSP_PATH}/led/bsp_led.c
	${BSP_PATH}/uart/bsp_uart.c
	${MODULE_PATH}/soft_timer/soft_timer.c
)

LINK_DIRECTORIES(
)

LINK_LIBRARIES(
	c
	m
)

set(blink blink)
ADD_EXECUTABLE(blink.elf ${BLINK_FILES})

# 将elf文件转hex和bin
add_custom_command(
    TARGET  ${blink}.elf
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${blink}.elf ${blink}.hex)
add_custom_command(
    TARGET  ${blink}.elf
    POST_BUILD COMMAND ${CMAKE_OBJCOPY} -O binary ${blink}.elf ${blink}.bin)

# 显示代码段大小
add_custom_command(
    TARGET  ${blink}.elf
    POST_BUILD COMMAND ${CMAKE_SIZE}  ${blink}.elf )
set(COMMON_FLAGS "-specs=nosys.specs -specs=nano.specs -u _printf_float ")
