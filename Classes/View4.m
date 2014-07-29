//
//  View4.m
//  TimeCards
//
//  Created by Ron on 7/14/14.
//
//

#import "View4.h"

@implementation View4
//synthesize the elements
@synthesize worddef;
@synthesize flip;
@synthesize deter;
@synthesize next;
@synthesize hint;
@synthesize hintinfo;
@synthesize shuffle;
@synthesize back;
@synthesize previous;
//local variables for this view
DataClass *obj3= nil;
int counter = 0;
int flag = 0;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    obj3 = [DataClass getInstance];
    if (obj3.info == nil)
    {
        obj3.info = [[NSMutableArray alloc] init]; //get info array
    }
    if (obj3.infodef == nil)
    {
        obj3.info = [[NSMutableArray alloc] init]; //get infodef array
    }
    deter.text = @"Word"; //set header to word
    worddef.text = [obj3.info objectAtIndex:counter]; //set worddef to the object at info[counter]
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonPressFlip:(id)sender
{
    //when flipping make sure the header is updated(definition to word and word to definition)
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter]])
    {
    worddef.text = [obj3.infodef objectAtIndex:counter];
    deter.text = @"Definition";
        goto END;
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter]])
    {
    worddef.text = [obj3.info objectAtIndex:counter];
    deter.text = @"Word";
        goto END;
    }
END:
    {}
    
}

- (IBAction)buttonPressPrevious:(id)sender
{
    //go back a view
    View3 *third = [[View3 alloc] initWithNibName:@"View3" bundle:[NSBundle mainBundle]];
    [self presentViewController:third animated:YES completion:nil];
}

- (IBAction)buttonPressBack:(id)sender
{
    //go back a flash card
    counter--;
    if(counter == -1)
    {
        counter = [obj3.info count] - 1; //loop around
        [self refresharray];
        goto END;
    }
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter+1]])
    {
        worddef.text = [obj3.info objectAtIndex:counter];
        deter.text = @"Word";
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter+1]])
    {
        worddef.text = [obj3.infodef objectAtIndex:counter];
        deter.text = @"Definition";
    }
END:
    {}

    
}

- (IBAction)buttonPressNext:(id)sender
{
    //go forward a flash card
    counter++;
    if(counter == [obj3.info count])
    {
        counter = 0; //loop around
        [self refresharray];
        goto END;
    }
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.info objectAtIndex:counter];
        deter.text = @"Word";
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.infodef objectAtIndex:counter];
        deter.text = @"Definition";
    }
END:
    {}

}

- (IBAction)buttonPressHint:(id)sender
{
    NSString *hintfirst;
    if(flag == 0)
    {
    if(    worddef.text == [obj3.infodef objectAtIndex:counter] )
    {
        NSString *hintas = [obj3.info objectAtIndex:counter];
        hintfirst = [hintas substringToIndex:1]; //extract only the first letter
        hintinfo.text = [hintfirst stringByAppendingString:@" is the first letter"];
        flag = 1; //set to 1
        goto END;
    }
    
    if(    worddef.text == [obj3.info objectAtIndex:counter] )
    {
        NSString *hintas = [obj3.infodef objectAtIndex:counter];
        hintfirst = [hintas substringToIndex:1]; //extract only the first letter
        hintinfo.text = [hintfirst stringByAppendingString:@" is the first letter"];
        flag = 1; //set to 1
        goto END;
    }
    }

if(flag == 1) //if another hint is requested
{
    
    if(([hintinfo.text rangeOfString:@"is the first letter"].location != NSNotFound) && worddef.text == [obj3.info objectAtIndex:counter])
    {
        NSString *hintas = [obj3.infodef objectAtIndex:counter];
        hintfirst = [hintas substringFromIndex:[hintas length] - 1];
        hintinfo.text = [hintfirst stringByAppendingString:@" is the last letter"]; //take only the last letter
        flag = 0;
        goto END;
    }
    
    if(([hintinfo.text rangeOfString:@"is the first letter"].location != NSNotFound) && worddef.text == [obj3.infodef objectAtIndex:counter])
    {
        NSString *hintas = [obj3.info objectAtIndex:counter];
        hintfirst = [hintas substringFromIndex:[hintas length] - 1];
        hintinfo.text = [hintfirst stringByAppendingString:@" is the last letter"]; //take only the last letter
        flag = 0;
        goto END;
    }
}
END:
    {}
    

    
}


- (IBAction)buttonPressShuffle:(id)sender
{
    for (int i = 0; i<3; i++) //shuffle it 3 times
    {
        NSLog(@"executing shuffle");
        NSUInteger count = [obj3.info count];
        
        for (NSUInteger i = 0; i < count; ++i)
        {//shuffling method
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
            [obj3.info exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
            [obj3.infodef exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];

        }
        
    counter++;
    if(counter == [obj3.info count])
    {
        counter = 0; //loop around
        [self refresharray];
        goto END;
    }
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.info objectAtIndex:counter];
        deter.text = @"Word"; //set to word
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.infodef objectAtIndex:counter];
        deter.text = @"Definition"; //set to defintion
    }
    
    
END:
    {} //skip rest of code
        
    }
    
}

- (void)refresharray
{
    //refresh the data
    if ([deter.text  isEqual: @"Definition"])
    worddef.text = [obj3.infodef objectAtIndex:counter];
    if ([deter.text  isEqual: @"Word"])
        worddef.text = [obj3.info objectAtIndex:counter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
