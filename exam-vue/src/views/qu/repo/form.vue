<template>
  <div class="app-container">

    <el-form ref="postForm" :model="postForm" :rules="rules" label-position="top" label-width="100%">

      <el-card>

        <el-form-item label="题库名称" prop="title">
          <el-input v-model="postForm.title" />
        </el-form-item>

        <el-form-item label="题库备注" prop="remark">
          <el-input v-model="postForm.remark" type="textarea" />
        </el-form-item>

      </el-card>
      <h3>选题信息</h3>
      <el-card style="margin-top: 20px">
        <div>
          <el-button class="filter-item" size="small" type="primary" icon="el-icon-plus" @click="handleAdd">
            添加题目
          </el-button>
          <el-table
            :data="repoList"
            :border="false"
            empty-text="请点击上面的`添加题库`进行设置"
            style="width: 100%; margin-top: 15px"
          >
            <el-table-column
              label="题目类型"
              align="center"
            >
              <!--              @change="chageQuType"-->

              <template v-slot="scope">
                <el-select
                  v-model="scope.row.quType"
                  filterable
                  remote
                  reserve-keyword
                  clearable
                  automatic-dropdown
                  placeholder="请选择题目类型"
                  class="filter-item"
                  @change="((val)=>{chageQuType(val, scope.$index)})"
                >
                  <el-option
                    v-for="item in dataList"
                    :key="item.id"
                    :label="item.title"
                    :value="item.id"
                  />
                </el-select>
              </template>
            </el-table-column>
            <el-table-column
              label="选择题目"
              align="center"
            >
              <template v-slot="scope">
                <el-button type="primary" @click="showQuestion(scope.$index,scope.row.quType,0)" >选题</el-button>
              </template>
            </el-table-column>
            <el-table-column
              label="选中数量"
              align="center"
            >
              <template v-slot="scope">
                <el-input-number v-model="scope.row.quAllNum" :min="0" :controls="false" style="width: 100px" disabled />
              </template>

            </el-table-column>
            <el-table-column
              label="操作"
              align="center"
            >
              <template v-slot="scope">
                <el-button type="primary" icon="el-icon-edit" circle @click="showQuestion(scope.$index,scope.row.quType,1)"/>
                <el-button type="danger" icon="el-icon-delete" circle @click="removeItem(scope.$index)" />
              </template>
            </el-table-column>
          </el-table>

        </div>

      </el-card>
      <div style="margin-top: 20px">
        <el-button type="primary" @click="submitForm">保存</el-button>
        <el-button type="info" @click="onCancel">返回</el-button>
      </div>

    </el-form>

    <el-dialog :visible.sync="dialogTableVisible" title="题目" >
      <el-input v-model="listQuery.params.content" placeholder="题目编码" class="filter-item" />
      <el-table
        ref="multipleTable"
        :data="chooseQuestion.gridData"
        @selection-change="handleSelectionChange"
      >
        <el-table-column
          type="selection"
          align="center"
          width="55"/>
        <el-table-column property="code" label="编码" align="center"/>
        <el-table-column property="content" label="题目" align="center"/>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="confirmChoose(0)">取 消</el-button>
        <el-button type="primary" @click="confirmChoose(1)" >确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>

import { fetchDetail, saveData, fetchQuDetail } from '@/api/qu/repo'
import { fetchList } from '@/api/common'

export default {
  name: 'QuRepoDetail',
  data() {
    return {
      repoId:0,
      listUrl: '/repo/getRepoList',
      chooseQuestion: {
        index: -1,
        gridData: [],
        multipleSelection: []
      },
      gridData: [],
      dataList: [
        {
          id: 1,
          title: '单选题'
        },
        {
          id: 4,
          title: '实操题'
        }
      ],
      listQuery: {
        pages: 1,
        size: 10,
        params: {
          content: '',
          quType: 0,
          repoIds: []
        }
      },
      postForm: {

      },
      dialogTableVisible: false,
      // 题库
      repoList: [],
      loading: false,
      rules: {
        title: [
          { required: true, message: '题库名称不能为空！' }
        ]
      }
    }
  },
  watch: {

    // 检测查询变化
    listQuery: {
      handler() {
        this.getList()
      },
      deep: true
    }
  },
  created() {
    const id = this.$route.params.id
    if (typeof id !== 'undefined') {
      this.repoId = parseInt(id)
      this.fetchData(id)
    }
  },
  methods: {
    /**
     * 查询数据列表
     */
    getList() {
      const self = this
      this.listLoading = true
      this.listQuery.t = new Date().getTime()
      if (this.listQuery.params.quType != 0 && this.listQuery.params.quType!=null) {
        fetchList(this.listUrl, this.listQuery).then(response => {
          self.chooseQuestion.gridData = response.data.records
        })
      }
    },
    // 选择题目类型
    chageQuType(val, index) {
      try {
        this.repoList.forEach((item, key) => {
          if (key != index && item.quType == val) {
            throw new Error('该类型已经存在，请重新选择')
          }
        })
      } catch (e) {
        this.$notify({
          title: '失败',
          message: e.message,
          type: 'error',
          duration: 2000
        })
        this.repoList[index].quType = null
      }
    },
    confirmChoose(type) {
      // 确定按钮
      if (type == 1) {
        this.repoList[this.chooseQuestion.index].quLists = this.chooseQuestion.multipleSelection
        this.repoList[this.chooseQuestion.index].quAllNum = this.chooseQuestion.multipleSelection.length
      }
      this.chooseQuestion = {
        index: -1,
        gridData: [],
        multipleSelection: []
      }
      this.dialogTableVisible = false
    },
    handleSelectionChange(val) {
      this.chooseQuestion.multipleSelection = val
    },
    removeItem(index) {
      this.repoList.splice(index, 1)
    },
    showQuestion(index, quType, isEdit) {
      const self = this
      self.listQuery.params.quType = quType
      if (isEdit == 1 && self.repoList[index].quLists.length == 0) {
        self.$notify({
          title: '失败',
          message: '请先选择题目！',
          type: 'error',
          duration: 2000
        })
        return
      }
      self.dialogTableVisible = true
      fetchQuDetail(quType).then(res => {
        self.chooseQuestion.index = index
        self.chooseQuestion.gridData = res.data
        console.log(self.chooseQuestion.gridData)
        // 新增
        if (isEdit == 0) {
          self.chooseQuestion.multipleSelection = []
        }
        // 编辑
        if (isEdit == 1) {
          self.chooseQuestion.multipleSelection = self.repoList[index].quLists
          setTimeout(function() {
            self.chooseQuestion.gridData.forEach(row => {
              self.repoList[index].quLists.forEach(rowTwo => {
                if (rowTwo.id == row.id) {
                  self.$refs.multipleTable.toggleRowSelection(row)
                }
              })
            })
          }, 500)
        }
      })
    },
    // 添加子项
    handleAdd() {
      this.repoList.push({
        quType: null,
        quLists: [],
        quAllNum: 0
      })
    },
    fetchData(id) {
      const params = { id: parseInt(id) }
      fetchDetail(params).then(response => {
        this.postForm = response.data
        this.repoList =  response.data.repoQuLists
      })
    },
    submitForm() {
      console.log(JSON.stringify(this.postForm))
      // 题目判断
      if (this.repoList.length == 0) {
        this.$notify({
          title: '失败',
          message: '未选择题目！',
          type: 'error',
          duration: 2000
        })
        return
      }
      try {
        this.repoList.forEach(item => {
          if (item.quLists.length == 0) {
            throw new Error('请选择题目')
          }
        })
      } catch (e) {
        this.$notify({
          title: '失败',
          message: e.message,
          type: 'error',
          duration: 2000
        })
        return
      }
      this.$refs.postForm.validate((valid) => {
        if (!valid) {
          return
        }
        saveData({
          title: this.postForm.title,
          remark: this.postForm.remark,
          repoList: this.repoList,
          id :this.postForm.id
        }).then(() => {
          this.$notify({
            title: '成功',
            message: '题库保存成功！',
            type: 'success',
            duration: 2000
          })
          this.$router.push({ name: 'ListRepo' })
        })
      })
    },

    onCancel() {
      this.$router.push({ name: 'ListRepo' })
    }

  }
}
</script>
