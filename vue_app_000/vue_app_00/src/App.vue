<template>
 <div class="app-container">
    <!-- 顶部导航栏 -->
     <mt-header  fixed :title="title">
  <div class="di" @click="goback" slot="left">
    <mt-button icon="back">返回</mt-button>  
  </div>
  <mt-button icon="more" slot="right"></mt-button>
</mt-header>
     <!-- 显示组件容器 -->
    <router-view></router-view>
    <!-- 容器两个作用：查找 -->
    <!-- 以下是底部导航栏 -->
     <mt-tabbar v-model="active" fixed>
  <mt-tab-item id="Bar" >  
    <img slot="icon" src="./assets/start2.png">
     首页   
  </mt-tab-item>
  <mt-tab-item id="Dictionary">
    <img slot="icon" src="./assets/norml2.png">
     分类
  </mt-tab-item>  
  <mt-tab-item id="Car">
   <img slot="icon" src="./assets/shop2.png">
     购物车
  </mt-tab-item>
  <mt-tab-item id="Login_s">
     <img slot="icon" src="./assets/me2.png">
     我的
  </mt-tab-item> 
 </mt-tabbar>     
 </div>
</template>
<script>
export default {
   name:'App',
   data(){
      return{
         active:'',
         title:'淑棋屋'
      }
   },
    watch: {
      active: function (newval, oldVal) {
        //console.log(newval)
        // click后打印出当前mt-tab-item的id
       this.$router.push({name:newval})
      }
    },
    methods: {
       goback(){
          this.$router.go(-1)
       }
    },
}
</script>
<style scoped>
 .mint-header{
   background:#E4004F;
  height:60px;
 }
 .di{
    margin:0;
    padding:0;
 }
</style>
