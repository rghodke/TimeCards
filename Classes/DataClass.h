#import <UIKit/UIKit.h>
//THIS FILE IS GLOBAL VARIBLE FILE
@interface DataClass : NSObject
{
    NSMutableArray *info;
    NSMutableArray *infodef;
}

@property (nonatomic,retain) NSMutableArray *info;
@property (nonatomic, retain) NSMutableArray *infodef;
+(DataClass*)getInstance;
@end
