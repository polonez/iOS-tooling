//___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___PresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    private let interactionController: ___VARIABLE_productName___InteractionController

    private let slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection

    init(interactionController: ___VARIABLE_productName___InteractionController) {
        self.slideDirection = interactionController.slideDirection
        self.interactionController = interactionController
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = ___VARIABLE_productName___PresentationController(slideDirection: slideDirection, presentedViewController: presented, presenting: presenting)
        presentationController.delegate = self
        return presentationController
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ___VARIABLE_productName___AnimationPresentationController(slideDirection: slideDirection)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ___VARIABLE_productName___AnimationDismissController(interactionController: interactionController)
    }

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let animator = animator as? ___VARIABLE_productName___AnimationDismissController,
            interactionController.interactionInProgress else {
                return nil
        }
        return animator.interactionController
    }
}

extension ___VARIABLE_productName___PresentationManager: UIAdaptivePresentationControllerDelegate {
}
