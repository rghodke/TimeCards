#import <UIKit/UIKit.h>
#import "View4.h"

@class View4;
@class View2;
//view for defintions
@interface View3 : UIViewController
{
    //elements used in the view
    IBOutlet UILabel *Defintion;
    IBOutlet UITextField *DefinitionTextField;
    IBOutlet UIButton *AddDefinition;
    IBOutlet UIButton *EditDefinition;
    IBOutlet UITableView *ListofWords;
    IBOutlet UITableView *ListofDefinitions;
    IBOutlet UIButton *donezies;
    IBOutlet UIButton *previous;
}
//properties for said elements
@property (nonatomic,retain) UILabel *Defintion;
@property (nonatomic,retain) UITextField *DefinitionTextField;
@property (nonatomic, retain) UIButton *AddDefinition;
@property (nonatomic,retain) UIButton *EditDefinition;
@property (nonatomic,retain) UITableView *ListofWords;
@property (nonatomic,retain) UITableView *ListofDefinitions;
@property (nonatomic, retain) UIButton *donezies;
@property(nonatomic,retain) UIButton *previous;

@end
