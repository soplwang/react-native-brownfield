#import "ReactNativeBrownfieldModule.h"

#import <React/RCTBridge.h>
#import <React/RCTRootContentView.h>
#import <React/RCTUIManager.h>

@implementation ReactNativeBrownfieldModule

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(ReactNativeBrownfield);

- (UIView *)rootViewForRootTag:(nonnull NSNumber*)rootTag {
    RCTAssert(RCTIsReactRootView(rootTag),
      @"Attempt to find RCTRootContentView with rootTag (%@) which is not actually root tag.", rootTag);

    UIView *rootView = [self.bridge.uiManager viewForReactTag:rootTag];
    if (!rootView || ![rootView isKindOfClass:[RCTRootContentView class]]) {
        RCTLogError(@"Cannot find RCTRootContentView with rootTag #%@", rootTag);
        return nil;
    }
    return rootView;
}

RCT_EXPORT_METHOD(setPopGestureRecognizerEnabled:(BOOL)enabled forRoot:(nonnull NSNumber*)rootTag) {
    UIViewController *viewController = [[self rootViewForRootTag:rootTag] reactViewController];
    viewController.navigationController.interactivePopGestureRecognizer.enabled = enabled;
}

RCT_EXPORT_METHOD(popToNative:(BOOL)animated forRoot:(nonnull NSNumber*)rootTag) {
    UIViewController *viewController = [[self rootViewForRootTag:rootTag] reactViewController];
    [viewController.navigationController popViewControllerAnimated:animated];
}

@end
