<template>
<div class="product-all">
    
    <!-- 以下是 生日蛋糕 提货卡 面包外卖 全国快递 -->
    <div class="product_title">
        <div>
            <router-link to="/Dictionary">
                 <img src="../../../../vue_server_00/public/product/1_01.png" alt="">
            <span>蛋糕分类</span>
            </router-link>
        </div>
         <div>
            <img src="../../../../vue_server_00/public/product/1_02.png" alt="">
            <span>提货卡</span>
        </div>
         <div>
            <img src="../../../../vue_server_00/public/product/1_03.png" alt="">
            <span>面包外卖</span>
        </div>
         <div>
            <img src="../../../../vue_server_00/public/product/1_04.png" alt="">
            <span>全国快递</span>
        </div>
    </div>
    <div class="product_say">
        <img src="../../../../vue_server_00/public/product/say.png" alt="">
        <span >生日蛋糕提前4个小时订购，祝福语仅限8个字左右</span>
    </div>
   
    <!-- 以下是首页的商品 图片 名称 价格 -->
    <div class="product_parent">
        <div v-for="(item,i) of list" :key="i" >
           <router-link tag="div" class="product_dictionary" :to="{name:'Cake1',params:{id:item.id}}">
           <img  v-lazy="`http://127.0.0.1:3000/${item.pic_url}`" >
           <span>{{item.dname}}</span>
           <div>{{item.price | my-filter}}</div>
           </router-link>
        </div>
    </div>
</div>
</template>

<script>
import Carous from './Carous.vue'
export default {
    name:'product',
    data(){
        return{   
          list:[]
        }
    },
    methods: {
        product(){
            var url="product";
            //console.log(url)
            this.axios.get(url).then(res=>{
                //console.log(res)
                    this.list=res.data;
                    // console.log(res.data)
            })
        }
    },
   created() {
       this.product();
   },
}
</script>

<style scoped>

a{
   text-decoration: none;
}
    .product-all{
        width:100%;
    }
    /*以下是轮播头的 图片 样式*/
    .product_carousel{
       margin-top:60px;
    }

 /* 以下是 生日蛋糕 提货卡 面包外卖 全国快递 */
    .product_title{
        width:100%;
        display:flex;
    }
    .product_title{
        text-align: center;
    }
    .product_title img{
        width:100%;
        height:50%;
    }
    .product_title span{
        font-size:12px;
        color:#6E6E6E;
         font-family: "微软雅黑";
    }
  
    /*以下是say的样式*/
    
    .product_say{
        width:345px;
        background:#fff8e9;
        display:flex;
        align-items: center;
        font-size:12px;
        color:#6e6e6e;
        padding:10px 15px;
    }
    .product_say>img{
        width:16px;
        height:16px;
    }
    .product_say>span{
        padding:0 5px;
    }


/*以下是首页商品 图片 价格 名称 的样式*/
    .product_parent{
       width:100%;
        display: flex;
        flex-wrap:wrap;
        box-sizing: border-box;
    }
   .product_dictionary{
         width:100%;
        display:flex;
        flex-direction: column;
        align-items: center;
        justify-items: center;
        margin-left:20px;
        box-sizing: border-box;
        
   }
  
    .product_dictionary>img{
        width:150px;
        height:140px;
    }
    .product_dictionary>span{
        color:#6E6E6E;
        font-size: 12px;
         font-family: "微软雅黑";
        margin-top:10px;
    }
    .product_dictionary>div{
        color:#c00;
        font-size:12px;
         margin-top:10px;
    }
</style>
