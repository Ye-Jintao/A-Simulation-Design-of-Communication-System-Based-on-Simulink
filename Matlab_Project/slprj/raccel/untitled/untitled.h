#ifndef untitled_h_
#define untitled_h_
#ifndef untitled_COMMON_INCLUDES_
#define untitled_COMMON_INCLUDES_
#include <stdlib.h>
#include <time.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "untitled_types.h"
#include "rtGetNaN.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME untitled
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (0) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (0)   
#elif NCSTATES != 0
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { l2q35aauwd lzwrkqqe0k ; real_T iae0l0pdjm ; real_T
b3tagn5fsk ; mnnrtn1mkp e1vrwt3qqq ; struct { void * AQHandles ; } hnt4imdtqa
; struct { void * AQHandles ; } po0pdxdgkd ; struct { void * AQHandles ; }
gvslfjsjx0 ; int32_T flju23kmxl ; int32_T doihgcsjev ; uint32_T b5rzolsg0z ;
uint32_T fkyjiibvlk ; uint32_T og3obillin [ 625 ] ; uint32_T j1rid3gqtn [ 2 ]
; uint32_T iojd1h1ocp ; uint32_T bp1x0ojpwu ; uint32_T jbqbcmzgkd ; uint32_T
cfynmaumdf [ 625 ] ; uint32_T ejzv3oxuvz [ 2 ] ; uint32_T i1benfafve ;
uint32_T ligyqpmozz ; uint32_T buk5wggwzm [ 2 ] ; uint8_T lv1etmcrao ;
boolean_T hub4gy0yxk [ 4 ] ; boolean_T l1v5zeml4o ; boolean_T hlfeowbagb ;
boolean_T i0dsnykkk5 ; boolean_T kpms0csrsm ; boolean_T c1mwhlxjkx ;
boolean_T dc4uf2fl3i ; boolean_T evp3fsmjzo ; boolean_T cqyjscfxwz ;
boolean_T kbrslmyprs ; boolean_T blkdbbwzul ; boolean_T cfd5iay225 ;
boolean_T kf1p55aogw ; boolean_T aa2yzknpgo ; boolean_T jqn3nxj1h5 ; } DW ;
typedef struct { real_T a0krn0dswh [ 4 ] ; } ConstP ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { uint32_T
Extractlastbit_BitMask ; uint32_T Extractlastbit_BitMask_aqrtnlaurj ;
uint32_T Extractlastbit1_BitMask ; real_T AWGNChannel_SNR ; real_T
AWGNChannel_SignalPower ; boolean_T CombinatorialLogic1_table [ 56 ] ;
uint8_T Gain_Gain [ 28 ] ; uint8_T Gain_Gain_lpxwuyfxn3 [ 21 ] ; } ; extern
const char_T * RT_MEMORY_ALLOCATION_ERROR ; extern DW rtDW ; extern P rtP ;
extern const ConstP rtConstP ; extern mxArray * mr_untitled_GetDWork ( ) ;
extern void mr_untitled_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_untitled_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * untitled_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ; extern
rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid )
; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T
tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
