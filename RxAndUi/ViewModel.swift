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
        <#statements#>
    }
}
