
import UIKit
import AVFoundation
import Firebase
class QRViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    var ref : DatabaseReference!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    //declaring variables
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer = AVCaptureVideoPreviewLayer()
    var qrCodeFrameView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the back-facing camera for capturing videos
        /*let deviceDiscoverySession = AVCaptureDevice.DiscoverySession.init(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back)
         
         guard let captureDevice = deviceDiscoverySession.devices.first else {
         print("Failed to get the camera device")
         return
         }*/
        guard let captureDevice = AVCaptureDevice.default(for: .video)
            else
        {
            print("Failed to get camera device")
            return
            
        }
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer)
            
            // Start video capture.
            captureSession.startRunning()
            
            // Move the message label and top bar to the front
            view.bringSubview(toFront: messageLabel)
           // view.bringSubview(toFront: topbar)
            
            // Initialize QR Code Frame to highlight the QR code
            qrCodeFrameView = UIView()
            
            if qrCodeFrameView == qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
            
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                
               
                
                
                if metadataObj.stringValue == "R!e@f#r$e%s^h&m*e(n)t-s=_C9C2"
                {
                    ref = Database.database().reference().child("Users").child(username)
                    ref.observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        let dictionary = snapshot.value as! [String:AnyObject]
                        if dictionary["checkinstatus"]! as! String == "true" {
                            if dictionary["refreshmentstatus"]! as! String == "false" {
                                
                                self.showAlert(title: "Coupon Redeemed", message: "Enjoy your meal")
                                self.messageLabel.text = "Enjoy your meal"
                                self.ref.updateChildValues(["refreshmentstatus"   : "true"])
                                
                            }
                            else {
                                self.showAlert(title: "OOPS!!", message: "Coupon Expired")
                            }
                        }
                        else {
                            self.showAlert(title: "OOPS!!", message: "Your attendance has not been marked")
                        }
                    })
                }
                
                else if metadataObj.stringValue == "A!t@t#e$n%d^a&n*c(e)_C9C2"
                {
                    ref = Database.database().reference().child("Users").child(username)
                    ref.observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        let dictionary = snapshot.value as! [String:AnyObject]
                        if dictionary["checkinstatus"]! as! String == "true" {
                            self.showAlert(title: "Hey!", message: "Your attendance has already been marked")
                            self.messageLabel.text = "Your attendacne has already been marked"
                        }
                        else {
                            self.showAlert(title: "Welcome!!", message: "Your attendance has been marked")
                            self.messageLabel.text = "Welcome!! You may proceed"
                            self.ref.updateChildValues(["checkinstatus":"true"])
                        }
                    })
                }
            }
        }
    }
    
    func showAlert(title :String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let bttn = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        alert.addAction(bttn)
        present(alert, animated: true, completion: nil)
    }
    
}



