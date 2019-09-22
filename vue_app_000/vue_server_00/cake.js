//vue_server_00/app.js node程序
//1.加载第三方模块
    //web服务器模块
const express=require("express");
    //mysql驱动模块
const mysql=require("mysql");
    //跨域配置
const cors=require("cors");
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
    var sql="SELECT id FROM sqw_user WHERE phone=? AND upwd=md5(?)";
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

//功能二 注册
server.post("/reg",(req,res)=>{
    //获取post请求的数据
    var obj=req.body; //post提交的数据
    //console.log(obj); //打印post提交的数据
    //验证每一项的数据是否为空
    if (!obj.phone )//如果用户名为空 也可用（obj.uname==='' ）
    {
        return;   //阻止往后执行
    }
    if (!obj.upwd)
    {
        return;   //阻止往后执行
    }
    //2.1.1在路由中执行sql语句
    pool.query('INSERT INTO sqw_user SET ?',[obj],(err,result)=>{
         if(err) throw err;
            //console.log(result);
            //判断是否插入成功
    
        if(result.affectedRows>0){
            res.send({code:1,msg:'reg success'});
        }

    });      //res.send('注册成功');//测试

});

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
    var sql="select distinct p.pic_size,p.pic_url,p.id,d.* from danggao d left join picter p on d.id=p.did where p.pic_size='md' group by d.id";
    pool.query(sql,(err,result)=>{
        //console.log(result)
        if(err)throw err;
        res.send(result)
    })
});