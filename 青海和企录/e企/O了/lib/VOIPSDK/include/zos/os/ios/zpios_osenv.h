/************************************************************************

        Copyright (c) 2005-2010 by Juphoon System Software, Inc.
                       All rights reserved.

     This software is confidential and proprietary to Juphoon System,
     Inc. No part of this software may be reproduced, stored, transmitted,
     disclosed or used in any form or by any means other than as expressly
     provided by the written license agreement between Juphoon and its
     licensee.

     THIS SOFTWARE IS PROVIDED BY JUPHOON "AS IS" AND ANY EXPRESS OR 
     IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
     WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     ARE DISCLAIMED. IN NO EVENT SHALL JUPHOON BE LIABLE FOR ANY DIRECT, 
     INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
     (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS 
     OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
     STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
     IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
     POSSIBILITY OF SUCH DAMAGE. 

                    Juphoon System Software, Inc.
                    Email: support@juphoon.com
                    Web: http://www.juphoon.com

************************************************************************/
/*************************************************  
  File name     : zpios_osenv.h
  Module        : ios os environment
  Author        : zocol   
  Version       : 0.1   
  Created on    : 2010-02-28    
  Description   :
      included files required by os environment
    
  Modify History:   
  1. Date:        Author:         Modification:
*************************************************/
#ifndef _ZPIOS_OSENV_H__
#define _ZPIOS_OSENV_H__

/** 
 * @file zpios_osenv.h
 * @brief Included and typedefs files required by ios.
 *
 */

/*lint -save -e* */
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <stdarg.h>
#include <time.h>
#include <pthread.h>
#include <netdb.h>
#include <unistd.h>
#include <fcntl.h>
#include <semaphore.h>
#include <errno.h>    
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <net/if.h>
#include <arpa/inet.h>
#include <signal.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <mach/mach_time.h>
#include <dispatch/dispatch.h>
/*lint -restore */

#if UINTPTR_MAX == 0xFFFFFFFF
#undef ZOS_SUPT_64BIT
#elif UINTPTR_MAX == 0xFFFFFFFFFFFFFFFF
#define ZOS_SUPT_64BIT
#endif

/** @{ */
/* zos BSD socket */
#define ZSOCKET_BSD 
/** @} */

/** @{ */
/* zos function type */
#define ZFUNC_EXPORT
#define ZFUNC_IMPORT
#define ZFUNC_NORMAL
#define ZFUNC ZFUNC_NORMAL
/** @} */

/** @{ */
/* ios data type */
typedef double ZDOUBLE;              /**< @brief Type of double. */
typedef float ZFLOAT;                /**< @brief Type of float. */
typedef long long ZLLONG;            /**< @brief Type of long long. */
typedef unsigned long long ZULLONG;  /**< @brief Type of unsigned long long. */
typedef int64_t ZINT64;              /**< @brief Type of long long. */
typedef uint64_t ZUINT64;            /**< @brief Type of unsigned long long. */
typedef long ZLONG;                  /**< @brief Type of long. */
typedef int ZINT;                    /**< @brief Type of int. */
typedef short ZSHORT;                /**< @brief Type of short. */
typedef char ZCHAR;                  /**< @brief Type of char. */
typedef unsigned long ZULONG;        /**< @brief Type of unsigned long. */
typedef unsigned int ZUINT;          /**< @brief Type of unsigned int. */
typedef size_t ZSIZE_T;              /**< @brief Type of unsinged int. */
typedef unsigned short ZUSHORT;      /**< @brief Type of unsinged short. */
typedef unsigned char ZUCHAR;        /**< @brief Type of unsigned char. */
typedef int ZBOOL;                   /**< @brief Type of int. */
typedef void ZVOID;                  /**< @brief Type of void. */
/** @} */

/** @{ */
typedef time_t ZTIME_T;
typedef struct timespec ST_ZOS_TIMESPEC;
typedef struct tm ST_ZOS_TM;    
typedef long long ZHRTIME_T;
/** @} */

/** @{ */
typedef pthread_t ZTHREAD_ID;
/** @} */

/** @{ */
typedef pthread_mutex_t ZMUTEX;
typedef pthread_rwlock_t ZSHAREX;
typedef dispatch_semaphore_t ZSEM;
/** @} */

/** @{ */
#if defined(ZOS_SUPT_IOS_NS) /* support NSStream network */
typedef ZVOID * ZSOCKET;
#define ZSOCKET_INVALID 0
#else
typedef int ZSOCKET;
#define ZSOCKET_INVALID (-1)
#endif
/** @} */

/** @{ */
/* variable argument list */
typedef va_list ZVA_LIST;
/** @} */
 
/** @{ */
/* variable argument list macro definitions */
#define ZOS_VA_START(_ap, _last) va_start(_ap, _last)
#define ZOS_VA_END(_ap)          va_end(_ap)
#define ZOS_VA_ARG(_ap, _type)   va_arg(_ap, _type)
/** @} */

#endif /* _ZPIOS_OSENV_H__ */

