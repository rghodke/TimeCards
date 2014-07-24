
#import <UIKit/UIKit.h>
#import "View3.h"

extern NSMutableArray *info2;

@class View3;


@interface View2 : UIViewController <UITextFieldDelegate>

{
    //create the buttons and ui elemetns used
    IBOutlet UILabel *label3;
    IBOutlet UITextField *textField2;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *done;
    NSString *string2;
    NSMutableArray *info;
    IBOutlet UITableView *tableView;
}
//create the appropriate properties for them
@property (nonatomic, retain) UILabel *label3;
@property (nonatomic, retain) UITextField *textField2;
@property (nonatomic, retain) UIButton *button2;
@property (nonatomic, retain) UIButton *button3;
@property (nonatomic, retain) UIButton *done;
@property (nonatomic, copy) NSString *string2;
@property (nonatomic) NSMutableArray *info;
@property (nonatomic, retain) UITableView *tableView;


@end
