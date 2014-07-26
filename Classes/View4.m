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
DataClass *obj3= nil; //local to this file variable
int counter = 0; //counter variable local to this file
int flag = 0; //flag variable local to this file


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
        obj3.info = [[NSMutableArray alloc] init]; //get the info array
    }
    if (obj3.infodef == nil)
    {
        obj3.info = [[NSMutableArray alloc] init]; //get the infodef array
    }
    deter.text = @"Word"; //set deter to word
    worddef.text = [obj3.info objectAtIndex:counter]; //have the object at counter appear
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonPressFlip:(id)sender
{
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter]])
    { //if the word appears
    worddef.text = [obj3.infodef objectAtIndex:counter]; //show definition
    deter.text = @"Definition"; //have definition in the box
        goto END; //go to end
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter]]) //if infodef is showing
    {
    worddef.text = [obj3.info objectAtIndex:counter]; //show the word
    deter.text = @"Word"; //change to word
        goto END; //go to end
    }
END:
    {} //used to skip ifs
    
}

- (IBAction)buttonPressNext:(id)sender
{
    counter++; //increment counter
    if(counter == [obj3.info count]) //if at the end
    {
        counter = 0; //make it the begining
        [self refresharray];
        goto END; //skip rest
    }
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter-1]])
    { //go up one word
        worddef.text = [obj3.info objectAtIndex:counter];
        deter.text = @"Word";
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter-1]])
    { //go up one definition
        worddef.text = [obj3.infodef objectAtIndex:counter];
        deter.text = @"Definition";
    }
END:
    {} //skip the rest

}

- (IBAction)buttonPressHint:(id)sender
{
    NSString *hintfirst; //create a hint string
    if(flag == 0) //check if flag is 0
    {
    if(    worddef.text == [obj3.infodef objectAtIndex:counter] ) //if def is showing
    {
        NSString *hintas = [obj3.info objectAtIndex:counter];
        hintfirst = [hintas substringToIndex:1];
        hintinfo.text = [hintfirst stringByAppendingString:@" is the first letter"]; //give the first letter of the word
        flag = 1; //set flag to 1
        goto END; //go to end
    }
    
    if(    worddef.text == [obj3.info objectAtIndex:counter] ) //if word is showing
    {
        NSString *hintas = [obj3.infodef objectAtIndex:counter];
        hintfirst = [hintas substringToIndex:1]; //show first letter of defintion
        hintinfo.text = [hintfirst stringByAppendingString:@" is the first letter"];
        flag = 1; //set flag to 1
        goto END;
    }
    }

if(flag == 1) //for another hint
{
    
    if(([hintinfo.text rangeOfString:@"is the first letter"].location != NSNotFound) && worddef.text == [obj3.info objectAtIndex:counter])
    {
        NSString *hintas = [obj3.infodef objectAtIndex:counter];
        hintfirst = [hintas substringFromIndex:[hintas length] - 1];
        hintinfo.text = [hintfirst stringByAppendingString:@" is the last letter"]; //show last letter of def
        flag = 0;
        goto END;
    }
    
    if(([hintinfo.text rangeOfString:@"is the first letter"].location != NSNotFound) && worddef.text == [obj3.infodef objectAtIndex:counter])
    {
        NSString *hintas = [obj3.info objectAtIndex:counter];
        hintfirst = [hintas substringFromIndex:[hintas length] - 1];
        hintinfo.text = [hintfirst stringByAppendingString:@" is the last letter"]; //show last letter of word
        flag = 0;
        goto END;
    }
}
END:
    {} //skip code
    

    
}


- (IBAction)buttonPressShuffle:(id)sender
{
    for (int i = 0; i<3; i++) //shuffle the array 3 times
    {
        NSLog(@"executing shuffle"); //log statement to be removed
        NSUInteger count = [obj3.info count]; //get the number of cards
        
        for (NSUInteger i = 0; i < count; ++i) //shuffling algorithm
        {
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
            [obj3.info exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
            [obj3.infodef exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];

        }
        
    counter++; //bump the computer
    if(counter == [obj3.info count]) //if at the end
    {
        counter = 0; //loop back around
        [self refresharray];
        goto END;
    }
    if([worddef.text isEqualToString:[obj3.info objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.info objectAtIndex:counter]; //loop around
        deter.text = @"Word";
    }
    if([worddef.text isEqualToString:[obj3.infodef objectAtIndex:counter-1]])
    {
        worddef.text = [obj3.infodef objectAtIndex:counter]; //loop around
        deter.text = @"Definition";
    }
    
    
END:
    {} //skip code
        
    }
    
}

- (void)refresharray
{
    //used to refresh the screen and arrays
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
