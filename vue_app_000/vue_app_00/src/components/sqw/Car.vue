<template>
    <div class="car">
        <h4 style="color:#E4004F;background:#dedede;padding:5px;">我的购物车</h4>
       <table id="data">
		<thead>
			<tr>
				<th>蛋糕</th>
				<th>数量</th>
				<th>价格</th>
				<th>小计</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>经典100%</td>
				<td>¥218.00</td>
				<td>
					<button  @click="red">-</button>
					<span>{{getCount}}</span>
					<button  @click="add">+</button>
				</td>
				<td>¥218.00</td>
			</tr>
			<tr>
				<td>缤纷圣果</td>
				<td>¥308.00</td>
				<td>
					<button @click="reds">-</button>
					<span>{{getCount2}}</span>
					<button @click="adds">+</button>
				</td>
				<td>¥308.00</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">Total: </td>
				<td>¥526.00</td>
			</tr>
		</tfoot>
	</table>
       <div class="btns">
           <mt-button class="btn1">继续购物</mt-button>
           <mt-button class="btn2">去结算</mt-button>
       </div>
    </div>
</template>
<script>
export default {
    name:'Car',
    data(){
        return{
            
        }
    },
    computed:{
		getCount(){
			//  return this.$store.state.count
			 return this.$store.getters.getState;
		},
		getCount2(){
			// return  this.$store.state.count2
			 return this.$store.getters.getS;
		}
	},
	methods: {
		red(){
			// this.$store.commit('reduce')
			 this.$store.dispatch('reduce')
		},
		add(){
			// this.$store.commit('increment')
			 this.$store.dispatch('increment')
		},
		reds(){
			// this.$store.commit('reduces')
			 this.$store.dispatch('reduces')
		},
		adds(){
			// this.$store.commit('increments')
			 this.$store.dispatch('increments')
		}
	},
}
</script>
<style scoped>
.car{
    padding:10px;
    margin-top:40px;
}
table{
        width:100%; 
        border-collapse:collapse;
	    text-align:center;
        color:#E4004F;
	}
	td,th{border:1px solid #ccc}
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