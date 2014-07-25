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
DataClass *obj3= nil; //local to this file variable
int counter = 0; //counter variable local to this file


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
