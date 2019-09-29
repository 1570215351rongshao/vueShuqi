import Vue from 'vue';
import Vuex from 'vuex';
Vue.config.productionTip = false;
Vue.use(Vuex)
export default new Vuex.Store({
    state:{ //state对象里面可以方参数
        count:1,
        count2:1
    },
    mutations:{//mutation执行同步的操作
        increment(state){ //加加
            state.count++
        },
        reduce(state){ //减减
            state.count--
        },
        increments(state){ //加加
            state.count2++
        },
        reduces(state){ //减减
            state.count2--
        }
    },
    actions: {  //action 提交mutation  action是异步操作
        //context 承上启下
        increment(context) {    // 事件 操作mutation中的increment
          context.commit('increment')
        }, //调用 context.commit 提交一个 mutation
        reduce(context) {     //同上
          context.commit('reduce')
        },
        increments(context) {    // 事件 操作mutation中的increment
            context.commit('increments')
          }, //调用 context.commit 提交一个 mutation
        reduces(context) {     //同上
            context.commit('reduces')
          }
      },
      getters: { //getters是store的计算属性 控制state中count的值
        getState(state) {
          return state.count > 0 ? state.count : 0; 
        },
        getS(state){
            return state.count2 >0 ? state.count2 : 0;
        }
      }
})