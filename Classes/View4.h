
#import <UIKit/UIKit.h>
#import "DataClass.h"

@class View3;
//The flashcard view
@interface View4 : UIViewController
{
    //elements of this view
    IBOutlet UILabel *worddef;
    IBOutlet UIButton *flip;
    IBOutlet UILabel *deter;
    IBOutlet UIButton *next;
    IBOutlet UIButton *hint;
    IBOutlet UILabel *hintinfo;
    IBOutlet UIButton *shuffle;
    IBOutlet UIButton *back;
    IBOutlet UIButton *previous;
}
//properties for said elements
@property(nonatomic,retain) UILabel *worddef;
@property(nonatomic,retain) UIButton *flip;
@property(nonatomic,retain) UILabel *deter;
@property(nonatomic,retain) UIButton *next;
@property(nonatomic, retain) UIButton *hint;
@property(nonatomic, retain) UILabel *hintinfo;
@property(nonatomic,retain) UIButton *shuffle;
@property(nonatomic, retain) UIButton *back;
@property(nonatomic, retain) UIButton *previous;

@end
