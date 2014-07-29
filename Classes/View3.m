
#import "View3.h"
#import "DataClass.h"

//View for adding definitions to the words

@implementation View3
//synthesize the elements
@synthesize previous;
@synthesize ListofDefinitions;
@synthesize ListofWords;
@synthesize DefinitionTextField;
@synthesize EditDefinition;
@synthesize Defintion;
@synthesize AddDefinition;
@synthesize donezies;
int selectedRow2 = nil; //variable local to this file
DataClass *obj2= nil; //variable local to this file
NSIndexPath *selector = nil; //variable local to this file

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        obj2 = [DataClass getInstance];
        if (obj2.infodef == nil)
        {
            obj2.infodef = [[NSMutableArray alloc] init]; //get info def array
        }
        for (NSInteger i = 0; i < [obj2.info count]; ++i)
        {
            [obj2.infodef addObject:@"Type Definition Here"]; //set all values to Type Defintion Here by default
        }
        EditDefinition.hidden = TRUE; //hide EditDefinition
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
EditDefinition.hidden = TRUE; //hide both EditDefinition
    donezies.hidden = TRUE;//and Done
    DefinitionTextField.text = @"Click a definition to begin editing"; //Default text
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) CheckifDoneAdding
{
    for(int i=0;i<[obj2.infodef count];i++) //go through all of the array
    {
        if([[obj2.infodef objectAtIndex:i]  isEqual: @"Type Definition Here"]) //look for Type Definition Here
        {
            EditDefinition.hidden = FALSE; //show Edit is it is
            donezies.hidden = TRUE; //hide done
        }
        else
        {
            EditDefinition.hidden = TRUE; //else hide edit
            donezies.hidden = FALSE; //show done
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
        DefinitionTextField.text = nil; //set to nil by default
    }

}

- (IBAction)buttonPressPrevious:(id)sender
{
    //go back a view
    View2 *second = [[View2 alloc] initWithNibName:@"View2" bundle:[NSBundle mainBundle]];
    [self presentViewController:second animated:YES completion:nil];
}



 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    if(tableView == self.ListofWords)
    return [obj2.info count]; //return the count
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
    
    cell.textLabel.text = [obj2.info objectAtIndex:indexPath.row]; //set the text to the object at the index
    cell.detailTextLabel.text = @"More text"; //by default
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
        
        cell.textLabel.text = [obj2.infodef objectAtIndex:indexPath.row]; //set infodef to the text of the object at index
        cell.detailTextLabel.text = @"More text"; //by default
        
        // set the accessory view:
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ListofDefinitions deselectRowAtIndexPath:indexPath animated:NO]; //deselect both
    [ListofWords deselectRowAtIndexPath:indexPath animated:NO];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(tableView == ListofWords)
    {
        //select both
    [ListofWords selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [ListofDefinitions selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        selector = indexPath;
    selectedRow2 = indexPath.row;
    EditDefinition.hidden = FALSE; //show Edit
        donezies.hidden = TRUE; //hide done
    }
    
    if(tableView == ListofDefinitions)
    {
        //select both
        [ListofDefinitions selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        [ListofWords selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        selector = indexPath;
        selectedRow2 = indexPath.row;
        EditDefinition.hidden = FALSE; //show edit
        donezies.hidden = TRUE; //hide done
    }
    
    if(![[obj2.infodef objectAtIndex:selectedRow2]  isEqual: @"Type Definition Here"])
    {
        DefinitionTextField.text = [obj2.infodef objectAtIndex:selectedRow2]; //if not Type Definition Here set text to the infodef objects
    }
    
}

- (IBAction)buttonPressEdit:(id)sender
{
    if([DefinitionTextField.text isEqualToString:@"Type Definition Here"]) //can't have default text
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a definition"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release]; //show alert
        goto END;
        
    }
    
    for (int i=0; i<[obj2.infodef count]; i++) {
        if([DefinitionTextField.text isEqualToString:[obj2.infodef objectAtIndex:i]]) //can't have same info
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                            message:@"This already exists"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release]; //show alert
            [obj2.infodef replaceObjectAtIndex:selectedRow2 withObject:DefinitionTextField.text]; //replace object
            break;
            goto END; //skip code
            
        }
    }
    

    
    if([DefinitionTextField.text isEqualToString:@"Click a definition to begin editing"]) //look for default string
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You must type a definition"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release]; //alert out
        goto END;
    }
    else
    {
    [obj2.infodef replaceObjectAtIndex:selectedRow2 withObject:DefinitionTextField.text]; //if everything checks out, switch it out
    }
END:
    //Skip code protocol
    [self.ListofDefinitions reloadData];
    [self textFieldShouldReturn:DefinitionTextField];
    [self CheckifDoneAdding];
}


- (IBAction)buttonPressDone:(id)sender
{
    //transition to next view
    View4 *fourth = [[View4 alloc] initWithNibName:@"View4" bundle:[NSBundle mainBundle]];
    [self presentViewController:fourth animated:YES completion:nil];
}



//Used with the text fields to dismiss keyboard
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self CheckifDoneAdding];
    //check button and deselect it all
    [ListofWords deselectRowAtIndexPath:[ListofWords indexPathForSelectedRow] animated:YES];
    [ListofDefinitions deselectRowAtIndexPath:[ListofDefinitions indexPathForSelectedRow] animated:YES];
    selectedRow2 = NULL;
    
    
}


@end
