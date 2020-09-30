//___FILEHEADER___

import UIKit

final class ___VARIABLE_productName___PresentationController: UIPresentationController {
    private let dimmingView = UIView()

    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController,
                          withParentContainerSize: containerView!.bounds.size)

        switch slideDirection {
        case .left, .top:
            break
        case .right(let width):
            frame.origin.x = UIScreen.main.bounds.width - width
        case .bottom(let height):
            frame.origin.y = UIScreen.main.bounds.height - height
        }
        return frame
    }

    @objc
    func dismiss() {
        self.presentingViewController.dismiss(animated: true)
    }

    private let slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection

    init(slideDirection: ___VARIABLE_productName___InteractionController.SlideDirection, presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        self.slideDirection = slideDirection
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)

        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        dimmingView.alpha = 0.0

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        dimmingView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        dimmingView.frame = containerView?.bounds ?? .zero

        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }

    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        switch slideDirection {
        case .left(let width):
            return CGSize(width: width, height: parentSize.height)
        case .right(let width):
            return CGSize(width: width, height: parentSize.height)
        case .top(let height):
            return CGSize(width: parentSize.width, height: height)
        case .bottom(let height):
            return CGSize(width: parentSize.width, height: height)
        }
    }
}
