#import "ReactNativeViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>

#import "ReactNativeBrownfield.h"

@implementation ReactNativeViewController

@synthesize moduleName = _moduleName;
@synthesize initialProperties = _initialProperties;

-(instancetype)initWithModuleName:(NSString *)moduleName {
    return [self initWithModuleName:moduleName andInitialProperties:nil];
}

-(instancetype)initWithModuleName:(NSString *)moduleName
             andInitialProperties:(NSDictionary*)initialProperties {
    self = [super init];
    _moduleName = moduleName;
    _initialProperties = initialProperties;
    
    return self;
}

-(void)loadView {
    RCTBridge *bridge = [[ReactNativeBrownfield shared] bridge];
    if (bridge == nil) {
        NSLog(@"Error: You need to start React Native in order to use ReactNativeViewController, make sure to run [[BridgeManager shared] startReactNative] before instantiating it.");
        return;
    }

    if (_moduleName) {
        RCTRootView *reactView = [[RCTRootView alloc] initWithBridge:bridge moduleName:_moduleName initialProperties:_initialProperties];
        self.view = reactView;
    }
}

@end
