//___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___AnimationPresentationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection

    init(slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection) {
        self.slideDirection = slideDirection
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = .to
        guard let controller = transitionContext.viewController(forKey: key) else { return }

        transitionContext.containerView.addSubview(controller.view)

        let finalFrame = transitionContext.finalFrame(for: controller)

        var initialFrame: CGRect = finalFrame
        switch slideDirection {
        case .left(let width):
            initialFrame.origin.x -= width
        case .right(let width):
            initialFrame.origin.x += width
        case .top(let height):
            initialFrame.origin.y -= height
        case .bottom(let height):
            initialFrame.origin.y += height
        }

        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        UIView.animate(
            withDuration: animationDuration,
            animations: {
                controller.view.frame = finalFrame
        }, completion: { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

final class ___VARIABLE_productName___AnimationDismissController: NSObject, UIViewControllerAnimatedTransitioning {
    let interactionController: ___VARIABLE_productName___InteractionController
    private let slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection

    init(interactionController: ___VARIABLE_productName___InteractionController) {
        self.interactionController = interactionController
        self.slideDirection = interactionController.slideDirection
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let controller = transitionContext.viewController(forKey: .from) else { return }

        let initialFrame = transitionContext.finalFrame(for: controller)
        var finalFrame = initialFrame
        switch slideDirection {
        case .left(let width):
            finalFrame.origin.x -= width
        case .right(let width):
            finalFrame.origin.x += width
        case .top(let height):
            finalFrame.origin.y -= height
        case .bottom(let height):
            finalFrame.origin.y += height
        }

        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        UIView.animate(
            withDuration: animationDuration,
            animations: {
                controller.view.frame = finalFrame
        }, completion: { finished in
            if transitionContext.transitionWasCancelled == false {
                controller.view.removeFromSuperview()
            }
            transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
        })
    }
}
