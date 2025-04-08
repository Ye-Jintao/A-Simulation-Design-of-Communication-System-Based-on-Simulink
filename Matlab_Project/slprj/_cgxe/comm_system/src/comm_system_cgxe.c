/* Include files */

#include "comm_system_cgxe.h"
#include "m_gA30Cxh29L0kjVl2jnHlRB.h"

unsigned int cgxe_comm_system_method_dispatcher(SimStruct* S, int_T method, void*
  data)
{
  if (ssGetChecksum0(S) == 334426083 &&
      ssGetChecksum1(S) == 2400998025 &&
      ssGetChecksum2(S) == 562369354 &&
      ssGetChecksum3(S) == 2785121401) {
    method_dispatcher_gA30Cxh29L0kjVl2jnHlRB(S, method, data);
    return 1;
  }

  return 0;
}
