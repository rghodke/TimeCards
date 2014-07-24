
#import "DataClass.h"

@interface DataClass ()

@end

//global variable class

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
