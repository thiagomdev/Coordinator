import Foundation

protocol ViewConfig: AnyObject {
    func buildViews()
    func pin()
    func configUI()
    func setup()
}

extension ViewConfig {
    func setup() {
        buildViews()
        pin()
        configUI()
    }
}
