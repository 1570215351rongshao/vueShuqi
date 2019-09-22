<template>
    <div class="app-login">
            <div class="login_head"><img src="../../../../vue_server_00/public/product/fan.png"/><span>用户登录</span></div>
        <mt-field class="input-mt1" label="手机号" type="text" placeholder="请输入手机号" v-model="phone"></mt-field>
        <mt-field class="input-mt2" label="密码"  type="password" placeholder="请输入密码" v-model="upwd"></mt-field>
        <div class="login_lab">
            <label><input  type="checkbox">7天内自动登录</label>
            <a  href="javascript:;">忘记密码?</a>
        </div>
        <mt-button class="login_font"  size="large" @click="login">登录</mt-button>
        <a class="register" href="javascript:;">没有账号? </a>
        <label @click="regLogin">立即注册</label>
        <div class="login_ti">温馨提示：成功注册会员，登录后首次完善个人信息，即可获赠官网会员20积分。</div>
        <div class="login_bottom">淑棋屋，选用全球优质原料，天然奶油蛋糕，使用进口天然稀奶油.</div>
        <div class="login_image"><img src="../../../../vue_server_00/public/product/msg@48x48.png" alt=""></div>
    </div>
</template>

<script>
export default {
    name:'login',
    data(){
        return{
            phone:"",
            upwd:""
        }
    },
    methods:{
        regLogin(){
            this.$router.push('Reg_s')
            console.log(1)
        },
                login(){
            //完成用户登录的操作
            //3.创建一个正则表达式验证密码
            var reg=/^[0-9A-Za-z]{3,12}$/i;
            //4.要求用户名：3-12位字母数字
            if(!reg.test(this.phone)){
                  //如果验证失败，提示短消息
                this.$messagebox("用户名格式错误")
                return;
            }
            if(!reg.test(this.upwd)){
                  //密码验证失败，提示短消息
                this.$messagebox("密码格式错误")
                return;
            }
            //5.发送ajax请求 axios？
            var url="login"; 
           
            this.axios.get(url,{params:{phone:this.phone,upwd:this.upwd}}).then(res=>{
                //console.log(res);
                 //6.获取服务器返回的结果
            if(res.data.code==-1){
                 // console.log(res.data.code)  
                  this.$messagebox("登录失败")
                    //6.1登录失败 提示
                    //6.2登陆成功 跳转商品首页
                
            }else{
               
                      this.$toast("登录成功")
                 this.$router.push("/Product_s")//将Product这个路由推入路由器，路由自动跳转
              
            }
            })
           
                
        }
    }
}
</script>

<style scoped>
/**/
    .login_lab{
        margin-top:10px;
        display:flex;
        justify-content: space-between;
        padding:10px;
    }
    .login_lab>label{
        font-size:16px; color:#757575;
    }
    .login_lab>a{
         font-size:16px;
        color:#757575;
        text-decoration:none;
    }
    .app-login>a{
        font-size:16px;
        color:#757575;
        text-decoration:none;
    }
    .login_head{
        padding:15px;
        background:#4d4d4d;
        display:flex;
        align-items: center;
    }
    .login_head>span{
        font-size: 16px;
        margin-left:110px;
        color:#fff;
    }
   .login_head>img{
        width:18px;
        height:18px;
       display:flex;
       justify-content: start;
    }
    .input-mt1{
        border-top:1px solid #dedede;
        border-bottom:1px solid #dedede;
        color:red;
        margin-top:20px;
        }
         .input-mt2{
        border-bottom:1px solid #dedede;
         border-top:1px solid #dedede;
        color:red;
        margin-top:10px;
        }
   
    .register{
        display:inline-block;
        padding:10px 5px;
    }
    .login_font{
        color:#fff;
        background:#E4004F;
        margin-top:10px;
    }
    .login_ti{
        padding:15px;
    }
    .login_bottom{
        margin-top:30px;
        font-size: 12px;
        color: #6e6e6e;
    }
    .login_image{
        width:39px;
        height:39px;
        border-radius: 50%;
        background:#e4004f;
        text-align: center;
        position:fixed;
        top:280px;;
        left:320px;
        
    }
    .login_image>img{
        width:24px;
        height:24px;
         margin-top:8px;
    }
</style>

