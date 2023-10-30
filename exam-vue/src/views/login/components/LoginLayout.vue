<template>

  <div class="login-container">

    <div class="login-box">

      <div class="logo-box">
        <div>
          <a class="logo-title">
            <span class="site-title">考试系统</span>
          </a>
        </div>
      </div>

      <app-main />

    </div>

    <div class="footer" v-html="siteData.copyRight" />

  </div>

</template>

<script>
import { mapGetters } from 'vuex'
import AppMain from '@/layout/components/AppMain'

export default {
  name: 'LoginLayout',
  components: { AppMain },
  computed: {
    ...mapGetters([
      'siteData'
    ])
  }
}
</script>

<style lang="scss" scoped>
@import "~@/styles/login.scss";

</style>

