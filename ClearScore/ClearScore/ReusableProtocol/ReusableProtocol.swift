protocol PresenterViewControllerLifeCycleProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()
    func viewWillDisappear()
}

//we will make optional on viewWillAppear, viewDidDisappear, and viewWillDisappear
extension PresenterViewControllerLifeCycleProtocol {
    func viewWillAppear(){}
    func viewDidDisappear(){}
    func viewWillDisappear(){}
}
