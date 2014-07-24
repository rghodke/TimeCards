#import <UIKit/UIKit.h>

@interface DataClass : NSObject
{
    //elements used as global variables
    NSMutableArray *info;
    NSMutableArray *infodef;
}
//properties for said elements
@property (nonatomic,retain) NSMutableArray *info;
@property (nonatomic, retain) NSMutableArray *infodef;
+(DataClass*)getInstance;
@end
