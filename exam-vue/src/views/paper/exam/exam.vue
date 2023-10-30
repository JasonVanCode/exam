<template>

  <div class="app-container">

    <el-row :gutter="24">

      <el-col :span="24">
        <el-card style="margin-bottom: 10px">

          距离比赛结束还有：
          <exam-timer v-model="paperData.leftSeconds" @timeout="doHandler()" />

          <el-button :loading="loading" style="float: right; margin-top: -10px" type="primary" icon="el-icon-plus" @click="handHandExam()">
            {{ handleText }}
          </el-button>

        </el-card>
      </el-col>
      <el-col :span="5" :xs="24" style="margin-bottom: 10px">

        <el-card class="content-h">

<!--          <p class="card-title">答题卡</p>-->
<!--          <el-row :gutter="24" class="card-line" style="padding-left: 10px">-->
<!--            <el-tag type="info">未作答</el-tag>-->
<!--            <el-tag type="success">已作答</el-tag>-->
<!--          </el-row>-->

          <div v-if="paperData.radioList!==undefined && paperData.radioList.length > 0">
            <p class="card-title">单选题</p>
            <el-row :gutter="24" class="card-line">
              <el-tag v-for="item in paperData.radioList" :type="cardItemClass(item.answered, item.quId)" @click="handSave(item)"> {{ item.sort+1 }}</el-tag>
            </el-row>
          </div>

          <div v-if="paperData.multiList!==undefined && paperData.multiList.length > 0">
            <p class="card-title">多选题</p>
            <el-row :gutter="24" class="card-line">
              <el-tag v-for="item in paperData.multiList" :type="cardItemClass(item.answered, item.quId)" @click="handSave(item)">{{ item.sort+1 }}</el-tag>
            </el-row>
          </div>

          <div v-if="paperData.judgeList!==undefined && paperData.judgeList.length > 0">
            <p class="card-title">判断题</p>
            <el-row :gutter="24" class="card-line">
              <el-tag v-for="item in paperData.judgeList" :type="cardItemClass(item.answered, item.quId)" @click="handSave(item)">{{ item.sort+1 }}</el-tag>
            </el-row>
          </div>

          <div v-if="paperData.operList!==undefined && paperData.operList.length > 0">
            <p class="card-title">实操题</p>
            <el-row :gutter="24" class="card-line">

              <el-tag v-for="item in paperData.operList" :type="cardItemClass(item.answered, item.quId)" @click="handSave(item)">{{ item.sort+1 }} </el-tag>

            </el-row>
          </div>

          <shiping style="margin-top: 30px"/>
          <div style="width: 100px; float:left;text-align: center;height: 40px;line-height: 40px;">监考中</div>
        </el-card>

      </el-col>

      <el-col :span="19" :xs="24">

        <el-card class="qu-content content-h">

          <p v-if="quData.quInfo"><pre>{{ quData.sort + 1 }}.{{ quData.quInfo.content }}</pre></p>
          <p v-if="quData.quInfo.image!=null && quData.quInfo.image!=''">
            <el-image :src="quData.quInfo.image" style="max-width:50%;" />
          </p>

          <div v-if="quData.quType === 1 || quData.quType===3">
            <el-radio-group v-model="radioValue">
              <el-radio v-for="item in quData.answerList" :label="item.id"><!--{{ item.abc }}.-->{{ item.answerInfo.content }}
                <div v-if="item.answerInfo.image!=null && item.answerInfo.image!=''" style="clear: both">
                  <el-image :src="'https://code.icmc100.com/api/'+item.answerInfo.image" style="max-width:30%;" />
                </div>
              </el-radio>
            </el-radio-group>
          </div>

          <div v-if="quData.quType === 2">
            <el-checkbox-group v-model="multiValue">
              <el-checkbox v-for="item in quData.answerList" :key="item.id" :label="item.id">{{ item.abc }}.{{ item.answerInfo.content }}

                <div v-if="item.answerInfo.image!=null && item.answerInfo.image!=''" style="clear: both">
                  <el-image :src="'https://code.icmc100.com/api/'+item.answerInfo.image" style="max-width:100%;" />
                </div>
              </el-checkbox>
            </el-checkbox-group>

          </div>
          <div v-if="quData.quType === 4">
            <file-upload :list-type="'file'" :paper-type="1" :user-data="{quId:quData.quId,paperId:quData.paperId}" v-model="quData.fileName" @changeOper="changeOper"/>
          </div>

          <div style="margin-top: 20px" >
            <el-button v-if="showPrevious" type="primary" icon="el-icon-back" @click="handPrevious()">
              上一题
            </el-button>

            <el-button v-if="showNext" type="warning" icon="el-icon-right" @click="handNext()">
              下一题
            </el-button>

          </div>

        </el-card>

      </el-col>

    </el-row>
  </div>

</template>

<script>
import { paperDetail, quDetail, handExam, fillAnswer } from '@/api/paper/exam'
import { Loading } from 'element-ui'
import ExamTimer from '@/views/paper/exam/components/ExamTimer'
import { mapGetters } from 'vuex'
import FileUpload from '@/components/FileUpload'

import Shiping from '@/components/Shiping'
import { deleteData } from '@/api/common'

export default {
  name: 'ExamProcess',
  components: { ExamTimer, FileUpload, Shiping },
  data() {
    return {
      aa: 0,
      noShow: false,
      // 全屏/不全屏
      isFullscreen: false,
      showPrevious: false,
      showNext: true,
      loading: false,
      handleText: '交卷',
      pageLoading: false,
      // 试卷ID
      paperId: 0,
      // 当前答题卡
      cardItem: {},
      allItem: [],
      // 当前题目内容
      quData: {
        answerList: []
      },
      // 试卷信息
      paperData: {
        leftSeconds: 99999,
        radioList: [],
        multiList: [],
        judgeList: [],
        operList: []
      },
      // 单选选定值
      radioValue: '',
      // 多选选定值
      multiValue: [],
      // 已答ID
      answeredIds: [],
      msgBox: {}
    }
  },
  computed: {
    ...mapGetters([
      'userId',
      'roles'
    ])
  },
  mounted() {
    window.addEventListener('beforeunload', (e) => {
      this.beforeunloadHandler(e)
    })
  },
  destroyed() {
    window.removeEventListener('beforeunload', (e) => {
      this.beforeunloadHandler(e)
    })
  },
  created() {
    this.stopF5Refresh()
    const id = this.$route.params.id
    if (typeof id !== 'undefined') {
      this.paperId = parseInt(id)
      this.fetchData(this.paperId)
    }
  },

  methods: {
    stopF5Refresh() {
      document.onkeydown = function(e) {
        var evt = window.event || e
        var code = evt.keyCode || evt.which
        // 屏蔽F1---F12
        if (code > 111 && code < 124) {
          if (evt.preventDefault) {
            evt.preventDefault()
          } else {
            evt.keyCode = 0
            evt.returnValue = false
          }
        }
      }
      // 禁止鼠标右键菜单
      document.oncontextmenu = function() {
        return false
      }
      // 阻止后退的所有动作，包括 键盘、鼠标手势等产生的后退动作。
      history.pushState(null, null, window.location.href)
      window.addEventListener('popstate', function() {
        history.pushState(null, null, window.location.href)
      })
    },

    beforeunloadHandler(e) {
      e = e || window.event
      if (e) {
        e.returnValue = '您是否确认离开此页面-您输入的数据可能不会被保存'
      }
      return '您是否确认离开此页面-您输入的数据可能不会被保存'
    },
    // 答题卡样式
    cardItemClass(answered, quId) {
      if (quId === this.cardItem.quId) {
        return 'warning'
      }

      if (answered) {
        return 'success'
      }

      if (!answered) {
        return 'info'
      }
    },

    /**
     * 统计有多少题没答的
     * @returns {number}
     */
    countNotAnswered() {
      let notAnswered = 0

      this.paperData.radioList.forEach(function(item) {
        if (!item.answered) {
          notAnswered += 1
        }
      })

      this.paperData.multiList.forEach(function(item) {
        if (!item.answered) {
          notAnswered += 1
        }
      })

      this.paperData.judgeList.forEach(function(item) {
        if (!item.answered) {
          notAnswered += 1
        }
      })

      this.paperData.operList.forEach(function(item) {
        if (!item.answered) {
          notAnswered += 1
        }
      })

      return notAnswered
    },

    /**
     * 下一题
     */
    handNext() {
      const index = this.cardItem.sort + 1
      this.handSave(this.allItem[index])
    },
    changeOper(){
      this.cardItem.answered = true
    },

    /**
     * 上一题
     */
    handPrevious() {
      const index = this.cardItem.sort - 1
      this.handSave(this.allItem[index])
    },
    async logout() {
      this.$msgbox.close()
      await this.$store.dispatch('user/logout')
      this.$router.push(`/login`)
    },
    doHandler() {
      this.handleText = '正在交卷，请等待...'
      this.loading = true

      const params = { id: this.paperId }
      handExam(params).then(() => {
        this.msgBox = this.$confirm('比赛提交成功，即将退出系统！', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          showCancelButton: false,
          showConfirmButton: false,
          type: 'success',
          showClose: false,
          closeOnClickModal: false,
          center: true
        })
        setTimeout(this.logout, 3000)
        // if(this.roles.indexOf("student") >= 0){
        //   this.$router.push({ name: 'StudentShowExam', params: { paperId: parseInt(this.paperId)}})
        // }else{
        //   this.$router.push({ name: 'ShowExam', params: { examId: parseInt(this.paperId),userId: parseInt(this.userId) }})
        // }
      })
    },

    // 交卷操作
    handHandExam() {
      const that = this

      // 交卷保存答案
      this.handSave(this.cardItem, function() {
        // const notAnswered = that.countNotAnswered()
        let msg = '确定要结束比赛吗？'
        // if (notAnswered > 0) {
        //   msg = '您还有' + notAnswered + '题未作答，确认要交卷吗?'
        // }
        that.$confirm(msg, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          that.doHandler()
        }).catch(() => {
          that.$message({
            type: 'info',
            message: '交卷已取消，您可以继续作答！'
          })
        })
      })
    },

    // 保存答案
    handSave(item, callback) {
      console.log(this.cardItem)
      const answers = this.multiValue
      if (this.radioValue !== '') {
        answers.push(this.radioValue)
      }
      const params = { paperId: this.paperId, quId: this.cardItem.quId, answers: answers, answer: '' }
      fillAnswer(params).then(() => {
        // 必须选择一个值
        if (answers.length > 0) {
          // 加入已答列表
          this.cardItem.answered = true
        }
        // this.cardItem.answered = true
        // 最后一个动作，交卷
        if (callback) {
          callback()
        }

        // 查找详情
        this.fetchQuData(item)
      })
    },

    // 试卷详情
    fetchQuData(item) {
      const that = this
      console.log(item)
      // 判断在选择实操题之前判断是否单选题已经答完
      if (item.quType == 4) {
        for (const i of this.allItem) {
          console.log('===>', i)
          if (this.aa == 0) {
            if (i.quType != 4 && i.answered == 0) {
              this.$confirm('确认进入实操题吗，将不能再修改选择题！', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
              }).then(() => {
                // deleteData(this.options.deleteUrl, this.selectedIds).then(() => {
                //   this.$message({
                //     type: 'success',
                //     message: '删除成功!'
                //   })
                //   this.getList()
                // })
                this.cardItem.quType = 4
                this.aa = 1
              })

              // that.$message({
              //   type: 'error',
              //   message: '请先做完单选题！'
              // })
              // return
            }
          }
        }
      }
      if (this.cardItem.quType == 4 && item.quType != 4) {
        that.$message({
          type: 'error',
          message: '单选题已提交完，无法选择！'
        })
        return
      }
      // 第一个索引
      if (item.id === this.allItem[0].id) {
        this.showPrevious = false
      } else {
        this.showPrevious = true
      }

      // 最后一个索引
      const last = this.allItem.length - 1

      if (item.id === this.allItem[last].id) {
        this.showNext = false
      } else {
        this.showNext = true
      }

      // 打开
      const loading = Loading.service({
        text: '拼命加载中',
        background: 'rgba(0, 0, 0, 0.7)'
      })

      // 获得详情
      this.cardItem = item

      // 查找下个详情
      const params = { paperId: this.paperId, quId: item.quId }
      quDetail(params).then(response => {
        console.log(response)
        this.quData = response.data
        if (this.quData.quInfo.image != null && this.quData.quInfo.image != '') {
          this.quData.quInfo.image = 'https://code.icmc100.com/api/' + this.quData.quInfo.image
        }

        if (this.quData.quInfo.scimage != null && this.quData.quInfo.scimage != '') {
          this.quData.quInfo.scimage = 'https://code.icmc100.com/api/' + this.quData.quInfo.scimage
        }

        this.radioValue = ''
        this.multiValue = []

        // 填充该题目的答案
        this.quData.answerList.forEach((item) => {
          // if (this.quData.answerList.answerInfo. != null && this.quData.quInfo.scimage != '') {
          //   this.quData.quInfo.scimage = 'https://code.icmc100.com/api/' + this.quData.quInfo.scimage
          // }
          if ((this.quData.quType === 1 || this.quData.quType === 3) && item.checked) {
            this.radioValue = item.id
          }

          if (this.quData.quType === 2 && item.checked) {
            this.multiValue.push(item.id)
          }
        })

        // 关闭详情
        loading.close()
      })
    },

    // 试卷详情
    fetchData(id) {
      const params = { id: id }
      paperDetail(params).then(response => {
        // 试卷内容
        this.paperData = response.data
        const allList = this.paperData.radioList.length + this.paperData.multiList.length + this.paperData.judgeList.length + this.paperData.operList.length
        if (allList < 2) {
          this.showPrevious = false
          this.showNext = false
          this.noShow = true
        }

        // 获得第一题内容
        if (this.paperData.radioList.length > 0) {
          this.cardItem = this.paperData.radioList[0]
        } else if (this.paperData.multiList .length > 0) {
          this.cardItem = this.paperData.multiList[0]
        } else if (this.paperData.judgeList .length >0) {
          this.cardItem = this.paperData.judgeList[0]
        } else if (this.paperData.operList.length > 0 ) {
          this.cardItem = this.paperData.operList[0]
        }

        const that = this

        this.paperData.radioList.forEach(function(item) {
          that.allItem.push(item)
        })

        this.paperData.multiList.forEach(function(item) {
          that.allItem.push(item)
        })

        this.paperData.judgeList.forEach(function(item) {
          that.allItem.push(item)
        })
        this.paperData.operList.forEach(function(item) {
          that.allItem.push(item)
        })
        // 当前选定
        this.fetchQuData(this.cardItem)
      })
    }

  }
}
</script>

<style scoped>

  .qu-content div{
    line-height: 30px;
    width: 100%;
  }

  .el-checkbox-group label,.el-radio-group label{
    width: 100%;
  }

  .content-h{
    height: calc(100vh - 110px);
    overflow-y: auto;
  }

  .card-title{
    background: #eee;
    line-height: 35px;
    text-align: center;
    font-size: 14px;
  }
  .card-line{
    padding-left: 10px
  }
  .card-line span {
    cursor: pointer;
    margin: 2px;
  }

  ::v-deep
  .el-radio, .el-checkbox{
    padding: 9px 20px 9px 10px;
    border-radius: 4px;
    border: 1px solid #dcdfe6;
    margin-bottom: 10px;
    width: 100%;
  }

  .is-checked{
    border: #409eff 1px solid;
  }

  .el-radio img, .el-checkbox img{
    max-width: 200px;
    max-height: 200px;
    border: #dcdfe6 1px dotted;
  }

  ::v-deep
  .el-checkbox__inner {
    display: none;
  }

  ::v-deep
  .el-radio__inner{
    display: none;
  }

  ::v-deep
  .el-checkbox__label{
    line-height: 30px;
  }

  ::v-deep
  .el-radio__label{
    line-height: 30px;
  }

</style>

