
#import "View3.h"
#import "DataClass.h"

//@interface View3 ()

//@end

@implementation View3
//synthesize all the elements
@synthesize ListofDefinitions;
@synthesize ListofWords;
@synthesize DefinitionTextField;
@synthesize EditDefinition;
@synthesize Defintion;
@synthesize AddDefinition;
@synthesize donezies;

//global variables for this class only
int selectedRow2 = nil;
DataClass *obj2= nil;
NSIndexPath *selector = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        obj2 = [DataClass getInstance];
        if (obj2.infodef == nil)
        {
            obj2.infodef = [[NSMutableArray alloc] init]; //get the global infodef array
        }
        for (NSInteger i = 0; i < [obj2.info count]; ++i)
        {
            [obj2.infodef addObject:@"Type Definition Here"]; //make the default "Type Definition Here"
        }
        
        EditDefinition.hidden = TRUE; //Edit is hidden (cleaner look)
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
EditDefinition.hidden = TRUE; //hide both buttons"
    donezies.hidden = TRUE;
    DefinitionTextField.text = @"Click a definition to begin editing"; //Default text
    [super viewDidLoad];
}

- (void) CheckifDoneAdding
{
    for(int i=0;i<[obj2.infodef count];i++) //go through looking for string "Type Definition Here" if found
    {
        if([[obj2.infodef objectAtIndex:i]  isEqual: @"Type Definition Here"])
        {
            EditDefinition.hidden = FALSE; //show edit
            donezies.hidden = TRUE; //hide done
        }
        else
        { //opposite
            EditDefinition.hidden = TRUE;
            donezies.hidden = FALSE;
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if (theTextField == DefinitionTextField){
		[DefinitionTextField resignFirstResponder];
        // Invoke the method that changes the greeting.
        //    [self updateString];
	}
	return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Dismiss the keyboard when the view outside the text field is touched.
    [DefinitionTextField resignFirstResponder];
    // Revert the text field to the previous value.
    [super touchesBegan:touches withEvent:event];
}


- (void)textFieldDidBeginEditing:(UITextField *)textFieldedit {
    if(textFieldedit == DefinitionTextField)
    {
        DefinitionTextField.text = nil; //set to nothing
    }
}



 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    if(tableView == self.ListofWords)
    return [obj2.info count]; //return the number of objects
    if(tableView == self.ListofDefinitions)
    return [obj2.info count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView == ListofWords)
    {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [ListofWords dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [obj2.info objectAtIndex:indexPath.row]; //set to what was typed before
    cell.detailTextLabel.text = @"More text";
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    }
    
    if(tableView == ListofDefinitions)
    {
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [ListofDefinitions dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        // Set the data for this cell:
        
        cell.textLabel.text = [obj2.infodef objectAtIndex:indexPath.row]; //add the definition next to it
        cell.detailTextLabel.text = @"More text";
        
        // set the accessory view:
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ListofDefinitions deselectRowAtIndexPath:indexPath animated:NO]; //highlight both at the same time
    [ListofWords deselectRowAtIndexPath:indexPath animated:NO];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView == ListofWords)
    {
    [ListofWords selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [ListofDefinitions selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    selector = indexPath; //select the right location
    selectedRow2 = indexPath.row;
    EditDefinition.hidden = FALSE;
        donezies.hidden = TRUE; //show done

    }
    
    if(tableView == ListofDefinitions)
    {
        [ListofDefinitions selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        [ListofWords selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        selector = indexPath; //select the right location
        selectedRow2 = indexPath.row;
        EditDefinition.hidden = FALSE;
        donezies.hidden = TRUE; //show done

    }
    
    if(![[obj2.infodef objectAtIndex:selectedRow2]  isEqual: @"Type Definition Here"])
    {
        DefinitionTextField.text = [obj2.infodef objectAtIndex:selectedRow2]; //text field shows whats in objinfo
    }
    
}

- (IBAction)buttonPressEdit:(id)sender
{
    for (int i=0; i<[obj2.infodef count]; i++) { //look for repeats
        if([DefinitionTextField.text isEqualToString:[obj2.infodef objectAtIndex:i]])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [obj2.infodef replaceObjectAtIndex:selectedRow2 withObject:DefinitionTextField.text];
            break;
            
        }
    }
    
    if([DefinitionTextField.text isEqualToString:@"Type Definition Here"]) //look for "Type Definition Here"
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a definition"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];

    }
    
    if([DefinitionTextField.text isEqualToString:@"Click a definition to begin editing"])
        //Look for "Click a definition to begin editing"
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a definition"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else
    {
    [obj2.infodef replaceObjectAtIndex:selectedRow2 withObject:DefinitionTextField.text]; //switch them out
    }
    [self.ListofDefinitions reloadData];
    [self textFieldShouldReturn:DefinitionTextField];
    [self CheckifDoneAdding]; //check if all objinfo elements are added in
}


- (IBAction)buttonPressDone:(id)sender
{
    View4 *fourth = [[View4 alloc] initWithNibName:@"View4" bundle:[NSBundle mainBundle]]; //go to next view
    [self presentViewController:fourth animated:YES completion:nil];
}



//Used with the text fields to dismiss keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self CheckifDoneAdding]; //check if all elements are added in
    [ListofWords deselectRowAtIndexPath:[ListofWords indexPathForSelectedRow] animated:YES]; //deselect both
    [ListofDefinitions deselectRowAtIndexPath:[ListofDefinitions indexPathForSelectedRow] animated:YES];

    
}


@end