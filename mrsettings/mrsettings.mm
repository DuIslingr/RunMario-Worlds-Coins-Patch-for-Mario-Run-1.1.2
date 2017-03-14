#include <Preferences/PSBundleController.h>
#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <unistd.h>

@interface MRsettingsListController: PSListController <UIAlertViewDelegate> {
}
@end

@implementation MRsettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"mrsettings" target:self];
	}
    return _specifiers;
}

-(void)viewDidLoad {

    [super viewDidLoad];
    PSSpecifier *creditspecifier = [self specifierForID:@"myCreditsSpecifier"];
    [creditspecifier setProperty:[NSString stringWithFormat:@"Credits:\nDu'Islingr\nSterling\nLeavez *JB Bypass*\nRazzile *Liberation Library*"] forKey:@"footerText"];

 }

-(void)respring {
    system("killall -9 SpringBoard");
}

@end
