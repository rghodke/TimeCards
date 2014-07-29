
#import "DataClass.h"
//THIS FILE IS GLOBAL VARIABLE FILE
@interface DataClass ()

@end

@implementation DataClass
@synthesize info;
@synthesize infodef;

static DataClass *instance = nil;

+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [DataClass new];
        }
    }
    return instance;
}

@end
