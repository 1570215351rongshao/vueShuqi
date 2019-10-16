//vue_server_00/app.js node程序
//1.加载第三方模块
    //web服务器模块
const express=require("express");
    //mysql驱动模块
const mysql=require("mysql");
    //跨域配置
const cors=require("cors");
//解析post body的body-parser
const bodyParser = require('body-parser');
    //session模块
const session=require("express-session");
//2.配置数据库连接池
var pool=mysql.createPool({ 
    host:"127.0.0.1",  //数据库的地址
    user:"root",    //数据库的用户名
    password:"",    //数据库密码
    post:3306,        //数据库端口
    database:"cake",     //数据库名称
    connectionLimit:15    //连接数量
});
//3.配置跨域模块
var server =express();
server.use(cors({
    //允许跨域访问程序的地址列表
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));

//4.配置session模块
 server.use(session({
    secret:"128位字符串",//安全字符串
    resave:true,            //请求时要更新数据
    saveUninitialized:true,
 }));
 //解析post参数

 server.use(bodyParser.json());
//使用body-parser中间件
server.use(bodyParser.urlencoded({extended:false}))
 //4.1配置项目的静态目录
 server.use(express.static("public"));
 //http://127.0.0.1:3000/01.jpg //测试图片有没有写进数据库
//5.启动监听
server.listen(3000);



//功能1：完成用户的登录操作
server.get("/login",(req,res)=>{
    //.1获取网页传递的两个数据 phone upwd
    //参数方式一：?phone=tom&upwd="123"查询字符串
    var phone=req.query.phone;
    var upwd=req.query.upwd;
    //2.sql:查询sq语句
    //数据库：库名  表名 列名  都是小写
    var sql="SELECT id FROM sqw_user WHERE phone=? AND upwd=?";
    //console.log(upwd)
    //3.json:{code:1,msg:"登陆成功"}
    pool.query(sql,[phone,upwd],(err,result)=>{
        //console.log(result)
        if(err) throw err;
        if(result.length==0){
            //console.log(result.length)
            res.send({code:-1,msg:"登录失败"})
            //登陆成功
        }else{
            //1.将登陆成功的姘居保存到session
            //result=[{id:1}] result是一个数组 找id的就是找result的下标为0的id
            req.session.uid=result[0].id; 
            //console.log(req.session);//测试
            //2.将成功数据发送脚手架
            res.send({code:1,msg:"登录成功"})
        }
    })
});

//注册前查询此用户是否已经存在
server.get("/reg_go", (req, res) => {
    //console.log(1)
    var phone = req.query.phone;
    //console.log(2)
   // console.log(phone)
    var sql = "SELECT id FROM sqw_user WHERE 1=1 AND phone=?";
    pool.query(sql, [phone], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.send({ code: -1, msg: "用户名已存在" })
        } else {
            res.send({ code: 1, msg: "用户名可用" })
        }

    })
})
//功能二 注册
server.post("/reg", (req, res) => {
    var obj=req.body;
    //console.log(1)
    //console.log(obj)
    //2.1.1在路由中执行sql语句
    var sql="insert into sqw_user (phone,upwd)values(?,?);"
    pool.query(sql,[obj.phone,obj.upwd],(err,result)=>{
         if(err) throw err;
            //console.log(result);
            //判断是否插入成功
        if(result.affectedRows>0){
            res.send({code:1,msg:'reg success'});
        }

    });      //res.send('注册成功');//测试

});


//req.session.uid=result[0].id; 
//############# 将制定的商品加入购物车########################
 server.get("/addcart",(req,res)=>{
     //参数
     var uid=req.session.uid;
     //console.log(uid)
     if(!uid){
         res.send({code:-1,msg:"请登录"});
         return;
     }
     var id=req.query.id;
     var price=req.query.price;
     var dname=req.query.dname;
      //console.log(id)
      //console.log(price)
     //console.log(dname)
     //查询指定用户是否购买过此商品
  var sql="select id from shopping where uid=? and id=?";
  //console.log(1)
  pool.query (sql,[uid,id],(err,result)=>{
      //console.log(uid)
      //console.log(id)
    if(err)throw err;
    //console.log(2)
     var sql=""
     if(result.length==0){
        // console.log(3)
        // console.log(result.length)
  //没有买过 就添加
         sql=`INSERT INTO shopping(id,uid,dname,price,count)VALUES(${id},${uid},'${dname}',${price},1)`;
         //sql=`INSERT INTO shopping(id,uid,dname,price,count)VALUES(1,1,'草莓蛋糕%100',288,1)`;
        // console.log("没有买过")
     }else{
          //购买过  更新
         sql=`UPDATE shopping SET count=count+1 WHERE uid=${uid} AND id=${id}`;
        // console.log("买过加1")
     }
     //console.log("以下是执行")
 pool.query(sql,(err,result)=>{
    if(err)throw err;
     //console.log(result)
     //console.log("添加")
     res.send({code:1,msg:"添加成功"})
 })
  //返回json
     })
 })
 //购物车数量的接口
 server.get("/Count",(req,res)=>{
     var sql=`UPDATE shopping SET count=1 WHERE uid=${uid} AND id=${id}`;
     pool.query(sql,(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"修改成功"})
     })
 })
 // //http://127.0.0.1:3000/addcart

// //http://127.0.0.1:3000/addcart?id=1&price=49&dname=phone

// //http://127.0.0.1:3000/login?phone=18404963260&upwd=123456
// //功能四：查询当前用户的购物车信息
 server.get("/cart",(req,res)=>{
     //2.获取uid 并且判断如果没有请求登录
       var uid=req.session.uid;
        if(!uid){
             res.send({code:-1,msg:"请登录"});
            return;
         }
     //3.创建sql查询用户购物车内容
     var sql="SELECT id,did,dname,price,count FROM shopping WHERE uid=?";
     //4.获取并返回结果并且发送客户端
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
                res.send({code:1,msg:"查询成功",data:result});
     })
     });
//     //功能五：删除
 server.get("/delete",(req,res)=>{
     //获取参数 id
     var id=req.query.id;
     var sql="DELETE FROM shopping WHERE id=?";
     pool.query(sql,[id],(err,result)=>{
         if(err)throw err;
         if(result.affectedRows>0){
             res.send({code:1,msg:"删除成功"})
         }else{
             res.send({code:-1,msg:"删除失败"})
         }
     })
 });
 //删除所有的商品
 server.get("/del",(req,res)=>{
    var ids=req.query.ids;
    // sql 删除购物车中的多个id
    var sql=`DELETE FROM shopping WHERE id IN(${ids})`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        //如果影响的行数大于0，表示执行成功否则失败
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
//功能三 首页商品 价格 名称
server.get("/product",(req,res)=>{
    var sql="select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size='md' group by d.id";
    pool.query(sql,(err,result)=>{
       // console.log(price)
        if(err)throw err;
        res.send(result)
     })
 });
//功能四 首页商品的图片
server.get("/picter",(req,res)=>{
    var sql='select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size="md" group by d.id';
    pool.query(sql,(err,result)=>{ 
        //console.log(result)
        if(err)throw err;
        res.send(result);
    })
})

//功能5 分页查询蛋糕 id 图片 名称 价格
server.get("/dictionary",(req,res)=>{
    //console.log(1)
    var sql='select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size="md" group by d.id';
    pool.query(sql,(err,result)=>{ 
       // console.log(result)
        if(err)throw err;
        res.send(result);
    })
})

//功能6 天然奶油蛋糕 
server.get("/files",(req,res)=>{
    var sql='SELECT * FROM `danggao` WHERE tid=1';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})
//功能7 巧克力里蛋糕
server.get("/Chocolate",(req,res)=>{
    var sql='SELECT * FROM `danggao` WHERE tid=5';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})
//功能8乳酪蛋糕
server.get("/cheese",(req,res)=>{
    var sql='select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size="md" group by d.id';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})
//功能9 慕斯蛋糕
server.get("/mousse",(req,res)=>{
    var sql='select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size="md" group by d.id';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})

//功能10 大型蛋糕
server.get("/big",(req,res)=>{
    var sql='SELECT * FROM `danggao` WHERE tid=6';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})
//功能11 法式蛋糕
server.get("/french",(req,res)=>{
    var sql='SELECT * FROM `danggao` WHERE tid=2';
    pool.query(sql,(err,result)=>{
        if(err)throw err
        res.send(result)
    })
})

server.get("/cake",(req,res)=>{
    var id = req.query.id;
     id=JSON.parse(id)//JSON.parse将上面的id打印出的对象{"id":"1"}中的1拿出来
     id=parseInt(id.id);//这加parseInt(id.id)为了防止报错，因为di.id是字符串
    //console.log(id)
    var sql=`select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size='md' and d.id=${id} group by d.id`;
    //console.log("sql")
    pool.query(sql,(err,result)=>{
        //console.log(result)
        //console.log("打印result")
        if(err)throw err;
        res.send(result)
    })
});