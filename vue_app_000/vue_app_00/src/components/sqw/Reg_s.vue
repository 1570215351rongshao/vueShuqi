<template>
    <div class="app-reg">

         <div class="reg_head"><img src="../../../../vue_server_00/public/product/fan.png"/><span>用户注册</span></div>


         <mt-field class="mt-input" label="手机号" type="text"  v-model="phone"  placeholder="请输入手机号" ></mt-field>

         <mt-field class="mt-input" label="密码" type="password" placeholder="请输入3-9位密码" v-model="upwd"></mt-field>


         <mt-button class="reg_font" size="large" @click="reg">注册</mt-button>
        <div class="register">
             <a>已有账号？</a>
            <label @click="reg_login">请登录</label>
        </div>
         <div class="reg_ti">温馨提示：成功注册会员，登录后首次完善个人信息，即可获赠官网会员20积分。</div>
        <div class="reg_bottom">淑棋屋，选用全球优质原料，天然奶油蛋糕，使用进口天然稀奶油.</div>
          <div class="reg_image"><img src="../../../../vue_server_00/public/product/msg@48x48.png" alt=""></div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            phone:"",
            upwd:""
        }
    },
    methods: {
     reg() {
     var reg = /^1[3-9]\d{9}$/;
      //如果验证通过！
      var a=true
      if (this.phone) {
        if (reg.test(this.phone) == true) {
         a=true;
        } else {
          this.$toast("手机号格式不正确")
         a=false;
        }
      } else {
         this.$toast("手机号不能为空")
         a=false;
      }
       var regb = /^[0-9A-Za-z]{3,12}$/i;
      if (this.upwd) {
        //如果验证通过！
        if (regb.test(this.upwd) == true) {
          a=true;
        } else {
            this.$toast("密码格式不正确")
         a=false;
        }
      } else {
         this.$toast("密码不能为空")
       a=false;
      }
      if(a==false){
          return false
      }else{
          var url = "reg_go";
          this.axios(url, { params: { phone: this.phone } }).then(res => {
            if (res.data.code == -1) {
              this.$toast("手机号已存在");;
            } else {
          var phone=this.phone
          var upwd=this.upwd
          var url="reg";
            this.axios.post(url,{phone,upwd}).then(res => {
                if (res.data.code == 1) {
                   // console.log(2)
                   // console.log("注册成功")
                    this.$toast("注册成功")
                    this.$router.push("Login_s");
                }
                if (res.data.code == -1) {
                   // console.log("注册失败");
                }
                });
            }
          });
    }
             
    },

        reg_login(){
            this.$router.push("Login_s")
        }
    },
}
</script>

<style scoped>
    .reg_head{
         padding:15px;
        background:#4d4d4d;
        display:flex;
        align-items: center;
     
    }
    .reg_head>span{
        font-size: 16px;
        margin-left:110px;
        color:#fff;
    }
     .reg_head>img{
        width:18px;
        height:18px;
       display:flex;
       justify-content: start;
    }
    .mt-input{
        border-bottom:1px solid #dedede;
        margin-top:10px;
    }
    .mt-input input{
        padding:10px;
        color:#fff;
        background:#EE6F4E;
    }
    .reg_font{
         color:#fff;
        background:#E4004F;
        margin-top:20px;
    }
    .reg_ti{
        padding:15px;
    }
    .reg_bottom{
        margin-top:30px;
        font-size: 12px;
        color: #6e6e6e;
    }
    .reg_image{
        width:39px;
        height:39px;
        border-radius: 50%;
        background:#e4004f;
        text-align: center;
        position:fixed;
        top:232px;;
        left:320px;
        
    }
    .reg_image>img{
        width:24px;
        height:24px;
         margin-top:8px;
    }
     .register {
      padding-top:20px;
    }
    .register>a{
        color:#000;
    }
    .register>label{
        color:#E4004F;
    }
</style>

