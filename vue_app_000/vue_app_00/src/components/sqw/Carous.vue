<template>
  <div class="coures">
    <mt-swipe :auto="4000">
      <mt-swipe-item>
          <img src="../../assets/c1.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../assets/c2.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../assets/plb-2.jpg">
      </mt-swipe-item>
      <mt-swipe-item>
           <img src="../../assets/plb-3.jpg">
      </mt-swipe-item>
    </mt-swipe> 
  </div>
</template>
<script>
export default {
  name:'Carous',
    data(){
        return{}
    }

}
</script>
<style scoped>
.coures{
  margin-top:50px;
}
div{
    width:100%;
    height:200px;
}
img{
    width:100%;
    height:100%;
}
</style>
      
 