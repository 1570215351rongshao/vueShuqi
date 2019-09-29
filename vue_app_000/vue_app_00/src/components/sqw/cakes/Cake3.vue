<!--暂时先定这个蛋糕-->
<template>
    <div class="first-top">
         <img src="../../../../../vue_server_00/public/dictionary/1.jpg">
      <div class="first" v-for="(item,j) of cakesInfo" :key="j"> 
          <p class="p1">{{item.dname}}</p>
          <span class="sp1">{{item.detail}}</span>
          <nav class="na">
              <a>购买数量：</a> 
              <button>-</button>
              <span>1</span>
              <button>+</button>
          </nav>
          <div class="d1">价格：<a>￥{{item.price | my-filter}}</a></div>
          <div class="d2">规格:
              <button>20cm</button>
              <button>25cm</button>
              <button>30cm</button>
          </div>
          <div class="b1">
               <mt-button>立即购买</mt-button>
               <router-link tag="mt-button" to="/Car">加入购物车</router-link>
          </div>
      <div class="p3">
          <p>蛋糕类别：天然奶油</p>
          <p>保存条件：{{item.term}}</p>
          <p>特色原料：{{item.stock}}</p>
      </div>
      <div class="img1">
          <img src="../../../../../vue_server_00/public/jingdian/lg-3.jpg">
          <img src="../../../../../vue_server_00/public/jingdian/lg-5.jpg">
          <img src="../../../../../vue_server_00/public/jingdian/lg-6.jpg">
          <img src="../../../../../vue_server_00/public/jingdian/20180719103.jpg">
      </div>
      </div>
    </div>
</template>
<script>
export default {
    name:'Cake3',
    data(){
        return{
            cakesInfo:[]
        }
    },
   
      methods: {
         cake(){
             var url="cake";
             //console.log(url)
             this.axios.get(url).then(res=>{
                 //console.log(res)
                     this.list=res.data;
                      //console.log(res.data[0])
                         this.cakesInfo.push(res.data[5]); 
                        //console.log(this.cakesInfo)                
             })
         }
     },
     created(){
        this.cake()
         // setTimeout(() => {         
         //       console.log(this.cakesInfo)
               // console.log( {}.toString.call(this.cakesInfo)
         // }, 1000);
        
     }
}
</script>
<style scoped>
.first-top{
    margin-top:60px; 
    padding:10px;
    }
.first-top>img{
width:98%;
margin-left:5px;
}
.p1{
    font-size: 16px;
    font-weight: bold;
    color:#000;;
}
.sp1{
    font-size:13px;
    color:#000;
}
.na{
    margin-top:20px;
}
.na>a{
    font-size: 13px;
    color:#000;
}
.na>span{
    margin-left:10px;
    margin-right:10px;
}
.d1{
    margin-top:20px;
    font-size:13px;
}
.d1>a{color:#f00;}
.d2{
    font-size: 14px;
    color:#000;
    margin-top:10px;
}
.d2>button{
    margin-left:10px;
    background:#fff;
}
.b1{
    margin-top:10px;
}
.mint-button--default{
   width:114px;
   height:41px;
   font-size:13px;
   background:#E23A5D;
   color:#fff;
   margin-left:10px;
}
.p3{
    font-size: 0.8rem;
}
.img1 img{
    width:100%;
}
</style>
           