//
//  ViewModel.swift
//  RxAndUi
//
//  Created by Takuya Ando on 2021/02/11.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel {
    let validationText: Observable<String>
    let loadLabelColor: Observable<UIColor>
    
    init(idTextObservable: Observable<String?>,
         passwordTextObservable: Observable<String?>,
         model: ModelProtocol) {
        let event = Observable
            .combineLatest(idTextObservable, passwordTextObservable)
            .skip(1)
            .flatMap { idText, passwordText -> Observable<Event<Void>> in
                return model
                    .validate(idText: idText, passwordText: passwordText)
                    .materialize()
            }
            .share()
        
        self .validationText = event
            .flatMap { event -> Observable<String> in
                switch event {
                case .next:
                    return .just("OK!")
                case let .error(error as ModelError):
                    return .just(error.errorText)
                case .error, .completed:
                    return .empty()
                }
            }
            .startWith("IDとパスワードを入力してください")
        
        self.loadLabelColor = event
            .flatMap { event -> Observable<UIColor> in
                switch event {
                case .next:
                    return .just(.green)
                case .error:
                    return .just(.red)
                case .completed:
                    return .empty()
                }
            }
    }
}

extension ModelError {
    fileprivate var errorText: String {
        switch self {
        case .invalidIdAndPassword:
            return "IDとパスワードが未入力です"
        case .invalidID:
            return "IDが未入力です"
        case .invalidPassword:
            return "パスワードが未入力です"
        }
    }
}
