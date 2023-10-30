<template>

  <div>

    <div class="title-box">
      <div>选手登录</div>
    </div>

    <el-form ref="postForm" :model="postForm" :rules="loginRules">
      <el-form-item prop="username">
        <el-input
          v-model="postForm.username"
          style="width: 100%"
          placeholder="参赛证号"
          prefix-icon="el-icon-user"
        />
      </el-form-item>

      <el-form-item prop="password">
        <el-input
          v-model="postForm.password"
          style="width: 100%"
          placeholder="身份证后6位"
          prefix-icon="el-icon-lock"
        />
      </el-form-item>

      <el-form-item>
        <el-button :loading="loading" type="primary" style="width: 100%" @click.native.prevent="accountLogin">登录</el-button>
      </el-form-item>

    </el-form>

    <div style="display: flex; align-items: center; justify-content: flex-end">
      <!--      <el-link type="primary" href="/#/register">立即注册</el-link>-->
    </div>

  </div>

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      loading: false,
      postForm: {
        username: '',
        password: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', message: '准考证号不能为空' }],
        password: [{ required: true, trigger: 'blur', message: '身份证后6位不能为空' }]
      }
    }
  },
  computed: {
    ...mapGetters([
      'siteData'
    ])
  },
  methods: {

    loginBack(examId) {
      // 其它跳到后台
      if (examId > 0) {
        this.$router.push({ path: '/exam/studentPrepare/' + examId })
      } else {
        this.$router.push({ path: '/' })
      }

      setTimeout(function() {
        this.loading = false
      }, 1800)
    },

    accountLogin() {
      this.$refs.postForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('user/login', this.postForm)
            .then((data) => {
              this.loginBack(data.examId)
            })
            .catch(() => {
              this.loading = false
            })
        }
      })
    }
  }
}
</script>
