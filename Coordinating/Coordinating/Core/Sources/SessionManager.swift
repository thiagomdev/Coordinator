import Foundation

protocol SessionManagerProtocol {
    func startSession()
    func finishSession()
    var session: Bool { get }
}

final class SessionManager {
    static let shared: SessionManager = .init()
    
    private var hasSession: Bool {
        get { UserDefaults.standard.bool(forKey: "hasSession") }
        set { UserDefaults.standard.setValue(newValue, forKey: "hasSession") }
    }
}

extension SessionManager: SessionManagerProtocol {
    func startSession() {
        hasSession = true
    }
    
    func finishSession() {
        hasSession = false
    }
    
    var session: Bool {
        return hasSession
    }
}
