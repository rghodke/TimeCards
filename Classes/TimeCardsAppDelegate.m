
#import "TimeCardsAppDelegate.h"
#import "MyViewController.h"
#import "View2.h"

@implementation TimeCardsAppDelegate   
//synthesize the properties for the different elements
@synthesize window;
@synthesize myViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Set up the view controller
	MyViewController *aViewController = [[MyViewController alloc] initWithNibName:@"TimeCards" bundle:[NSBundle mainBundle]];
	self.myViewController = aViewController;
	[aViewController release];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
	
	// Add the view controller's view as a subview of the window
	UIView *controllersView = [myViewController view];
	[window addSubview:controllersView];
	[window makeKeyAndVisible];
}

//this method is no longer needed since dealloc is now automatic
- (void)dealloc {
	[myViewController release];
	[window release];
	[super dealloc];
}

@end
