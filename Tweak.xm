#include "vm_writeData.h"

BOOL allowAccess(NSString *filename) {
   NSArray *NotAllowedPathPrefixes =
   @[
   //  @"/bin",
   @"/usr/bin",
   @"/usr/sbin",
   //  @"/etc/apt",
   @"/usr/libexec/sftp-server",
   @"/private/var/lib",
   @"/private/var/stash",
   @"/private/var/mobile/Library/SBSettings",
   @"/private/var/tmp/cydia.log",
   @"/Applications/",
   @"/Library/MobileSubstrate",
   @"/System/Library/LaunchDaemons"
   ];

   if (filename.length == 0) {
     return YES;
   }
   for (NSString *prefix in NotAllowedPathPrefixes) {
     if ([filename hasPrefix:prefix]) {
       return NO;
     }
   }
   return YES;
}

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
  if(!allowAccess(path)){
    return NO;
  }
  return %orig;
}
%end

%ctor {
//com.nintendo.zara
vm_writeData(0x1003ED328, 0x20008052);//unlock all worlds
vm_writeData(0x1003ED32C, 0xC0035FD6);

vm_writeData(0x10009564C, 0x00E0BF12);//Unlimited coins
vm_writeData(0x100095650, 0xC0035FD6);
}
