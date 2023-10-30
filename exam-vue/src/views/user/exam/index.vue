<template>

  <div>
    <data-table
      ref="pagingTable"
      :options="options"
      :list-query="listQuery"
    >
      <template #filter-content>

        <el-input v-model="listQuery.params.realName" placeholder="搜索人员" style="width: 200px;" class="filter-item" />

      </template>

      <template #data-columns>

        <el-table-column
          label="人员"
          prop="realName"
          align="center"
        />

        <el-table-column
          label="考试开始时间"
          prop="createdAt"
          align="center"
        />

        <el-table-column
          label="考试结束时间"
          prop="updatedAt"
          align="center"
        />

        <el-table-column
          label="操作"
          align="center"
        >
          <template v-slot="scope">
            <el-button type="primary" size="mini" icon="el-icon-view" @click="handleExamDetail(scope.row.paperId,scope.row.examId)">考试明细</el-button>
          </template>

        </el-table-column>

      </template>

    </data-table>

    <el-dialog :visible.sync="dialogVisible" title="考试明细" width="60%">

      <div class="el-dialog-div">
        <my-paper-list :exam-id="examId" :user-id="userId" />
      </div>

    </el-dialog>

  </div>

</template>

<script>
import DataTable from '@/components/DataTable'
import MyPaperList from './paper'

export default {
  name: 'ExamUserList',
  components: { MyPaperList, DataTable },
  data() {
    return {

      dialogVisible: false,
      examId: '',
      userId: '',

      listQuery: {
        current: 1,
        size: 10,
        params: {
          examId: 0,
          id: 0,
          realName: ''
        }
      },

      options: {
        // 可批量操作
        multi: false,
        // 列表请求URL
        listUrl: '/exam/api/paper/paper/pagings'
      }
    }
  },

  created() {
    this.listQuery.params.id = parseInt(this.$route.params.examId)
  },
  methods: {

    // 开始考试
    handleExamDetail(examId, userId) {
      this.$router.push({ name: 'ShowExam', params: { examId: examId, userId: userId }})
      // this.examId = examId
      // this.userId = userId
      // this.dialogVisible = true
    },

    handlerExamBook(examId) {
      this.$router.push({ name: 'BookList', params: { examId: examId }})
    }
  }
}
</script>

<style scoped>

  .el-dialog-div{
    height: 60vh;
    overflow: auto;
    padding: 10px;
  }

</style>
