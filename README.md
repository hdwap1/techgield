

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
//protocol URLManagerDelegate
//{
//    func onResult(result : Dictionary<String, AnyObject>)
//}
class URLManager : NSObject
{
    
    // var delegate : URLManagerDelegate?
    override init() {
        
    }
    
    func URLCall(method: Alamofire.HTTPMethod, parameters:Dictionary<String, AnyObject>?, url:String,completion: @escaping (_ resultDict: [String:AnyObject]) -> Void)
    {
        var responseDict:Dictionary = [String:AnyObject]()
        
        SVProgressHUD.show()
        
        Alamofire.request(url,method : method, parameters:parameters,encoding: JSONEncoding.default).responseJSON
            { response in
                
                SVProgressHUD.dismiss()
                
                guard response.result.error == nil
                    else
                {
                    print(response.result.error!)
                    return
                }
                print(response.result.value!)
                
                responseDict = response.result.value as! Dictionary<String, AnyObject>
                //self.delegate?.onResult(result: resultDict)
                completion(responseDict)
        }
    }
    
    func URLCallForConversion(method: Alamofire.HTTPMethod, parameters:Dictionary<String, AnyObject>?, url:String,completion: @escaping (_ resultDict: String) -> Void)
    {
        // var responseDict:Dictionary = [String:AnyObject]()
        
        SVProgressHUD.show()
        Alamofire.request(url,method : method, parameters:parameters)
            .responseString
            { response in
                
                SVProgressHUD.dismiss()
                guard response.result.error == nil
                    else
                {
                    print(response.result.error!)
                    return
                }
                print(response.result.value!)

                var responseDict = response.result.value as! String!
                //self.delegate?.onResult(result: resultDict)
                completion(responseDict!)
        }
    }
    
    
    func uploadImageToserver()
    {
        SVProgressHUD.show()
        
        let str = UserDefaults.standard.value(forKey: "token")
        let newUrl = "\(Constants.API_UPDATE_PROFILE_PIC)\(str!)"
        
//        let newUrl = "https://midprice-web.herokuapp.com/v1/CurrencyCode/photo"
//
        Alamofire.upload(multipartFormData: {
            multipartFormData in
            SVProgressHUD.show()
            
//            multipartFormData.append(("image".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!), withName: "file_type")

           multipartFormData.append(self.imageData, withName: "userphoto", fileName: "Image_myimag.png", mimeType: "image/jpeg")
            
        },to: newUrl,  method: .post, headers:nil, encodingCompletion: {
            encodingResult in
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    
                    debugPrint(response)
                    print(response)
                    SVProgressHUD.dismiss()
                   
                    let result = response.result.value as! NSDictionary
                    
                    if result.value(forKey: "code") as! String == "OK"
                    {
                let dict = ((result["data"]! as! NSDictionary).value(forKey: "data")! as! NSArray)[0] as! NSDictionary
                        
                        let json = JSON(dict)
                        self.user = MPUser(json:json)
                        let sessuser = NSKeyedArchiver.archivedData(withRootObject: self.user!)
                        UserDefaults.standard.set(sessuser , forKey:"USERDATA")
                        
                    }
                    else
                    {
                        
                        let actionSheetController: UIAlertController = UIAlertController(title: "Error", message:"Error", preferredStyle:.alert)
                        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel)
                        { action -> Void in
                        }
                        actionSheetController.addAction(cancelAction)
                        self.present(actionSheetController, animated: true, completion: nil)
                    
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
                
                let actionSheetController: UIAlertController = UIAlertController(title:"Error" , message:  (encodingError as NSError).localizedDescription, preferredStyle:.alert)
                
                let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel)
                { action -> Void in
                }
                actionSheetController.addAction(cancelAction)
                DispatchQueue.main.async(execute: {
                    self.present(actionSheetController, animated: true, completion: nil)
                })
            }
        })
    }
func compressImage(_ image:UIImage) -> Data
    {
        
        var compression: CGFloat = 0.9
        let maxCompression: CGFloat = 0.1
        let maxFileSize: Int = 250 * 1024
        var imageData = UIImageJPEGRepresentation(image, compression)
        while imageData!.count > maxFileSize && compression > maxCompression {
            compression -= 0.1
            imageData = UIImageJPEGRepresentation(image, compression)
        }
        
        return imageData!
        
    }
    
}


