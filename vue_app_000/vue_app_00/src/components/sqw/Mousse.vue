<template>
    <div>
         <div class="lunbo_top">
           <Carous></Carous>
        </div>
        <div>
            <p>分类</p>
        </div>
        <div class="dictionary_parent" v-for="(item,i) of list" :key="i">
            <img :src="`http://127.0.0.1:3000/${item.pic_url}`" >
            <div class="dic">
            <div class="dictionary_title">{{item.dname}}</div>
            <span>{{item.detail}}</span>
            <div class="dictionary_price">￥{{item.price}}</div>
            </div>
        </div>
    </div>
</template>

<script>
import Carous from './Carous.vue'
export default {
    components:{Carous},
    data(){
        return{
            list:[]
        }
    },
    methods: {
        mousse(){
            var url="mousse"
            this.axios.get(url).then(res=>{
               this.list=res.data
               //console.log(res)
            })
        }
    },
    created() {
        this.mousse()
    },
}
</script>

<style scoped>
 


    .dictionary_parent{
       width:100%;
        border:1px solid #ccc;
        border-radius: 5px;
        margin:2px 0;
        padding:2px;
        box-sizing: border-box;/*重新计算宽度*/
        display:flex;
       align-items: center;
    }
    .dic{
        padding:0 10px;
    }
    .dictionary_parent>img{
        width:100px;
        height:100px;
    }
    .dictionary_title{
        font-size:14px;
           padding:10px 0;
    }
    .dic>span{
        font-size:12px;
        color:#6e6e6e;
      
    }
    .dictionary_price{
        font-size:14px;
        color:#E3044E;
        margin:10px 0; 
    }
</style>