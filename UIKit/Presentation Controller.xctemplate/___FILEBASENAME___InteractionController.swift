//___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___InteractionController: UIPercentDrivenInteractiveTransition {
    var interactionInProgress = false

    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!

    let slideDirection: SlideDirection

    init(viewController: UIViewController, direction: SlideDirection) {
        self.slideDirection = direction
        super.init()
        self.viewController = viewController
        prepareGestureRecognizer(in: viewController.view)
    }

    private func prepareGestureRecognizer(in view: UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(gesture)
    }

    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        var progress: CGFloat
        switch slideDirection {
        case .left(let width):
            progress = translation.x / width
        case .right(let width):
            progress = translation.x / width
        case .top(let height):
            progress = translation.y / height
        case .bottom(let height):
            progress = translation.y / height
        }
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))

        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            viewController.dismiss(animated: true, completion: nil)
        case .changed:
            shouldCompleteTransition = progress > 0.5
            update(progress)
        case .cancelled:
            interactionInProgress = false
            cancel()
        case .ended:
            interactionInProgress = false
            if shouldCompleteTransition {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }
}

extension ___VARIABLE_productName___InteractionController {
    enum SlideDirection {
        case left(CGFloat)
        case right(CGFloat)
        case top(CGFloat)
        case bottom(CGFloat)
    }
}
