

#import "MyViewController.h"
#import "View2.h"

@implementation MyViewController

@class View2;
//synthesize the elements
@synthesize textField;
@synthesize label;
@synthesize string;	
@synthesize slider;
@synthesize button;
@synthesize window2;
@synthesize myViewController2;
//ALL OF THE FOLLOWING IS UNUSED AND UNNECESSARY TEST CODE

- (void)viewDidLoad {
    slider.minimumValue = 6; //set minimum to 6
    slider.maximumValue = 24; //set max to 24
    // When the user starts typing, show the clear button in the text field.
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // When the view first loads, display the placeholder text that's in the
    // text field in the label.
    label.text = textField.placeholder;
}

- (IBAction)sliderChanged:(id)sender
{
    /*
	// Store the text of the text field in the 'string' instance variable.
	//self.string = textField.text;
    // Set the text of the label to the value of the 'string' instance variable.
	//label.text = self.string;
    //label.text = [NSString stringWithFormat:@"%f",slider.value];
    //    label.text = self.slider.value;
    //int fontnum = 12.0;
     */
    label.font = [UIFont systemFontOfSize:slider.value]; //change the font to the slider value
}

- (IBAction)buttonPress:(id)sender
{
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];
    //label.text = @"button has been pressed";
    View2 *second = [[View2 alloc] initWithNibName:@"View2" bundle:[NSBundle mainBundle]]; //go to next view
    [self presentViewController:second animated:YES completion:nil];

    
}

- (void)updateString {
	
	// Store the text of the text field in the 'string' instance variable.
	self.string = textField.text;
    // Set the text of the label to the value of the 'string' instance variable.
	label.text = self.string;
    //label.text = [NSString stringWithFormat:@"%f",slider.value];
    //    label.text = self.slider.value;
    label.font = [UIFont systemFontOfSize:slider.value]; //set the font of the string
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


- (void)dealloc {
	// To adhere to memory management rules, release the instance variables.
    // 'textField' and 'label' are objects in the nib file and are created when the nib
    // is loaded.
	[textField release];
	[label release];
	[super dealloc];
}


@end
