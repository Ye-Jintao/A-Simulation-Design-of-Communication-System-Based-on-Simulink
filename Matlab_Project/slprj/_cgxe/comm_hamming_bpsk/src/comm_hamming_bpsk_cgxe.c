/* Include files */

#include "comm_hamming_bpsk_cgxe.h"
#include "m_851jh8nPggcIvVOvUibpmH.h"

unsigned int cgxe_comm_hamming_bpsk_method_dispatcher(SimStruct* S, int_T method,
  void* data)
{
  if (ssGetChecksum0(S) == 252320374 &&
      ssGetChecksum1(S) == 1048908191 &&
      ssGetChecksum2(S) == 1884970083 &&
      ssGetChecksum3(S) == 1706593567) {
    method_dispatcher_851jh8nPggcIvVOvUibpmH(S, method, data);
    return 1;
  }

  return 0;
}
