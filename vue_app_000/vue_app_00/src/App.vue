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
  <mt-tab-item id="Bar"  @click.native="toggleTab('C')">  
    <img slot="icon" v-show="!s.isC" src="./assets/start2.png">
    <img slot="icon" v-show="s.isC" src="./assets/start1.png">
     首页   
  </mt-tab-item>
  <mt-tab-item id="Dictionary" @click.native="toggleTab('R')">
    <img slot="icon"  v-show="!s.isR" src="./assets/norml2.png">
    <img slot="icon"  v-show="s.isR" src="./assets/norml1.png">
     分类
  </mt-tab-item>  
  <mt-tab-item id="Car" @click.native="toggleTab('D')">
   <img slot="icon"  v-show="!s.isD" src="./assets/shop2.png">
   <img slot="icon"  v-show="s.isD" src="./assets/shop1.png">
     购物车
  </mt-tab-item>
  <mt-tab-item id="Login_s"  @click.native="toggleTab('S')">
     <img slot="icon"  v-show="!s.isS" src="./assets/me2.png">
     <img slot="icon"  v-show="s.isS" src="./assets/me1.png">
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
         active:'首页',
         title:'淑棋屋',
          s: { //分别对应四个 tab
        isC: !1,
        isR: !0,
        isD: !0,
        isS: !0
      },
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
        clear: function(state) { //清空状态
      for (var k in this.s) 
        this.$set(this.s, k, !0);
    },
    toggleTab: function(state) {  //更换图标
      this.clear(state); // 选中前先重置其他tab
      if (this.s["is" + state]) //如果没有选中则取反显示
      	this.$set(this.s, ["is" + state], !1);
    },
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
