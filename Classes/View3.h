#import <UIKit/UIKit.h>
#import "View4.h"

@class View4;


@interface View3 : UIViewController
{
    //synthesize the UI elements
    IBOutlet UILabel *Defintion;
    IBOutlet UITextField *DefinitionTextField;
    IBOutlet UIButton *AddDefinition;
    IBOutlet UIButton *EditDefinition;
    IBOutlet UITableView *ListofWords;
    IBOutlet UITableView *ListofDefinitions;
    IBOutlet UIButton *donezies;
}
//create the properties for the elements
@property (nonatomic,retain) UILabel *Defintion;
@property (nonatomic,retain) UITextField *DefinitionTextField;
@property (nonatomic, retain) UIButton *AddDefinition;
@property (nonatomic,retain) UIButton *EditDefinition;
@property (nonatomic,retain) UITableView *ListofWords;
@property (nonatomic,retain) UITableView *ListofDefinitions;
@property (nonatomic, retain) UIButton *donezies;

@end
