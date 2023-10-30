<template>
  <div class="app-container">

    <el-row :gutter="24">

      <el-col :span="24" style="margin-bottom: 20px">

        <el-alert
          title="点击`开始比赛`后将自动进入比赛，请诚信比赛！"
          type="error"
          style="margin-bottom: 10px;font-size: 14px;text-align: center"
        />

        <el-card class="pre-exam" style="text-align: center">

          <div><strong>参赛证编号：</strong>{{ userShow.userName }}</div>
          <div><strong>选手姓名：</strong>{{ userShow.realName }}</div>
          <div><strong>比赛名称：</strong>{{ detailData.title }}</div>
          <div><strong>比赛时长：</strong>{{ detailData.totalTime }}分钟</div>
<!--          <div><strong>试卷总分：</strong>{{ detailData.totalScore }}分</div>-->
<!--          <div><strong>及格分数：</strong>{{ detailData.qualifyScore }}分</div>-->
<!--          <div><strong>考试描述：</strong>{{ detailData.content }}</div>-->
<!--          <div><strong>开放类型：</strong> {{ detailData.openType | examOpenType }}</div>-->

        </el-card>

      </el-col>

      <el-col :span="24" style="text-align: center">

        <el-button :loading="loading" type="primary" icon="el-icon-caret-right" @click="handleCreate">
          开始比赛
        </el-button>

<!--        <el-button @click="handleBack">-->
<!--          返回-->
<!--        </el-button>-->

      </el-col>

    </el-row>
  </div>
</template>

<script>
import { fetchDetail } from '@/api/exam/exam'
import { createPaper } from '@/api/paper/exam'
import { getInfo } from '@/api/user'
import { getToken } from '@/utils/auth'

export default {
  data() {
    return {
      userShow: {},
      detailData: {},
      postForm: {
        examId: '',
        password: ''
      },
      rules: {
        password: [
          { required: true, message: '比赛密码不能为空！' }
        ]
      },

      loading: false
    }
  },

  created() {
    this.postForm.examId = parseInt(this.$route.params.examId)
    this.fetchData()
    this.getInfo()
  },

  methods: {
    getInfo() {
      getInfo(getToken()).then(response => {
        this.userShow = response.data
        console.log(this.userShow)
      })
    },
    fetchData() {
      fetchDetail(this.postForm.examId).then(response => {
        this.detailData = response.data
      })
    },

    handleCreate() {
      const that = this
      this.loading = true

      createPaper(this.postForm).then(response => {
        console.log(response)

        if (response.code === 0) {
          setTimeout(function() {
            this.loading = false
            that.dialogVisible = false
            that.$router.push({ name: 'StartExam', params: { id: response.data.id }})
          }, 1000)
        }
      }).catch(() => {
        this.loading = false
      })
    },

    handleBack() {
      this.$router.push({ name: 'ExamOnline' })
    }

  }
}
</script>

<style scoped>
/deep/ .el-alert__content{
  width: 100%!important;
  text-align: center!important;
}
/deep/ .el-alert__title{
    font-size: 15px!important;
    text-align: center!important;
  width: 100%!important;
  }
  .pre-exam div {

    line-height: 42px;
    color: #555555;
  }

</style>

