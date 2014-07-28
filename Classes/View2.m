
#import "View2.h"
#import "DataClass.h"

@implementation View2



@synthesize label3;
@synthesize textField2;
@synthesize button2;
@synthesize button3;
@synthesize string2;
@synthesize info;
@synthesize tableView;
@synthesize done;

int selectedRow;
DataClass *obj= nil;


- (void)viewDidLoad {
    obj = [DataClass getInstance];
    if (obj.info == nil)
    {
        obj.info = [[NSMutableArray alloc] init]; //get the global info array
    }
    textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    button3.hidden = TRUE; //make sure button 3 is hidden

}


- (IBAction)buttonPression:(id)sender
{
        for (int i=0; i<[obj.info count]; i++)
    {
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //alert if same data
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [obj.info addObject:textField2.text];
            goto END;
            break;
        }
    }
    
    if([textField2.text isEqualToString:@"Type Word Here"]) //alert if Type Word Here
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a word"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        goto END;
    }
    
    if ([textField2.text isEqualToString:@""]) //alert if blank
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a word"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        goto END;
    }
    
    else
    {
    [obj.info addObject:textField2.text];
    }
END:
    [self.tableView reloadData];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if (theTextField == textField2){
		[textField2 resignFirstResponder];
        // Invoke the method that changes the greeting.
	}
	return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Dismiss the keyboard when the view outside the text field is touched.
    [textField2 resignFirstResponder];
    // Revert the text field to the previous value.
    [super touchesBegan:touches withEvent:event];
}


- (void)textFieldDidBeginEditing:(UITextField *)textFieldedit {
    if(textFieldedit == textField2)
    {
    textField2.text = nil; //set to nothing
    }
 
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [obj.info count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [obj.info objectAtIndex:indexPath.row]; //set the text to the data
    cell.detailTextLabel.text = @"More text";
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

    selectedRow = indexPath.row;

    textField2.text = [obj.info objectAtIndex:selectedRow];
    button2.hidden = TRUE;
    button3.hidden = FALSE; //show button 3
}

- (IBAction)buttonPressEdit:(id)sender
{
    for (int i=0; i<[obj.info count]; i++) {
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //alert if same
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            break;
        }
    }
    
    [obj.info replaceObjectAtIndex:selectedRow withObject:textField2.text]; //replace objects
    button3.hidden = TRUE;
    button2.hidden = FALSE; //show button 2
    [self.tableView reloadData];
    [self textFieldShouldReturn:textField2];
    
}

- (IBAction)buttonPressDone:(id)sender
{
    View3 *third = [[View3 alloc] initWithNibName:@"View3" bundle:[NSBundle mainBundle]];
    [self presentViewController:third animated:YES completion:nil]; //change view
}


//Used with the text fields to dismiss keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    button3.hidden = TRUE;
    button2.hidden = FALSE; //show button 2
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
