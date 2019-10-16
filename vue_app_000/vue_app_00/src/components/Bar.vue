
<template>
  <div>
    <div>
        <Carous></Carous>
    </div>
    <!-- 以下是列表项 -->
    <product></product>
  </div>
</template>



<script>
import Carous from './sqw/Carous.vue'
  export default {
    name: 'Bar',
    components:{Carous},
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