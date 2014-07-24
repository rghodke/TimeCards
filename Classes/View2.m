
#import "View2.h"
#import "DataClass.h"
@implementation View2

//synthesize the ui elements
@synthesize label3;
@synthesize textField2;
@synthesize button2;
@synthesize button3;
@synthesize string2;
@synthesize info;
@synthesize tableView;
@synthesize done;

int selectedRow;//local to class int variable

DataClass *obj= nil; //local to class obj variable


- (void)viewDidLoad {
    obj = [DataClass getInstance];
    if (obj.info == nil)
    {
        obj.info = [[NSMutableArray alloc] init]; //get the gloabl info array
    }
    textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    button3.hidden = TRUE; //hide button 3
    
}


- (IBAction)buttonPression:(id)sender
{
 //check for duplicates
    for (int i=0; i<[obj.info count]; i++) { //go through them all
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //look for repeat
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release]; //alert out
            break;
        }
    }
    
    if([textField2.text isEqualToString:@"Type Word Here"]) //look for "Type Word Here"
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a word"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release]; //alert out
    }
    
    else
    {
    
    [obj.info addObject:textField2.text];
    
    }
    
    [self.tableView reloadData]; //refresh the data
    
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
    textField2.text = nil;
    }
  
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1; //only 1 section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [obj.info count]; //return the length of the array
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [obj.info objectAtIndex:indexPath.row]; //set to the value of info at that location
    cell.detailTextLabel.text = @"More text"; //set to more text for the detail
   
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

    selectedRow = indexPath.row; //make selectRow to the row

    textField2.text = [obj.info objectAtIndex:selectedRow]; //show what was typed
    button2.hidden = TRUE; //hide button 2
    button3.hidden = FALSE; //show button 3
}

- (IBAction)buttonPressEdit:(id)sender
{
    for (int i=0; i<[obj.info count]; i++) {
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //look for repeats
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release]; //alert out
            break;
        }
    }
    
    [obj.info replaceObjectAtIndex:selectedRow withObject:textField2.text]; //switch the info out
    button3.hidden = TRUE; //hide button 3
    button2.hidden = FALSE; //show button 2
    [self.tableView reloadData];
    [self textFieldShouldReturn:textField2];
    
}

- (IBAction)buttonPressDone:(id)sender
{
    View3 *third = [[View3 alloc] initWithNibName:@"View3" bundle:[NSBundle mainBundle]]; //change to different view
    [self presentViewController:third animated:YES completion:nil];
}


//Used with the text fields to dismiss keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[textField2 resignFirstResponder];
    button3.hidden = TRUE; //hide button 3
    button2.hidden = FALSE; //show button 2
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
