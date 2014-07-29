
#import <UIKit/UIKit.h>

@class MyViewController;
//interface for opening screen
@interface TimeCardsAppDelegate : NSObject <UIApplicationDelegate> {
	//the different elements
	IBOutlet UIWindow *window;
	MyViewController *myViewController;
}
//the properties for the different elements
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MyViewController *myViewController;

@end
