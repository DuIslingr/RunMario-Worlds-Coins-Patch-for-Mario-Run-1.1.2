#include <UIKit/UIKit.h>
#include <Liberation.h>
#include <substrate.h>
#include "ConfigLite.h"

uintptr_t awesomesauce = 0x0;

CNDeclare(world164, 0x1003ED328);
CNDeclare(coins64, 0x10009564C);

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

hidme void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info)
{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 15 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
      dispatch_async(dispatch_get_main_queue(), ^{
        if (NSClassFromString(@"UIAlertController"))
        {
            UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
            while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed)
            {
                view = view.presentedViewController;
            }
            UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Mario Run Cheats"
                                                    message:@"Hacked by Du'Islingr & Sterling. Powered by Liberation."
                                             preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Continue"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action){
                                                              }]];

            [view presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Mario Run Cheats" message:@"Hacked by Du'Islingr & Sterling. Powered by Liberation." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            [av show];
        }
      

      Settings settings = "mrsettings.plist";

      Patch *world1Patch = Patch::CreateInstrPatch((world164 + awesomesauce), "MOV X0, #1; RET");
      Patch *coinsPatch = Patch::CreateInstrPatch((coins64 + awesomesauce), "MOV W0, #0xFF00, LSL #16; RET");

      bool world = settings["worldkey"];
      bool coins = settings["coinskey"];

      if (world)
      {
          world1Patch->Apply();
      }
      else
      {
          world1Patch->Reset();
      }

      if (coins)
      {
          coinsPatch->Apply();
      }
      else
      {
          coinsPatch->Reset();
      }
            });
    });
}

CNConstructor(Charizard)
{
    awesomesauce = (uintptr_t)_dyld_get_image_vmaddr_slide(0);
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
