//
//  Alert.swift
//  MomCare
//
//  Created by Eissa on 4/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//


import UIKit
import MIAlertController
import PopupDialog
import SwiftEntryKit
import CDAlertView

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class Alert: UIViewController{
    
    class func miAlert(msg:String) -> MIAlertController {
        var yes = ""
        var no = ""
        
        var googlishAlertControllerConfig = MIAlertController.Config()
        
        googlishAlertControllerConfig.firstButtonRatio = 0.5
        googlishAlertControllerConfig.alertViewCornerRadius = 10
        //        googlishAlertControllerConfig.messageLabelTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)//UIColor(white: 0.45, alpha: 1)
        googlishAlertControllerConfig.messageLabelTextColor = UIColor(red: 5, green: 174, blue: 185)
        
        googlishAlertControllerConfig.messageVerticalSpaceFromTitle = 0
        googlishAlertControllerConfig.messageLabelFont = UIFont(name: "Droid Sans-Regular", size: 15) ?? UIFont()
        
        
        googlishAlertControllerConfig.alertMarginSize = CGSize(width: 10, height: 10)
        googlishAlertControllerConfig.alertViewMaxSize = CGSize(width: UIScreen.main.bounds.size.width - 80, height: screenHeight/5)
        
        googlishAlertControllerConfig.titleLabelTextAlignment = NSTextAlignment.left
        googlishAlertControllerConfig.messageLabelTextAlignment = NSTextAlignment.left
        
        var googlishAlertControllerRightButtonConfig = MIAlertController.Button.Config()
        
        var googlishAlertControllerLeftButtonConfig = MIAlertController.Button.Config()
        
        googlishAlertControllerRightButtonConfig.textColor = blueColor
        googlishAlertControllerRightButtonConfig.font = UIFont(name: "Droid Sans-Regular", size: 15) ?? UIFont()
        
        googlishAlertControllerLeftButtonConfig.textColor = blueColor
        googlishAlertControllerLeftButtonConfig.font = UIFont(name: "Droid Sans-Regular", size: 15) ?? UIFont()
        
        
        let alertController = MIAlertController(
            title: nil,
            message: msg,
            config: googlishAlertControllerConfig
        )
        
        if Language.currentLanguage().contains("en") {
            yes = "Yes"
        } else {
            yes = "نعم"
        }
        
        if Language.currentLanguage().contains("en") {
            no = "No"
        } else {
            no = "لا"
        }
        
        return alertController
        
    }
    
    class func showAlertOnVC(target: UIViewController, title: String, message: String) {
        let title = title
        let message = message
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back".localized(), style: .default, handler: nil))
        let titleFont: UIFont = UIFont(name: "Droid Sans-Regular", size: 15)!
        let messageFont: UIFont = UIFont(name: "Droid Sans-Regular", size: 19)!
        
        alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : titleFont]), forKey: "attributedTitle")
        alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.font : messageFont]), forKey: "attributedMessage")
        target.present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(target: UIViewController, title: String, message: String, okAction: String, actionCompletion: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okAction, style: .default, handler: actionCompletion))
        
        //        let titleFont: UIFont = UIFont(name: "Droid Sans-Regular", size: 15)!
        //        let messageFont: UIFont = UIFont(name: "Droid Sans-Regular", size: 19)!
        //
        //        alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : titleFont]), forKey: "attributedTitle")
        //        alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.font : messageFont]), forKey: "attributedMessage")
        target.present(alert, animated: true, completion: nil)
    }
    
    class func showErrorAlert(title : String , body : String){
        var attributes = EKAttributes.topFloat
        //        attributes.entryBackground = .gradient(gradient: .init(colors: [#colorLiteral(red: 0, green: 0.7287534475, blue: 0.7783650756, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.entryBackground = .gradient(gradient: .init(colors: [.init(red: 66, green: 212, blue: 220), .init(red: 66, green: 212, blue: 220)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.7), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: ScreenWidth), height: .intrinsic)
        
        let title = EKProperty.LabelContent(text: title, style: .init(font:UIFont(name: "Droid Sans-Regular", size: 20) ?? UIFont(), color: .white))
        let description = EKProperty.LabelContent(text: body, style: .init(font: UIFont(name: "Droid Sans-Regular-SemiBold", size: 14) ?? UIFont(), color: .white ))
        
        let image = EKProperty.ImageContent(image: UIImage(named: "danger") ?? UIImage(), size: CGSize(width: 35, height: 35))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
    }
}

class AlertDialog: UIViewController {
    
    // MARK: Outlets
    
    // MARK: Popup Dialog examples
    
    /*!
     Displays the default dialog with an image on top
     */
    func showImageDialog(animated: Bool = true) {
        
        // Prepare the popup assets
        let title = "THIS IS THE DIALOG TITLE"
        let message = "This is the message section of the PopupDialog default view"
        let image = UIImage(named: "colorful")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, preferredWidth: 580)
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL") { [weak self] in
            //            self?.label.text = "You canceled the image dialog"
        }
        
        // Create fourth (shake) button
        let buttonTwo = DefaultButton(title: "SHAKE", dismissOnTap: false) { [weak popup] in
            popup?.shake()
        }
        
        // Create second button
        let buttonThree = DefaultButton(title: "OK") { [weak self] in
            //            self?.label.text = "You ok'd the image dialog"
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }
    
    /*!
     Displays the default dialog without image, just as the system dialog
     */
    class func showStandardDialog(animated: Bool = true, target: UIViewController, title: String, message: String) {
        
        // Prepare the popup
        let title = title
        let message = message
        
        // Create the dialog
        let popup = PopupDialog(title: title,
                                message: message,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: true,
                                hideStatusBar: true) {
            print("Completed")
        }
        
        // Create first button
        //        let buttonOne = CancelButton(title: "CANCEL") {
        //            self.label.text = "You canceled the default dialog"
        //            self.dismiss(animated: true, completion: nil)
        //        }
        //
        //        // Create second button
        //        let buttonTwo = DefaultButton(title: "OK") {
        //            self.label.text = "You ok'd the default dialog"
        //        }
        
        // Add buttons to dialog
        //popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        target.present(popup, animated: animated, completion: nil)
    }
    
    /*!
     Displays a custom view controller instead of the default view.
     Buttons can be still added, if needed
     */
    
}

extension UIViewController{
    
    func setAction(title:String , message: String ,actionTitle: String? = nil , handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func showHideAlert(title : String, message : String , handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                guard self?.presentedViewController == alert else { return }
                
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func fireSuccessAction(successMsg: String , handler : ((CDAlertViewAction) -> Void)? = nil) {
        let alert = CDAlertView(title: "SuccessAlert".localized(), message: successMsg, type: .success)
        let action = CDAlertViewAction(title: "Ok".localized(), handler: handler)
            
//        alert.autoHideTime =
        alert.alertBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.01143209357, green: 0.3911819458, blue: 0.3708234429, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
//        alert.hideAnimationDuration = 0.88
        alert.add(action: action)
        alert.show()
    }
    
    func customFailureAlert(msg:String ){
        let alert = CDAlertView(title: "FailedAlert".localized(), message: msg, type: .error)
        alert.autoHideTime = 10
        alert.alertBackgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
        alert.hideAnimationDuration = 0.88
        alert.show()
    }
}
