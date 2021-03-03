#import "WillPopAdmobPlugin.h"
#if __has_include(<will_pop_admob/will_pop_admob-Swift.h>)
#import <will_pop_admob/will_pop_admob-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "will_pop_admob-Swift.h"
#endif

@implementation WillPopAdmobPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWillPopAdmobPlugin registerWithRegistrar:registrar];
}
@end
