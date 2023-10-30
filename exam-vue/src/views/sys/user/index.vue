<template>

  <div>

    <data-table
      ref="pagingTable"
      :options="options"
      :list-query="listQuery"
      @multi-actions="handleMultiAction"
    >

      <template #filter-content>

        <el-input v-model="listQuery.params.userName" style="width: 200px" placeholder="搜索登录名" class="filter-item" />
        <el-input v-model="listQuery.params.realName" style="width: 200px" placeholder="搜索姓名" class="filter-item" />

        <el-button class="filter-item" type="primary" icon="el-icon-plus" @click="handleAdd">
          添加
        </el-button>

        <el-button-group class="filter-item" style="float:  right">
          <el-button size="mini" icon="el-icon-upload2" @click="showImport">导入</el-button>
        </el-button-group>

      </template>

      <template #data-columns>

        <el-table-column
          type="selection"
          width="55"
        />

        <el-table-column
          align="center"
          label="用户名"
        >
          <template v-slot="scope">
            <a @click="handleUpdate(scope.row)">{{ scope.row.userName }}</a>
          </template>

        </el-table-column>

        <el-table-column
          align="center"
          label="姓名"
          prop="realName"
        />

        <el-table-column
          align="center"
          label="角色"
          prop="roleIds"
        />
        <el-table-column
          align="center"
          label="考试安排"
        >
          <template v-slot="scope">
            {{ scope.row.depart?scope.row.depart.deptName:"" }}
          </template>

        </el-table-column>
        <el-table-column
          align="center"
          label="创建时间"
          prop="createdAt"
        />

        <el-table-column
          align="center"
          label="状态"
        >

          <template v-slot="scope">
            {{ scope.row.state | stateFilter }}
          </template>
        </el-table-column>

      </template>
    </data-table>

    <el-dialog :visible.sync="dialogVisible" title="添加用户" width="500px">

      <el-form :model="formData" label-position="left" label-width="100px">

        <el-form-item label="准考证号">
          <el-input v-model="formData.userName" />
        </el-form-item>

        <el-form-item label="姓名">
          <el-input v-model="formData.realName" />
        </el-form-item>

        <el-form-item label="身份证">
          <el-input v-model="formData.identification" placeholder="不修改请留空" />
        </el-form-item>

        <el-form-item label="角色">
          <meet-role v-model="formData.roles" />
        </el-form-item>

        <el-form-item label="考试安排">
          <depart-tree-select v-model="formData.departId" :options="treeData" :props="defaultProps" />
        </el-form-item>

        <!--        <el-form-item label="头像" prop="avatar">-->

        <!--          <single-upload-->
        <!--            v-model="formData.avatar"-->
        <!--          />-->
        <!--        </el-form-item>-->

      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSave">确 定</el-button>
      </div>

    </el-dialog>

    <el-dialog
      :visible.sync="importVisible"
      title="导入会员"
      width="30%"
    >

      <el-row>
        <el-button type="primary" @click="chooseFile">上传导入</el-button>
        <input ref="upFile" class="file" name="file" type="file" style="display: none" @change="doImport">
      </el-row>

    </el-dialog>

  </div>

</template>

<script>
import DataTable from '@/components/DataTable'
import MeetRole from '@/components/MeetRole'
import { saveData } from '@/api/sys/user/user'
import DepartTreeSelect from '@/components/DepartTreeSelect'
import { fetchTree } from '@/api/sys/depart/depart'
import { importExcel } from '@/api/qu/qu'

export default {
  name: 'SysUserList',
  components: { DepartTreeSelect, DataTable, MeetRole },
  filters: {

    // 订单状态
    userState(value) {
      const map = {
        '0': '正常',
        '1': '禁用'
      }
      return map[value]
    }
  },
  data() {
    return {
      importVisible: false,
      treeData: [],
      defaultProps: {
        value: 'id',
        label: 'deptName',
        children: 'children'
      },
      dialogVisible: false,

      listQuery: {
        current: 1,
        size: 10,
        params: {
        }
      },

      formData: {
        avatar: ''
      },

      options: {
        // 列表请求URL
        listUrl: '/exam/api/sys/user/paging',
        // 启用禁用
        stateUrl: '/sys/user/state',
        deleteUrl: '/exam/api/sys/user/delete',
        // 批量操作列表
        multiActions: [
          {
            value: 'enable',
            label: '启用'
          }, {
            value: 'disable',
            label: '禁用'
          },
          {
            value: 'delete',
            label: '删除'
          }
        ]
      }
    }
  },

  created() {
    fetchTree({}).then(response => {
      console.log(11111111)
      console.log(response.data)
      this.treeData = response.data.records

      console.log(this.treeData)
    })
  },

  methods: {
    doImport(e) {
      const file = e.target.files[0]

      importExcel(file).then(res => {
        if (res.code !== 0) {
          this.$alert(res.data.msg, '导入信息', {
            dangerouslyUseHTMLString: true
          })
        } else {
          this.$message({
            message: '数据导入成功！',
            type: 'success'
          })
          this.importVisible = false
          this.$refs.pagingTable.getList()
        }
      })
    },
    chooseFile: function() {
      this.$refs.upFile.dispatchEvent(new MouseEvent('click'))
    },
    showImport() {
      this.importVisible = true
    },
    handleUploadSuccess(response) {
      // 上传图片赋值
      this.formData.avatar = response.data.url
    },

    handleAdd() {
      this.formData = {}
      this.dialogVisible = true
    },

    handleUpdate(row) {
      this.dialogVisible = true
      this.formData = row
      this.formData.roles = row.roleIds.split(',')
      this.formData.password = null

      console.log(JSON.stringify(this.formData))
    },

    departSelected(data) {
      this.formData.departId = data.id
    },
    handleSave() {
      this.formData.role_ids = this.formData.roles[0]
      // this.formData.depart_id = parseInt(this.formData.depart_id)
      // console.log(this.formData)
      // return
      console.log(this.formData)
      const dd = {}
      dd.dataFlag = this.formData.dataFlag
      dd.departId = this.formData.departId
      dd.id = this.formData.id
      dd.identification = this.formData.identification
      dd.realName = this.formData.realName
      dd.roleIds = this.formData.roleIds
      dd.role_ids = this.formData.role_ids
      dd.roles = this.formData.roles
      dd.salt = this.formData.salt
      dd.state = this.formData.state
      dd.userName = this.formData.userName
      saveData(dd).then(() => {
        this.$message({
          type: 'success',
          message: '操作成功!'
        })
        this.dialogVisible = false
        this.$refs.pagingTable.getList()
      })
    },

    // 批量操作监听
    handleMultiAction(obj) {
      if (obj.opt === 'cancel') {
        this.handleCancelOrder(obj.ids)
      }
    }
  }
}
</script>
