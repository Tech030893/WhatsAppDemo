import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var chatTabV: UITableView!
    @IBOutlet weak var chatSegCtrl: UISegmentedControl!
    
    //CHATS Segment
    //Chat Image Array
    let chatImgArr = ["Border Collie","Bulldog","Dobermann","German Shepherd","Golden Retriever","Labrador","Pomeranian","Poodle","Rottweiler","Siberian Husky"]
    //Chat Name Array
    let chatNameArr = ["Gaurav Gujar","Snehal Tawade","Amar Shirke","Shalaka Shere","Shreyas Singh","Kshitija Palande","Mukesh Kuniyal","Priyanka Dhere","Tabbu Shah","Bazil Corda"]
    //Message Array
    let msgArr = ["Whatsup!!","Hello","Forwarded Message","Aloha","How are you?","This message was deleted","Can we Talk?","Who is this?","Chao","Where are you"]
    //Chat Time Array
    let chatTimeArr = ["12:20","11:35","09:40","09:05","08:08","07:22","07:01","06:50","06:20","06:04"]
    
    //STATUS Segment
    //Sections in Status
    let statSecArr = ["","Recent updates","Viewed updates"]
    //Status Image Array
    let statImgArr = ["Siberian Husky","Pomeranian","Dobermann","Rottweiler","Golden Retriever","Bulldog","Labrador","German Shepherd","Poodle","Border Collie"]
    //Status Name Array
    let statNameArr = ["Priyanka Dhere","Bazil Corda","Amar Shirke","Shalaka Shere","Shreyas Singh","Kshitija Palande","Tabbu Shah","Mukesh Kuniyal","Gaurav Gujar","Snehal Tawade"]
    //Status Time Array
    let statTimeArr = ["06:04","06:50","11:35","09:40","09:05","07:22","12:20","08:08","07:01","06:20"]
    
    //CALLS Segment
    //Calls Image Array
    let callImgArr = ["Border Collie","Bulldog","Dobermann","German Shepherd","Golden Retriever","Labrador","Pomeranian","Poodle","Rottweiler","Siberian Husky"]
    //Calls Name Array
    let callNameArr = ["Tabbu Shah","Bazil Corda","Priyanka Dhere","Shreyas Singh","Kshitija Palande","Gaurav Gujar","Snehal Tawade","Shalaka Shere","Mukesh Kuniyal","Amar Shirke"]
    //Calls Time Array
    let callTimeArr = ["11:35","07:01","07:22","09:05","06:04","08:08","06:50","12:20","06:20","09:40"]
    //Calls Audio/Video Image Array
    let audVidImgArr = ["phone","phone","video","phone","video","phone","video","video","phone","video"]
    
    
    override func viewDidLoad()
    {
        //Segment Control Text Color Change
        if ((chatSegCtrl?.selectedSegmentIndex) != nil)
        {
            chatSegCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        }
        chatSegCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        
        super.viewDidLoad()
    }
    
    @IBAction func SegCtrlPress(_ sender: UISegmentedControl)
    {
        //chatSegCtrl.addTarget(self, action: #selector(cameraPress(sender:)), for: .valueChanged)
        print("Selected Segment \(sender.selectedSegmentIndex)")
        chatTabV.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if chatSegCtrl.selectedSegmentIndex == 2
        {
            return statSecArr.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return statSecArr[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if chatSegCtrl.selectedSegmentIndex == 2
        {
            if section == 0
            {
                return 1
            }
            else if section == 1
            {
                return 3
            }
            return 6
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTVC") as! ChatTVC
        
        if chatSegCtrl.selectedSegmentIndex == 0
        {
            chatTabV.isHidden = true
        }
        else if chatSegCtrl.selectedSegmentIndex == 1
        {
            chatTabV.isHidden = false
            cell.profileImg.contentMode = .scaleAspectFill
            cell.profileImg.layer.cornerRadius = cell.profileImg.frame.height/2
            cell.profileImg.image = UIImage(named: chatImgArr[indexPath.row])
            cell.nameLbl.text = chatNameArr[indexPath.row]
            cell.msgLbl.text = msgArr[indexPath.row]
            cell.timeLbl.text = chatTimeArr[indexPath.row]
            cell.callImgV.image = nil
        }
        else if chatSegCtrl.selectedSegmentIndex == 2
        {
            chatTabV.isHidden = false
            cell.profileImg.contentMode = .scaleAspectFill
            cell.profileImg.layer.cornerRadius = cell.profileImg.frame.height/2
            cell.profileImg.image = UIImage(named: statImgArr[indexPath.row])
            cell.nameLbl.text = statNameArr[indexPath.row]
            cell.msgLbl.text = statTimeArr[indexPath.row]
            cell.callImgV.image = nil
            cell.timeLbl.text = ""
        }
        else
        {
            chatTabV.isHidden = false
            cell.profileImg.contentMode = .scaleAspectFill
            cell.profileImg.layer.cornerRadius = cell.profileImg.frame.height/2
            cell.profileImg.image = UIImage(named: callImgArr[indexPath.row])
            cell.nameLbl.text = callNameArr[indexPath.row]
            cell.msgLbl.text = callTimeArr[indexPath.row]
            cell.callImgV.image = UIImage(named: audVidImgArr[indexPath.row])
            cell.timeLbl.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    @objc func cameraPress(sender:UIButton)
    {
        let alert = UIAlertController(title: "CAMERA ALERT", message: "Camera not found", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
            print("Ok Press")
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

class ChatTVC: UITableViewCell
{
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var callImgV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
}
