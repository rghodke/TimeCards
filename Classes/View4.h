//
//  View4.h
//  TimeCards
//
//  Created by Ron on 7/14/14.
//
//

#import <UIKit/UIKit.h>
#import "DataClass.h"

@interface View4 : UIViewController
{
	//ui elements are created
    IBOutlet UILabel *worddef;
    IBOutlet UIButton *flip;
    IBOutlet UILabel *deter;
    IBOutlet UIButton *next;
    IBOutlet UIButton *hint;
    IBOutlet UILabel *hintinfo;
    IBOutlet UIButton *shuffle;
    IBOutlet UIButton *back;
}
//properties for them
@property(nonatomic,retain) UILabel *worddef;
@property(nonatomic,retain) UIButton *flip;
@property(nonatomic,retain) UILabel *deter;
@property(nonatomic,retain) UIButton *next;
@property(nonatomic, retain) UIButton *hint;
@property(nonatomic, retain) UILabel *hintinfo;
@property(nonatomic,retain) UIButton *shuffle;
@property(nonatomic, retain) UIButton *back;

@end
