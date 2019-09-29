                             //贰
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store/index'
//引入第三方组件库 mint-ui  
//1.完整引入mint ui 组件库中所有组件
import MintUI from "mint-ui"
//2.单独引入mint-ui 库中的样式组件
import "mint-ui/lib/style.css"
//3.将mint-ui注册vue实例中
Vue.use(MintUI)
//4.将字体图标引入到当前的项目中
import "./font/iconfont.css"

//5.引入axios第三方的ajax模块
import axios from "axios"
//6.配置axios的基础路径
axios.defaults.baseURL="http://127.0.0.1:3000/"
//7.配置保存axios保存session信息

//以下是轮播组件导入注册
import { Swipe, SwipeItem } from 'mint-ui';
Vue.component(Swipe.name, Swipe);
Vue.component(SwipeItem.name, SwipeItem);

//注册 过滤全局组件 价格前加一个￥符号
Vue.filter('my-filter',function(val){
  if(typeof val==='number'){
  return "￥"+val
  }else{
      return val
  }
})
//以下是脚部组件导入注册
import { Tabbar, TabItem } from 'mint-ui';
Vue.component(Tabbar.name, Tabbar);
Vue.component(TabItem.name, TabItem);
//以下是脚部点击切换组件
import { TabContainer, TabContainerItem } from 'mint-ui';
Vue.component(TabContainer.name, TabContainer);
Vue.component(TabContainerItem.name, TabContainerItem);
//以下是头部组件导如注册
import { Header } from 'mint-ui';
Vue.component(Header.name, Header);
//以下是分类导航栏的引入注册
import { Navbar} from 'mint-ui';
Vue.component(Navbar.name, Navbar);

// 以下是自定义组件*****************
import Product_s from './components/sqw/Product_s'
Vue.component(Product_s.name,Product_s)
//.将axios注册vue实例中
axios.defaults.withCredentials=true
//由于axios不支持use将实力添加到vue的原型上
Vue.prototype.axios=axios;

//路由懒加载
import { Lazyload } from 'mint-ui';
Vue.use(Lazyload);

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
//import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
//import './lib/mui/css/icons-extra.css'

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
