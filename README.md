# NetworkManager
Generic Network Manager Class

    class ViewController: UIViewController {

     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view, typically from a nib.
        
          NetworkManager.request(url: USURL.googleURL(), method: .get, parameters: [:], progressText: "Please wait", showErrorMessage: true, vc: self) { (success, result) in
              if success {
                  // TODO in case of success
              }
              else{
              // TODO in case of failure
          }
      }

    }
