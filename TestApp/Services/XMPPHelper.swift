//
//  XMPPHelper.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit
import XMPPFramework

enum XMPPControllerError: Error {
    case wrongUserJID
}

class XMPPHelper: NSObject {
    var xmppStream: XMPPStream

    let hostName: String
    let userJID: XMPPJID
    let hostPort: UInt16
    let password: String

    init(hostName: String = APIClient.hostName, userJIDString: String, hostPort: UInt16 = APIClient.port, password: String) throws {
        let userJID = userJIDString + APIClient.jidPrefix
        guard let userJID = XMPPJID(string: userJID) else {
            throw XMPPControllerError.wrongUserJID
        }

        self.hostName = hostName
        self.userJID = userJID
        self.hostPort = hostPort
        self.password = password

        // Stream Configuration
        self.xmppStream = XMPPStream()
        self.xmppStream.hostName = hostName
        self.xmppStream.hostPort = hostPort
        self.xmppStream.startTLSPolicy = XMPPStreamStartTLSPolicy.allowed
        self.xmppStream.myJID = userJID

        super.init()

        self.xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
    }
    func connect() {
        if self.xmppStream.isDisconnected {
            print("Stream: isDisconnected")
            
        }
        if !self.xmppStream.isDisconnected {
            print("Stream: !isDisconnected")
            return
        }
//       try! self.xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
        do {
            try xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
                            print("Connection success")
                        } catch {
                            print("Something went wrong!")
                        }

    }
}
extension XMPPHelper: XMPPStreamDelegate {

    func xmppStreamDidConnect(_ stream: XMPPStream) {
        print("Stream: Connected")
        try! stream.authenticate(withPassword: self.password)
    }

    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        self.xmppStream.send(XMPPPresence())
        print("Stream: Authenticated")
    }
}
