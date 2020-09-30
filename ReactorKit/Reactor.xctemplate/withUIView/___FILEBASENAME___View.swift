//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Then

final class ___VARIABLE_productName___ViewController: UIView, View {
    typealias Reactor = ___VARIABLE_productName___Reactor;

    var disposeBag: DisposeBag = DisposeBag()

    // MARK: Initializing
    init(reactor: Reactor) {
        defer { self.reactor = reactor }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Binding
    func bind(reactor: Reactor) {
    }
}
