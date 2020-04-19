# MeiTuan
仿美团首页菜单功能
- MTMenuView 菜单视图 Xib描述   
class func menuView(icon:UIImage?,title:String,des:String) -> MTMenuView{}  //初始化类方法

func addTarget(target:Any?,action:Selector){}  //按钮添加事件方法

- MTHomeVC

//导航栏 修改背景图片
navigationController?.navigationBar .setBackgroundImage(UIImage(named: "bg_navigationBar_normal"), for: UIBarMetrics.default)


//1.设置导航栏左侧的logo 以及 3个菜单视图
        let logoView = UIImageView(image:UIImage(named: "icon_meituan_logo"))
        let logoItem = UIBarButtonItem(customView: logoView)
        let menu1 = createItem(imageName: "icon_category_-1", title: "美团网", des: "全部分类")
        let menu2 =  ...
        let menu3 = ...
        navigationItem.leftBarButtonItems = [logoItem,menu1.item,menu2.item,menu3.item] 

func createItem(imageName:String,title:String,des:String) -> (item:UIBarButtonItem,menu:MTMenuView ){}  //创建导航栏Item 方法 返回一个元组 

//元祖中 取出 MTMenuView 对象 调用添加按钮事件方法 使得 不同的 视图有不同的对应的点击相应方法
menu1.menu.addTarget(target: self, action: #selector(category))  
menu2.menu.addTarget(target: self, action: #selector(address))
menu3.menu.addTarget(target: self, action: #selector(sort))

var currentpoper : UIPopoverController?
@objc func category(){
    print("分类")
    currentpoper?.dismiss(animated: true)   //先让原先的pop 消失后再弹出新的pop 
    //1.创建pop 重点
    let content = ContentVC()
    let popver = UIPopoverController(contentViewController: content)
    currentpoper = popver //赋值
    //2.弹出
    let barItem = navigationItem.leftBarButtonItems![1]
    popver.present(from: barItem, permittedArrowDirections: .any, animated: true)
}
