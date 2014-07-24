
#import "TimeCardsAppDelegate.h"
#import "MyViewController.h"
#import "View2.h"

@implementation TimeCardsAppDelegate   

@synthesize window;  //synthesize elements
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


//dealloc is no longer needed but put as test and for failsafe
- (void)dealloc
{
	[myViewController release];
	[window release];
	[super dealloc];
}

@end
