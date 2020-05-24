# Viewity

Created to simplify constraints anchors and add some common code.
Use declarative syntax to build view via code.

### Dynamic framework to share it with another targets.

# Components 
## Common views attributes use it as a functions.
## Button class with on tap function to handle user tapping.
## Label with new insets attribute to add padding.
##  Text views, Stack views, Buttons, Labels, Views, Text fields, Image views, Table views and Collections views.

# Installation
Copy Github link and add it as a Swift Package Manager library.

# Usage 
```swift
import UIKit
import Viewity

class ViewController: UIViewController {
    let button = Button(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.add(button)
        button.text("Tap Me!")
              .foreground(.white)
              .tint(.white)
              .onTap { [unowned button] in
                button.loadable(true)
                print(#function)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    button.loadable(false)
                }
        }

        button.putInCenter()
        let gradient = LinearGradient(
            frame: .init(
                origin: .zero,
                size: .init(
                    width: button.intrinsicContentSize.width,
                    height: button.intrinsicContentSize.height
                )
            ),
            colors: [.systemGreen, .systemBlue]
        )
        button.gradient(of: gradient)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.background(.white, animated: true)
    }
}

```
