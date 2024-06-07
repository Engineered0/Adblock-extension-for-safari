//
//  SafariWebExtensionHandler.swift
//  SafeGrid Extension
//
//  Created by Khaled Ali Ahmed on 2024-06-02.
//

import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(adBlockerStatusChanged), name: NSNotification.Name("AdBlockerStatusChanged"), object: nil)
    }

    @objc func adBlockerStatusChanged() {
        let isEnabled = UserDefaults.standard.bool(forKey: "isAdBlockerEnabled")
        // Implement logic to enable or disable ad blocking based on the value of isEnabled
        os_log("AdBlocker status changed: %{public}@", isEnabled ? "Enabled" : "Disabled")
    }

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?["message"] as! [String: Any]
        os_log("Received message: %@", message)
        
        let response = NSExtensionItem()
        response.userInfo = ["message": ["Response to": message]]
        
        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}

