//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//Model for TableView
class Category {
    
    var name: String

    init(name:String) {  // Constructor where name is parameter
        self.name = name
    }
}

class FormViewController: UIViewController {
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.text = "Indice da Seção"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        label.text = "Nome da Categoria"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let sectionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let categoryTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adding Section / Section item"
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) // Set my background color
        
        // Setup section stack view
        let sectionStackView = UIStackView(frame: self.view.bounds)
        sectionStackView.axis = .horizontal
        sectionStackView.distribution = .fillEqually
        sectionStackView.alignment = .fill
        sectionStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        // Inserting elements into my section stack view
        sectionStackView.addArrangedSubview(sectionLabel)
        sectionStackView.addArrangedSubview(sectionTextField)

        
        // Setup category stack view
        let categoryStackView = UIStackView(frame: self.view.bounds)
        categoryStackView.axis = .horizontal
        categoryStackView.distribution = .fillEqually
        categoryStackView.alignment = .fill
        categoryStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Inserting elements into my category stack view
        categoryStackView.addArrangedSubview(categoryLabel)
        categoryStackView.addArrangedSubview(categoryTextField)
        
        
        // Setup form stack view
        let formStackView = UIStackView(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 20, height: 450))
        formStackView.axis = .vertical
        formStackView.distribution = .fillEqually
        formStackView.alignment = .fill
        formStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Inserting elements into my section form view
        formStackView.addArrangedSubview(sectionStackView)
        formStackView.addArrangedSubview(categoryStackView)

        
        //Botão Salvar
        let button = UIButton(type: .roundedRect)
        button.setTitle("SALVAR", for: .normal)
        button.addTarget(self, action: #selector(saveCategory), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
        formStackView.addArrangedSubview(button)
        
        
        self.view.addSubview(formStackView)
        
    } // End of viewDidLoad
    
    
    @objc private func saveCategory(){
        
        let myTableViewController = self.tabBarController?.viewControllers?.first as! MyTableViewController
        
        let section = Int(sectionTextField.text!)
        let categoryName = categoryTextField.text!
        
        myTableViewController.createCategory(section: section!, categoryName: categoryName)
        
    }
    
    
} // End of FormViewController

class MyTableViewController: UITableViewController {
    
    //Datasource for tableview
    var categoryList = [[Category]]() //Declaration for bidimensional array
    
    
    // Method to create a new category into my tableView
    func createCategory(section: Int, categoryName: String) {
        let newCategory = Category(name: categoryName)
        
            while (categoryList.count <= section) {
                // Create new section
                categoryList.append([Category]())
            }
            // Add the category into categoryList
            categoryList[section].append(newCategory)
        
            self.tableView.reloadData()
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Category List"
        
        
        // Creation of section 0
        categoryList.append([Category]())
        
        // Creation of section 1
        categoryList.append([Category]())
        
        // Creation of section 2
        categoryList.append([Category]())
        
        
        // Insert element into section 0
        let category1 = Category(name: "Senac")
        categoryList[0].append(category1)
        
        let category2 = Category(name: "Classes")
        categoryList[0].append(category2)

       
        // Insert element into section 1
        let category1p1 = Category(name: "XCode")
        categoryList[1].append(category1p1)
        
        
        // Insert element into section 1
        let category1p2 = Category(name: "Santo Amaro")
        categoryList[2].append(category1p2)
        
        
        //categoryList[0][0]
    }
    

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0 ,y: 0, width: tableView.frame.width, height: 44))
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width, height: 44))
        label.text = "Seção \(section)"
        view.addSubview(label)
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(categoryList[section].count == 0) {
        return 0
        }
        else {
            return 44
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return categoryList.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryList[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableCell")
        
        let section = indexPath.section
        let row = indexPath.row
        let category = categoryList[section][row]
        
        cell.textLabel?.text = category.name
        
        return cell
        
    }
    
}


class MyTabBarController: UITabBarController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // My First View Controller
        //let tableViewController = MyTableViewController()
        
        // With Navigation Controller
        let tableViewController = UINavigationController(rootViewController: MyTableViewController())
        
    
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        tableViewController.tabBarItem = tabBarItem1
        
        
        // My Second View Controller
        //let formViewController = FormViewController()
        
        // With Navigation Controller
        let formViewController = UINavigationController(rootViewController: FormViewController())
        
        
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        formViewController.tabBarItem = tabBarItem2
        
        // Setup my two ViewController into my TabBarController
        self.viewControllers = [tableViewController, formViewController]
        
    }
    
}





// PlaygroundPage.current.liveView = MyTableViewController()

// PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyTabBarController())

PlaygroundPage.current.liveView = MyTabBarController()

