import Vue from 'vue';
import Vuex from 'vuex';
Vue.config.productionTip = false;
Vue.use(Vuex)
export default new Vuex.Store({
    state:{ //state对象里面可以方参数
        count:0,
    },
    mutations:{//mutation执行同步的操作
        increment(state){ //加加
            state.count++
        },
        reduce(state){ //减减
            state.count--
        },
        clear(state){ //购物车商品数量加1
            state.Count=0;//获取购物车数量
        },
    },
    actions: {  //action 提交mutation  action是异步操作
        //context 承上启下
        increment(context) {    // 事件 操作mutation中的increment
          context.commit('increment')
        }, //调用 context.commit 提交一个 mutation
        reduce(context) {     //同上
          context.commit('reduce')
        }
      },
      getters: { //getters是store的计算属性 控制state中count的值
        getState(state) {
          return state.count > 0 ? state.count : 0; 
        },
      }
})