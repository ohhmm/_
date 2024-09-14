# Creating Storyboard or XIB Files for iOS App UI

This guide provides instructions for creating the UI for the SKRYPT iOS app using Xcode's Interface Builder with either Storyboard or XIB files. We'll create a simple UI with a text field for input, a submit button, and a label for displaying results.

## Option 1: Using Storyboard

1. Open your Xcode project.
2. In the project navigator, locate the `Main.storyboard` file. If it doesn't exist, create a new Storyboard file:
   - File > New > File > iOS > User Interface > Storyboard
   - Name it "Main" and save it in your project directory.

3. Open the `Main.storyboard` file.
4. Drag a "View Controller" from the Object Library onto the storyboard canvas.
5. Set this View Controller as the initial view controller:
   - Select the View Controller
   - In the Attributes Inspector, check "Is Initial View Controller"

6. Add UI elements to the View Controller:
   - Drag a Text Field onto the View Controller
   - Drag a Button onto the View Controller
   - Drag a Label onto the View Controller

7. Configure the UI elements:
   - Text Field: Set placeholder text to "Enter expression"
   - Button: Set title to "Submit"
   - Label: Set text to "Result will appear here"

8. Set up Auto Layout constraints:
   - Select all three elements
   - Click the "Add New Constraints" button at the bottom of the storyboard
   - Add constraints for top, leading, and trailing spaces
   - Add vertical spacing constraints between elements

9. Connect the UI elements to the ViewController.swift file:
   - Open the Assistant Editor (two overlapping circles icon)
   - Control-drag from each UI element to the ViewController class to create IBOutlets and IBActions

## Option 2: Using XIB File

1. In Xcode, create a new XIB file:
   - File > New > File > iOS > User Interface > View
   - Name it "MainView" and save it in your project directory.

2. Open the `MainView.xib` file.

3. Add UI elements to the View:
   - Drag a Text Field onto the View
   - Drag a Button onto the View
   - Drag a Label onto the View

4. Configure the UI elements (same as in Storyboard option).

5. Set up Auto Layout constraints (same as in Storyboard option).

6. Create a new `UIViewController` subclass:
   - File > New > File > iOS > Cocoa Touch Class
   - Name it "MainViewController" and make it a subclass of UIViewController

7. In the `MainViewController.swift` file, load the XIB:

```swift
class MainViewController: UIViewController {
    override func loadView() {
        if let view = UINib(nibName: "MainView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView {
            self.view = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup after loading the view
    }
}
```

8. Connect the UI elements to the MainViewController.swift file (same as in Storyboard option).

## Ensuring Compatibility with Latest iOS Version

- Use SF Symbols for icons when possible
- Implement Dark Mode support:
  - In Interface Builder, set the View's appearance to "Any, Dark"
  - Use dynamic colors that adapt to light and dark modes

- Use Safe Area Layout Guides for constraints
- Test on different device sizes using the Preview feature in Xcode

Remember to integrate this UI with the previously provided Swift code for the ViewController to ensure full functionality.
