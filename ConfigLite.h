#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <mach/mach_traps.h>
#import <mach-o/dyld.h>
#import <mach/mach.h>
#import <substrate.h>
#import <dlfcn.h>
#import <stdio.h>
#import <stdlib.h>
#import <sys/types.h>
#import <unistd.h>
#import <sys/sysctl.h>
#import <pthread.h>
#import <mach-o/swap.h>
#import <libkern/OSCacheControl.h>

using namespace std;

struct ProgramVars {
	struct mach_header*      mh;
	int*		      NXArgcPtr;
	const char***	 NXArgvPtr;
	const char***	 environPtr;
	const char**	      __prognamePtr;
};

/*
 Hides Code and puts it in the inject section of the __TEXT segment
 */

#define hidme __attribute__((visibility("hidden"))) __attribute__((section("__TEXT,inject")))

/*
 Functions to show an UIAlertView at load time
 */


#define MANY_MACROS
#define MANY_INLINES

 //inline void setAlertInfo(const char *alertTitle, const char *alertMessage) __attribute__((always_inline));

 inline void didFinishLaunching(CFNotificationCenterRef center,void *observer,CFStringRef name, const void *object, CFDictionaryRef info)  __attribute__((always_inline));

 /*
 CNDeclare declares variables used for writing, to hide the offset
 Usage: CNDeclare(name, offset);
 */
 
#define CNDeclare(name,offset) __attribute__((visibility("hidden"))) uint64_t name = offset

/*
 CNConstructor is a hidden constructor
 */

#define CNConstructor(name) __attribute__((constructor)) hidme void name(struct ProgramVars *pinfo)
