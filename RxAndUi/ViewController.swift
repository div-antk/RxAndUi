//
//  ViewController.swift
//  RxAndUi
//
//  Created by Takuya Ando on 2021/02/10.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    
    private lazy var viewModel = ViewModel(
        idTextObservable: <#T##Observable<String?>#>, passwordTextObservable: <#T##Observable<String?>#>, model: <#T##ModelProtocol#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

