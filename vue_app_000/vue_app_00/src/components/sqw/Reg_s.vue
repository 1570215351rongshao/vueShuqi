<template>
    <div class="app-reg">
         <div class="reg_head"><img src="../../../../vue_server_00/public/product/fan.png"/><span>用户注册</span></div>
         <mt-field class="mt-input" label="手机号" type="text" placeholder="请输入您的手机号"></mt-field>
         <mt-field class="mt-input" label="密码" type="password" placeholder="请输入密码"></mt-field>
         <mt-button class="reg_font" size="large">注册</mt-button>
        <p @click="reg">已有账户,请登录</p>
         <div class="reg_ti">温馨提示：成功注册会员，登录后首次完善个人信息，即可获赠官网会员20积分。</div>
        <div class="reg_bottom">淑棋屋，选用全球优质原料，天然奶油蛋糕，使用进口天然稀奶油.</div>
          <div class="reg_image"><img src="../../../../vue_server_00/public/product/msg@48x48.png" alt=""></div>
    </div>
</template>

<script>
export default {
    data(){
        return{}
    },
    methods: {
        reg(){
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
        top:320px;;
        left:320px;
        
    }
    .reg_image>img{
        width:24px;
        height:24px;
         margin-top:8px;
    }
</style>

