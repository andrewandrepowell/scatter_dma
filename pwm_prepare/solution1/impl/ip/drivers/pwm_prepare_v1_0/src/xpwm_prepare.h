// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XPWM_PREPARE_H
#define XPWM_PREPARE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpwm_prepare_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_axil_BaseAddress;
} XPwm_prepare_Config;
#endif

typedef struct {
    u32 Control_axil_BaseAddress;
    u32 IsReady;
} XPwm_prepare;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPwm_prepare_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPwm_prepare_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPwm_prepare_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPwm_prepare_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPwm_prepare_Initialize(XPwm_prepare *InstancePtr, u16 DeviceId);
XPwm_prepare_Config* XPwm_prepare_LookupConfig(u16 DeviceId);
int XPwm_prepare_CfgInitialize(XPwm_prepare *InstancePtr, XPwm_prepare_Config *ConfigPtr);
#else
int XPwm_prepare_Initialize(XPwm_prepare *InstancePtr, const char* InstanceName);
int XPwm_prepare_Release(XPwm_prepare *InstancePtr);
#endif

void XPwm_prepare_Start(XPwm_prepare *InstancePtr);
u32 XPwm_prepare_IsDone(XPwm_prepare *InstancePtr);
u32 XPwm_prepare_IsIdle(XPwm_prepare *InstancePtr);
u32 XPwm_prepare_IsReady(XPwm_prepare *InstancePtr);
void XPwm_prepare_EnableAutoRestart(XPwm_prepare *InstancePtr);
void XPwm_prepare_DisableAutoRestart(XPwm_prepare *InstancePtr);

void XPwm_prepare_Set_shift_val(XPwm_prepare *InstancePtr, u32 Data);
u32 XPwm_prepare_Get_shift_val(XPwm_prepare *InstancePtr);
void XPwm_prepare_Set_sum_val(XPwm_prepare *InstancePtr, u32 Data);
u32 XPwm_prepare_Get_sum_val(XPwm_prepare *InstancePtr);
void XPwm_prepare_Set_enable_flag(XPwm_prepare *InstancePtr, u32 Data);
u32 XPwm_prepare_Get_enable_flag(XPwm_prepare *InstancePtr);

void XPwm_prepare_InterruptGlobalEnable(XPwm_prepare *InstancePtr);
void XPwm_prepare_InterruptGlobalDisable(XPwm_prepare *InstancePtr);
void XPwm_prepare_InterruptEnable(XPwm_prepare *InstancePtr, u32 Mask);
void XPwm_prepare_InterruptDisable(XPwm_prepare *InstancePtr, u32 Mask);
void XPwm_prepare_InterruptClear(XPwm_prepare *InstancePtr, u32 Mask);
u32 XPwm_prepare_InterruptGetEnabled(XPwm_prepare *InstancePtr);
u32 XPwm_prepare_InterruptGetStatus(XPwm_prepare *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif