//___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___ViewController: UIViewController {

    private var presentationManager: ___VARIABLE_productName___PresentationManager?

    // MARK: Initializing
    init() {
        super.init(nibName: nil, bundle: nil)
        let interactionController = ___VARIABLE_productName___InteractionController(viewController: self, direction: .right(220.0))
        self.presentationManager = ___VARIABLE_productName___PresentationManager(interactionController: interactionController)
        self.transitioningDelegate = presentationManager
        self.modalPresentationStyle = .custom

        view.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
