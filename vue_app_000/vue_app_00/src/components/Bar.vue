
<template>
  <div style="height:200px;margin-top:60px;">
    <mt-swipe :auto="4000">
      <mt-swipe-item>
          <img src="../../../vue_server_00/public/product/c1.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../../vue_server_00/public/product/c2.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../../vue_server_00/public/product/plb-2.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../../vue_server_00/public/product/plb-3.jpg">
      </mt-swipe-item>
    </mt-swipe> 
    <!-- 以下是列表项 -->
    <product></product>
  </div>
</template>



<script>

  export default {
    name: 'Bar',
    data () {
      return { 
      }
    },
  }
</script>

<style scoped>
div{
    width:100%;
    height:200px;
}
img{
    width:100%;
}

</style>