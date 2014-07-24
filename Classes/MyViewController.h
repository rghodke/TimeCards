
#import <UIKit/UIKit.h>
#import "View2.h"

@class View2;

@interface MyViewController : UIViewController <UITextFieldDelegate> {
	//elements used in the first view
	IBOutlet UITextField *textField;
	IBOutlet UILabel *label;
    IBOutlet UISlider *slider;
    IBOutlet UIButton *button;
	NSString *string;
    IBOutlet UIWindow *window2;
	MyViewController *myViewController2;
}
//properies for corresponding elements
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UISlider *slider;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, copy) NSString *string;
@property (nonatomic, retain) UIWindow *window2;
@property (nonatomic, retain) MyViewController *myViewController2;

- (void)updateString;

@end

