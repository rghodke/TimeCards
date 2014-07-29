//THIS CLASS IS A TEST CLASS. IT HAS NO APPLICATION

#import "MyViewController.h"
#import "View2.h"

@implementation MyViewController

@class View2;
//synthesize all the elements
@synthesize textField;
@synthesize label;
@synthesize string;	
@synthesize slider;
@synthesize button;
@synthesize window2;
@synthesize myViewController2;

- (void)viewDidLoad {
    // When the user starts typing, show the clear button in the text field.
    slider.minimumValue = 6; //set slider min to 6
    slider.maximumValue = 24; //set the slider max to 24
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // When the view first loads, display the placeholder text that's in the
    // text field in the label.
    label.text = textField.placeholder; //put the placeholder in
}

- (IBAction)sliderChanged:(id)sender
{
    label.font = [UIFont systemFontOfSize:slider.value]; //change the font to the slider value
}

- (IBAction)buttonPress:(id)sender
{
    //Transition to the next view
    View2 *second = [[View2 alloc] initWithNibName:@"View2" bundle:[NSBundle mainBundle]];
    [self presentViewController:second animated:YES completion:nil];

    
}

- (void)updateString {
	
	// Store the text of the text field in the 'string' instance variable.
	self.string = textField.text;
    // Set the text of the label to the value of the 'string' instance variable.
	label.text = self.string;
    label.font = [UIFont systemFontOfSize:slider.value];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
	if (theTextField == textField) {
		[textField resignFirstResponder];
        // Invoke the method that changes the greeting.
        [self updateString];
	}
	return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Dismiss the keyboard when the view outside the text field is touched.
    [textField resignFirstResponder];
    // Revert the text field to the previous value.
    textField.text = self.string; 
    [super touchesBegan:touches withEvent:event];
}

//this method is no longer required
- (void)dealloc {
	// To adhere to memory management rules, release the instance variables.
    // 'textField' and 'label' are objects in the nib file and are created when the nib
    // is loaded.
	[textField release];
	[label release];
	[super dealloc];
}


@end
