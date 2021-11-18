//
//  Alerts.swift
//  Superlista
//
//  Created by Thaís Fernandes on 10/11/21.
//

import UIKit

func textFieldAlert(title: String, message: String, placeholder: String, fieldHint: String, actionHandler: @escaping (String?) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: NSLocalizedString("CreateListAlertCancelButton", comment: ""), style: .cancel, handler: nil))
    
    alert.addTextField { textField in
        textField.placeholder = placeholder
        textField.accessibilityLabel = NSLocalizedString("TextFieldAlertLabel", comment: "TextFieldAlertLabel")
        textField.accessibilityHint = fieldHint
    }
    
    alert.addAction(UIAlertAction(title: NSLocalizedString("CreateListAlertMainButton", comment: ""), style: .default, handler: { action in
        actionHandler(alert.textFields?.first?.text)
    }))
    
    if let first = UIApplication.shared.windows.first, let viewController = first.rootViewController {
        viewController.present(alert, animated: true)
    }
}

/**
alertMessage(title: "Teste", message: "teste 2", actions: [
       UIAlertAction(title: "cancel", style: .default) { _ in
           print("cancelar")
       },
       
       UIAlertAction(title: "ok", style: .default) { _ in
           print("ok")
       }
   ])
**/
func alertMessage(title: String, message: String, actions: [UIAlertAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    actions.forEach { action in
        alert.addAction(action)
    }
    
    if let first = UIApplication.shared.windows.first, let viewController = first.rootViewController {
        viewController.present(alert, animated: true)
    }
}
