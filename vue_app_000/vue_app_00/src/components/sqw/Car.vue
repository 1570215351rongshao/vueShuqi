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
					<button>-</button>
					<span>1</span>
					<button>+</button>
				</td>
				<td>¥218.00</td>
			</tr>
			<tr>
				<td>缤纷圣果</td>
				<td>¥308.00</td>
				<td>
					<button>-</button>
					<span>1</span>
					<button>+</button>
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
           <mt-button class="btn">继续购物</mt-button>
           <mt-button class="btn">去结算</mt-button>
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
    .btn{
        background:#E4004F;
        width:100px;
        color:#fff;
    }
</style>