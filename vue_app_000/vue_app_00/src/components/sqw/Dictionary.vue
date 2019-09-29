<template>
  <div>
    <div style="margin-top:60px;">
      <mt-navbar v-model="selected">
        <mt-tab-item id="1">分类</mt-tab-item>
        <mt-tab-item id="2">口味</mt-tab-item>
        <mt-tab-item id="3">销量</mt-tab-item>
      </mt-navbar>

      <!-- tab-container -->
      <mt-tab-container v-model="selected">
        <mt-tab-container-item class="one" id="1">
          <router-link to="/Cheese"><p>天然奶油蛋糕</p></router-link>
          <router-link to="/Files"><p>法式蛋糕</p></router-link>
          <router-link to="/French"><p>乳酪蛋糕</p></router-link>
          <router-link to="/Mousse"><p>慕斯蛋糕</p></router-link>
          <router-link to="/Chocolate"><p>巧克力蛋糕</p></router-link>
          <router-link to="/Bigcake"><p>大型庆典蛋糕</p></router-link>
        </mt-tab-container-item>
        <mt-tab-container-item class="one" id="2">
          <router-link to="/Cheese"><p>天然奶油口味</p></router-link>
          <router-link to="/French"><p>乳酪口味</p></router-link>
          <router-link to="/Mousse"><p>水果蛋糕</p></router-link>
          <router-link to="/Chocolate"><p>巧克力风味</p></router-link>
        </mt-tab-container-item>
        <mt-tab-container-item id="3">

        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <div v-for="(item,i) of list" :key="i">
      <router-link tag="div" class="dictionary_parent" :to="{name:'Cake2',params:{id:item.id}}">
      <img  v-lazy="`http://127.0.0.1:3000/${item.pic_url}`" />
      <div class="dic">
        <div class="dictionary_title">{{item.dname}}</div>
        <span>{{item.detail}}</span>
        <div class="dictionary_price">{{item.price | my-filter}}</div>
      </div>
      </router-link>
    </div>
  </div>
</template>
   
<script>
export default {
  name:'Dictionary',
  data() {
    return {
        selected:1,
      list: []
    };
  },
  methods: {
    dicti() {
      var url = "dictionary";
      // console.log(url)
      this.axios.get(url).then(res => {
        //console.log(res);
        this.list = res.data;
      });
    }
  },
  created() {
    this.dicti();
  }
};
</script>

<style scoped>
a{
text-decoration: none;
color:#000;
}
.one{
  background:rgba(225,225,225,0.4);
}
.dictionary_parent {
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin: 2px 0;
  padding: 2px;
  box-sizing: border-box; /*重新计算宽度*/
  display: flex;
  align-items: center;
}
.dic {
  padding: 0 10px;
}

.dictionary_parent > img[data-v-f05ddbee] {
  width:30%;
  height: 100px;
}
.dictionary_title {
  font-size: 14px;
  padding: 10px 0;
  color:#000;
  font-weight: bold;
}
.dic > span {
  font-size: 12px;
  color:#8b8585;
  
}
.dictionary_price {
  font-size: 14px;
  color: #e3044e;
  margin: 10px 0;
}

</style>


