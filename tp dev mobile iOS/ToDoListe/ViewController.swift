//  ViewController.swift
//  ToDoList

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1",for:indexPath) as! TableViewCell
        
        let row = indexPath.row
        cell.myText.text=myData[row].task
        cell.myStatus.setOn(myData[row].status, animated: true)
        return cell
    }
    
    var myData : [MyData] = []
    @IBOutlet weak var mytableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableview.dataSource=self
        
      
    }

    @IBAction func unwindToadTask(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! ViewController2
        if  sourceViewController.task.text != "" {
            let tache = sourceViewController.task.text!
            let fait = sourceViewController.statut.isOn
            let descriptionTV = sourceViewController.desc.text!
            let d = MyData(task: tache, status: fait,desc: descriptionTV)
            myData.append(d)
        }
        mytableview.reloadData()
       
    }
    
    @IBAction func unwindTonCancel(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController3{
            let row = mytableview.indexPathForSelectedRow!.row
            vc.mydata =  myData[row]
            
        }
    }
    
    @IBAction func unwindTodelete(_ unwindSegue: UIStoryboardSegue) {
        
        myData.remove(at: mytableview.indexPathForSelectedRow!.row)
        mytableview.reloadData()
    }
    
    @IBAction func unwindToedit(_ unwindSegue: UIStoryboardSegue) {
        let vc = unwindSegue.source as! ViewController4
        myData[mytableview.indexPathForSelectedRow!.row].task = vc.task.text!
        myData[mytableview.indexPathForSelectedRow!.row].desc = vc.desc.text!
        mytableview.reloadData()
    }
}

