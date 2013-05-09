parent nodes: [ObjC](ObjC.html)\
\

CF Network Errors.h {.heading-level2}
-------------------

/\*

File: CFNetwork/CFNetworkErrors.h\
 \
 Contains: CFNetwork error header\
 \
 Copyright: Copyright (c) 2006-2008, Apple Inc. All rights reserved.\
 \
 Bugs?: For bug reports, consult the following page on

the World Wide Web:\

**/\
 \#ifndef *\_CFNETWORKERRORS\_*\
 \#define *\_CFNETWORKERRORS\_*\
 \
 \#ifndef *\_CFNETWORKDEFS\_*\
 \#include \<CFNetwork/CFNetworkDefs.h\>\
 \#endif\
 \
 \#ifndef *\_CFSTRING\_*\
 \#include \<CoreFoundation/CFString.h\>\
 \#endif\
 \
 \
 \
 \#include \<Availability.h\>\
 \
 \#if PRAGMA\_ONCE\
 \#pragma once\
 \#endif\
 \
 \#ifdef *\_cplusplus\
 extern "C" {\
 \#endif\
 \
 \#if PRAGMA\_ENUM\_ALWAYSINT***

\#endif\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFErrorDomainCFNetwork
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFErrorDomainWinSock
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 \
 /\*

-   -   -   -   -   

enum CFNetworkErrors {

};\
 typedef enum CFNetworkErrors CFNetworkErrors;\
 \
 \
 /\* Keys used by CFNetwork to pass additional error information back to
the user within CFError's userInfo dictionary \*/\
 /\*

-   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFURLErrorFailingURLErrorKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_2);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFURLErrorFailingURLStringErrorKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_2);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFGetAddrInfoFailureKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFSOCKSStatusCodeKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFSOCKSVersionKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFSOCKSNegotiationMethodKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFDNSServiceFailureKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 /\*

-   -   -   -   -   -   -   -   -   -   -   

CFN\_EXPORT const CFStringRef kCFFTPStatusCodeKey
\_\_OSX\_AVAILABLE\_STARTING(\_\_MAC\_10\_5,\_\_IPHONE\_2\_0);\
 \
 \#if PRAGMA\_ENUM\_ALWAYSINT

\#endif\
 \
 \
 \#ifdef \_\_cplusplus\
 }\
 \#endif\
 \
 \#endif /\* \_\_CFNETWORKERRORS\_ /\
 \

