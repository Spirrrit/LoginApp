//
//  AlertManager.swift
//  LoginApp
//
//  Created by Слава on 30.11.2023.
//

import Foundation
import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:  "Dismiss", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

//MARK: - Show validation Alerts
extension AlertManager {
    
    public static func showInvolidEmailALert(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter valid email.")
    }
    public static func showInvolidPasswordlALert(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter valid password.")
    }
    public static func showInvolidUsernameALert(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Invalid Username ", message: "Please enter valid username.")
    }
    
}
//MARK: - Registration Errors
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Unknown Registation Error", message: nil)
    }
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error){
        showBasicAlert(on: vc, title: "Unknown Registation Error", message: "\(error.localizedDescription)")
    }
}
//MARK: - Log In Errors
extension AlertManager {
    
    public static func showSingInErrorAlert(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Unknown Error Sing In", message: nil)
    }
    public static func showSingInErrorAlert(on vc: UIViewController, with error: Error){
        showBasicAlert(on: vc, title: "Error Sing In", message: "\(error.localizedDescription)")
    }
}
//MARK: - Logout Errors
extension AlertManager {
    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error){
        showBasicAlert(on: vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
}
//MARK: - Forgot Password
extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Password Reset Sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error){
        showBasicAlert(on: vc, title: "Error Sending Password Reset", message: "\(error.localizedDescription)")
    }
}

//MARK: - Fetching Users Errors
extension AlertManager {
    public static func showFetchingUserError(on vc: UIViewController, with error: Error){
        showBasicAlert(on: vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    public static func showUnknownFetchingUserError(on vc: UIViewController){
        showBasicAlert(on: vc, title: "Unknown Error Fetching User", message: nil)
    }
}
