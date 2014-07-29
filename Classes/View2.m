
#import "View2.h"
#import "DataClass.h"

@implementation View2

//synthesize the different elements
@synthesize label3;
@synthesize textField2;
@synthesize button2;
@synthesize button3;
@synthesize string2;
@synthesize info;
@synthesize tableView;
@synthesize done;
int selectedRow; //int global to this file
DataClass *obj= nil; //DataClass global to this file


- (void)viewDidLoad {
    obj = [DataClass getInstance];
    if (obj.info == nil)
    {
        obj.info = [[NSMutableArray alloc] init]; //get the global info array from the DataClass file
    }
    textField2.clearButtonMode = UITextFieldViewModeWhileEditing; //clear when editing
    button3.hidden = TRUE; //hide button 3
}


- (IBAction)buttonPression:(id)sender
{
    for (int i=0; i<[obj.info count]; i++) //loop through all the objects
    {
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //if same object exists
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release]; //show alert if adding the same
            [obj.info addObject:textField2.text]; //add it anyways
            goto END; //skip the rest of the code
            break;
        }
    }
    
    if([textField2.text isEqualToString:@"Type Word Here"]) //if default text exists
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a word"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release]; //show alert but this time don't add
        goto END;//skip rest of code
    }
    
    if ([textField2.text isEqualToString:@""]) //if only blank exists
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a word"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release]; //show alert and don't add
        goto END;//skip rest of code
    }
    
    else
    {
    [obj.info addObject:textField2.text]; //if everything checks out add it
    }
END:
    [self.tableView reloadData]; //reload the data
    
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
    textField2.text = nil; //set the text to nil
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
    
    cell.textLabel.text = [obj.info objectAtIndex:indexPath.row]; //set the text to the object at that spot
    cell.detailTextLabel.text = @"More text"; //by default
    
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];

    selectedRow = indexPath.row; //make selectedRow be the spot selected
    textField2.text = [obj.info objectAtIndex:selectedRow]; //make the textbox show what was typed
    button2.hidden = TRUE; //hide button 2
    button3.hidden = FALSE; //show button 3
}

- (IBAction)buttonPressEdit:(id)sender
{
    for (int i=0; i<[obj.info count]; i++) { //go through all objects
        if([textField2.text isEqualToString:[obj.info objectAtIndex:i]]) //if same thing
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release]; //show alert if same thing is added
            break;
        }
    }
    
    [obj.info replaceObjectAtIndex:selectedRow withObject:textField2.text]; //replace by default
    button3.hidden = TRUE; //show button 3
    button2.hidden = FALSE; //hide button 2
    [self.tableView reloadData]; //reload the data
    [self textFieldShouldReturn:textField2];
    
}

- (IBAction)buttonPressDone:(id)sender
{
    //transition to the next view
    View3 *third = [[View3 alloc] initWithNibName:@"View3" bundle:[NSBundle mainBundle]];
    [self presentViewController:third animated:YES completion:nil];
}


//Used with the text fields to dismiss keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    button3.hidden = TRUE; //hide button 3
    button2.hidden = FALSE; //show button 2
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES]; //unselect what was selected

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
