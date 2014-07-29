
#import <UIKit/UIKit.h>
#import "View3.h"

extern NSMutableArray *info2;

@class View3;


@interface View2 : UIViewController <UITextFieldDelegate>
//The primary View

{
 //The different elements of the view
    IBOutlet UILabel *label3;
    IBOutlet UITextField *textField2;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *done;
    NSString *string2;
    NSMutableArray *info;
    IBOutlet UITableView *tableView;
}
//the different properties for the different elements
@property (nonatomic, retain) UILabel *label3;
@property (nonatomic, retain) UITextField *textField2;
@property (nonatomic, retain) UIButton *button2;
@property (nonatomic, retain) UIButton *button3;
@property (nonatomic, retain) UIButton *done;
@property (nonatomic, copy) NSString *string2; //set to copy for this string
@property (nonatomic) NSMutableArray *info;
@property (nonatomic, retain) UITableView *tableView;


@end
