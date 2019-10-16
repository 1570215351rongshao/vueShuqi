<template>
    <div class="car">
        <h4 style="color:#E4004F;background:#dedede;padding:8px;">我的购物车</h4>
		<div>
			<label>全选:</label><input type="checkbox"  @change="selectAll" v-model="checkAll"/>
		</div>
		<!-- 购物车商品信息 -->
		<div class="cart-item" v-for="(item,i) of list" :key="i">
			<div class="leftText">
				<input type="checkbox" v-model="item.cb" @change="test"/>
				<div class="dname">{{item.dname}}</div>
				<!-- <button  @click="red" style="margin-left:10px;">-</button>
				<span style="margin-left:10px;margin-right:10px;">{{getCount}}</span>
				<button  @click="add">+</button> -->
				<button style="margin-left:10px;" :data-id=i @click="red">-</button>
				<span style="margin-left:10px;margin-right:10px;">{{item.count}}</span>
				<button :data-id=i @click="add">+</button>
				<div class="price">{{item.price.toFixed(2)}}</div>
			</div>
			<mt-button :data-id="item.id" @click="delItem" style="background:#E4004F; color:#fff;">删除</mt-button>
		</div>
		<!--  -->
		<div>
            <span>{{getCount}}</span>
			<mt-button  @click="delMitem">删除选中的商品</mt-button>
			<label>小计:</label><span></span>
		</div>
					<!-- 
       <div class="btns">
           <mt-button class="btn1">继续购物</mt-button>
           <mt-button class="btn2">去结算</mt-button>
       </div> -->
    </div>
</template>
<script>
export default {
    name:'Car',
    data(){
        return{
			list:[],
             checkAll:false
        }
    },
     computed:{
	 	getCount(){
	 		//  return this.$store.state.count
	 		 return this.$store.getters.getState;
	 	}
	 },
	methods: {
			loadMore(){
            //1.发送请求 cart
            var url="cart";
             this.axios.get(url).then(res=>{
				 console.log(res)
                //2.获取返回的结果
                if(res.data.code==-1){
                   this.$messagebox("提示消息","请登录")
                     //3.如果用户没有执行登录操作
                       //用交互提示登录 /跳转登录组件
                    this.$router.push("/Login_s"); 
                    return;
                }else{
                //4.获取数据成功
                var list=res.data.data;
                //4.1创建循环遍历数组并且为每个元素添加cb属性表示，商品前复选框状态
                //注意先天加cb实行在赋值list 顺序
                //###加载之前先清空
                this.$store.commit("clear");
                for(var item of list){
                    //4.11 添加cb属性表示状态
                  	item.cb=false;
                    //4.12修改共享购物车中数量值
				 this.$store.commit("increment");
                }
                //console.log(list);
                //将list赋值给data中的list
                this.list=list;
                }
             });
		},
		 test(e){
            this.checkAll=true;//默认选中全选
            for(var c of this.list){ //循环判断
              if(!c.cb){ //如果有一项是为选中状态
                  this.checkAll=false; //就取消全选
                  break; //跳出循环
              }
            }
        },
		 selectAll(e){ //事件处理对象 当需要获取点击 但是没有绑定 v-model 需要用e
            
            //1.获取全选按钮状态
			var cb=e.target.checked;
            //console.log(cb) //测试全选按钮是选中是否为true
            //2.创建循环便利购物车数组
            for(var item of this.list){
                    //item.cb是商品的状态    cb是是全选按钮的状态
                item.cb=cb;
            }
            //3.将全选状态赋值购物车商品选中状态
		},
		 delItem(e){ //事件对象
         //获取购物车的指定商品
         var id=e.target.dataset.id;
         //交互提示用户是否删除指定商品
          //同意
           //发送ajxa请求服务器端程序 ？id=id
          this.$messagebox.confirm("消息","是否删除此商品").then(res=>{
                     //               用户点击确定 .then         ↓
             this.axios.get("delete",{params:{id}}).then(result=>{
                 if(result.data.code>0){            
                     this.$toast("删除成功")
                     //返回服务器返回内容
                      //重新调用loadMore()最新购物列表   
                     this.loadMore();
                 }else{
                     this.$toast("删除失败")
                 }
             })
          }).catch(err=>{//用户点击取消的是catch

          })
		},
		 delMitem(){
            //1.创建一个变量来白村多个商品的id
            var str=""; 
            //2.创建一个循环遍历数组，获取状态为true的id值
            for(var item of this.list){
                if(item.cb){//true 当前的商品被选中
                    str+=item.id+",";   
                }
            }
            //2.1 判断用户是否选中了商品
                if(str.length==0){
                     //2.2如果没有选中商品，显示确认消息
                    this.$messagebox("请选择要输入的商品")
                    return;//停止执行
                }
           
             //console.log(str);//测试能不能找到选定的id
            //3.截取字符串中的最后一个小逗号
                     // 起始的下标  保留几个字符
                     //       ↓     ↓
            str=str.substring(0,str.length-1);
            //console.log(str)测试有没有截取成功
            //4.显示交互是的提示框，再次请用户确定操作
            this.$messagebox.confirm("是否删除商品").then(res=>{
                //用户选择确认按钮 发送完返回值
                var ids={ids:str};
                this.axios.get("del",{params:ids}).then(res=>{
                    this.loadMore();
                    this.$toast("删除成功")
                })
            }).catch(err=>{

            })
            //5.发送一个ajax请求删除多个数据
            //6.提示用户删除成功
            //7.重新加载购物车的数据
        },
		//以下是调用store中的count + -
		 red(e){
             var id = e.target.dataset.id;
             if(this.list[id].count>0){
                 this.list[id].count--;
             }
                
		// 	// this.$store.commit('reduce')
               //this.$store.dispatch('reduce')
               
            //    var url="Count";
            //    //console.log(id)
            //     var count=this.list[id].count
            //    this.axios.get(url,{params:{count}}).then(res=>{
            //        var id=session.id;
            //        var uid=session.uid;
            //        console.log(res)
            //        console.log("修改成功")
            //    })
		 },
		 add(e){
		// 	// this.$store.commit('increment')
            //this.$store.dispatch('increment')
             var id = e.target.dataset.id;
                this.list[id].count++;
		 }
		
	},
	created(){
		this.loadMore()
	}
}
</script>
<style scoped>
	.cart-item{
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom:1px solid #ccc;
	}
	.leftText{
		display: flex;
		align-items: center;
	}
	.dname{
		margin-left: 20px;
	}
	.price{
		margin-left:20px;
		color:#E4004F;
	}
	.car{
		padding:10px;
		margin-top:40px;
	}
    .btns{
        margin-top:350px;
        display:flex;
        justify-content: space-between;
    }
    .btn1{
        background:#000;
        width:49%;
        color:#fff;
    }
	 .btn2{
        background:#E4004F;
        width:49%;
        color:#fff;
    }
</style>