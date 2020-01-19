//: A UIKit based Playground for presenting user interface
  
import PlaygroundSupport
import SnapKit
import UIKit

protocol ViewCode {
    func setup()
    func setupHierarchy()
    func buildConstraints()
    func addAdditionalConfiguration()
}

extension ViewCode {
    func setup() {
        setupHierarchy()
        buildConstraints()
        addAdditionalConfiguration()
    }
}


protocol BaseView: ViewCode {}

class View: UIView, BaseView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {}
    
    func buildConstraints() {}
    
    func addAdditionalConfiguration() {}
}

// MARK: View Development

class UnlockView: View {
    
     // MARK: View Elements
    
    lazy var container: UIView = {
        return UIView()
    }()
        
    // MARK: View Code
    
    override func setupHierarchy() {
        addSubview(container)
    }
    
    override func buildConstraints() {
        container.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    override func addAdditionalConfiguration() {
        backgroundColor = .white
        container.backgroundColor = .black
    }
}

// MARK: Present the view

class MyViewController: UIViewController {
    override func loadView() {
        self.view = UnlockView()
    }
}

PlaygroundPage.current.liveView = MyViewController()
