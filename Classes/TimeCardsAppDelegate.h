
#import <UIKit/UIKit.h>

@class MyViewController;

@interface TimeCardsAppDelegate : NSObject <UIApplicationDelegate> {
	
	IBOutlet UIWindow *window; //create the window
	MyViewController *myViewController; //create the view controller
}

@property (nonatomic, retain) UIWindow *window; //window property
@property (nonatomic, retain) MyViewController *myViewController;  //view controller property

@end
