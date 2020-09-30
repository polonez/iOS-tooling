//___FILEHEADER___

import Foundation
import RxSwift
import RxCocoa
import ReactorKit

final class ___VARIABLE_productName___Reactor: Reactor {
    enum Action {
    }

    enum Mutation {
    }

    struct State {
    }

    let initialState: State

    init() {
        defer { _ = self.state }
        self.initialState = State()
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        default:
            break
        }
        return .empty()
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        default:
            break
        }
        return state
    }
}
