
import UIKit
import PlaygroundSupport

// Classe - NavigationController
class SecondViewController: UIViewController {
    
    public var labelText = ""
    public var image: UIImage?
    public var labelText2 = ""
    public var image2: UIImage?
    public var labelText3 = ""
    public var image3: UIImage?
    
    public var scrollView = UIScrollView()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        //Scroll View
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: 2300, height: 520 )
        
        scrollView.isPagingEnabled = true
        scrollView.flashScrollIndicators()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        self.view.addSubview(scrollView)
        
        //Label
        let label = UILabel()
        label.text = labelText
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        let label2 = UILabel()
        label2.text = labelText2
        label2.numberOfLines = 0
        label2.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        let label3 = UILabel()
        label3.text = labelText3
        label3.numberOfLines = 0
        label3.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        
        scrollView.addSubview(label)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        
        let imageView = UIImageView (image: image)
        let imageView2 = UIImageView (image: image2)
        let imageView3 = UIImageView (image: image3)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout
        NSLayoutConstraint.activate([
            //Scroll view layout
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            //Label e imagem
            label.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 70),
            label.centerYAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imageView.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 180),
            label2.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1100),
            label2.centerYAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: 45),
            imageView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 800),
            imageView2.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 180),
            label3.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1900),
            label3.centerYAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: 45),
            imageView3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1600),
            imageView3.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 180)
            ])
        
    }
    
}

// Classe principal
class FirstViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        // UI
        self.view.backgroundColor = #colorLiteral(red: 0.254901975393295, green: 0.274509817361832, blue: 0.301960796117783, alpha: 1.0)
        
        let labelTitulo = UILabel()
        labelTitulo.text = "Consoles e seus jogos exclusivos"
        labelTitulo.textColor = .white
        labelTitulo.font = UIFont.boldSystemFont(ofSize: 30)
        labelTitulo.clipsToBounds = true
        labelTitulo.layer.cornerRadius = 10
        
        view.addSubview(labelTitulo)
        
        
        let button1 = UIButton(type: .system)
        button1.setTitle("Nintendo Switch", for: .normal)
        button1.tintColor = #colorLiteral(red: 0.219607844948769, green: 0.00784313771873713, blue: 0.854901969432831, alpha: 1.0)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button1.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button1.backgroundColor = #colorLiteral(red: 0.968627452850342, green: 0.780392169952393, blue: 0.345098048448563, alpha: 1.0)
        button1.contentEdgeInsets = UIEdgeInsetsMake(20, 500, 20, 500)
        button1.tag = 1
        
        view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Playstation 4", for: .normal)
        button2.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button2.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button2.contentEdgeInsets = UIEdgeInsetsMake(20, 500, 20, 500)
        button2.tag = 2
        
        view.addSubview(button2)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("Xbox One", for: .normal)
        button3.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button3.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button3.contentEdgeInsets = UIEdgeInsetsMake(20, 500, 20, 500)
        button3.tag = 3
        
        view.addSubview(button3)
        
        let button4 = UIButton(type: .system)
        button4.setTitle("PC Master Race", for: .normal)
        button4.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button4.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button4.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button4.contentEdgeInsets = UIEdgeInsetsMake(20, 500, 20, 500)
        button4.tag = 4
        
        view.addSubview(button4)
        
        let button5 = UIButton(type: .system)
        button5.setTitle("Nintendo 3DS", for: .normal)
        button5.tintColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        button5.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button5.addTarget(self, action: #selector(openWithNavigation), for: .touchUpInside)
        button5.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button5.contentEdgeInsets = UIEdgeInsetsMake(20, 500, 20, 500)
        button5.tag = 5
        
        
        view.addSubview(button5)
        // Layout
        labelTitulo.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelTitulo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTitulo.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            button1.centerXAnchor.constraint(equalTo: labelTitulo.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: labelTitulo.bottomAnchor, constant: 60),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 60),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 45),
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 45),
            button5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 45)
            ])
        
    }
    
    @objc func openWithNavigation(sender: UIButton) {
        let newVC = SecondViewController()
        
        switch sender.tag {
        case 1:
            newVC.labelText = "Nintendo Switch"
            newVC.image = #imageLiteral(resourceName: "Image 3.png")
            newVC.labelText2 = "Pokken Tornament DX \nA pokemon game where you control the pokemon directly\nand make it fight, for glory, money and the pope."
            newVC.image2 = #imageLiteral(resourceName: "Image 14.png")
            newVC.labelText3 = "The Legend of Zelda: Breath of the Wild \nOne of the contenders for game of the year.\nAn adventure masterpiece where you control the hero of time to save hyrule."
            newVC.image3 = #imageLiteral(resourceName: "Image 15.png")
        case 2:
            newVC.labelText = "Playstation 4"
            newVC.image = #imageLiteral(resourceName: "Image 5.png")
            newVC.labelText2 = "Uncharted 4: A Thief's End \nNathan Drake a worldwide famous treasure hunter has married and decided\nto retire, but one last job takes him back to the world of thieves."
            newVC.image2 = #imageLiteral(resourceName: "Image 21.png")
            newVC.labelText3 = "The Last of Us Remastered \nIn a post-apocaliptic world Joel is hired to take a girl to medical center \nacross the country,but to do that he may have to fight against the \ninfected, or worse, other humans."
            newVC.image3 = #imageLiteral(resourceName: "Image 9.png")
        case 3:
            newVC.labelText = "Xbox One"
            newVC.image = #imageLiteral(resourceName: "Image 4.png")
            newVC.labelText2 = "Halo: The Masterchief Collection \nThis collection brings to the Xbox One the great franchise of Halo."
            newVC.image2 = #imageLiteral(resourceName: "Image 10.png")
            newVC.labelText3 = "Halo 5 \nMaster Chief has to face the ghosts of his past and the distrust of his old allies."
            newVC.image3 = #imageLiteral(resourceName: "Image 11.png")
        case 4:
            newVC.labelText = "PC Master Race"
            newVC.image = #imageLiteral(resourceName: "Image 7.png")
            newVC.labelText2 = "Starcraft 2 \nA masterpiece in the genre of RTS(Real Time Strategy).Was an e-sport."
            newVC.image2 = #imageLiteral(resourceName: "Image 12.png")
            newVC.labelText3 = "League of Legends \nOne of the biggest Mobas in the present days, being highly competitive\nhas captivated many people around the world."
            newVC.image3 = #imageLiteral(resourceName: "Image 13.png")
        case 5:
            newVC.labelText = "Nintendo 3DS"
            newVC.image = #imageLiteral(resourceName: "Image 6.png")
            newVC.labelText2 = "Pokemon Omega Ruby \nOne of the classic Pokemon games has been remade for a new generation."
            newVC.image2 = #imageLiteral(resourceName: "Image 19.png")
            newVC.labelText3 = "Fire Emblem: Awakening \nA turn based strategy game with great story and amazing mechanics."
            newVC.image3 = #imageLiteral(resourceName: "Image 20.png")
        default:
            break
        }
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

let firstViewController = FirstViewController()

PlaygroundPage.current.liveView = UINavigationController(rootViewController: firstViewController)


