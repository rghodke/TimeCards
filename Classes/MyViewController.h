//TEST CLASS
#import <UIKit/UIKit.h>
#import "View2.h"

@class View2;
//interface for MyViewController(test class)
@interface MyViewController : UIViewController <UITextFieldDelegate> {
	//elements to be used
	IBOutlet UITextField *textField;
	IBOutlet UILabel *label;
    IBOutlet UISlider *slider;
    IBOutlet UIButton *button;
	NSString *string;
    IBOutlet UIWindow *window2;
	MyViewController *myViewController2;
}
//the different properties used in the class
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UISlider *slider;
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, copy) NSString *string;
@property (nonatomic, retain) UIWindow *window2;
@property (nonatomic, retain) MyViewController *myViewController2;

- (void)updateString;

@end

