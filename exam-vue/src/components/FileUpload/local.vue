<template>
  <div class="content">
    <el-upload
      v-model="fileUrl"
      :action="paperType ==1?server2:server"
      :accept="accept"
      :before-remove="beforeRemove"
      :on-remove="handleRemove"
      :on-success="handleSuccess"
      :data="userData"
      :drag="listType!=='picture'"
      :headers="header"
      :file-list="fileList"
      :list-type="listType"
    >

<!--      :on-exceed="handleExceed"  :limit="limit"-->

      <el-button v-if="listType==='picture'" size="small" type="primary">点击上传</el-button>

      <i v-if="listType!=='picture'" class="el-icon-upload" />
      <div v-if="listType!=='picture'" class="el-upload__text">
        <em>点击上传</em>
      </div>
      <div v-if="tips" slot="tip" class="el-upload__tip">{{ tips }}</div>
    </el-upload>

  </div>

</template>

<script>

import { getToken } from '@/utils/auth'

export default {
  name: 'FileUploadLocal',
  props: {
    paperType :Number,
    value: String,
    accept: String,
    tips: String,
    listType: String,
    limit: {
      type: Number,
      default: 1
    },
    userData:Object

  },
  data() {
    return {
      server: `${process.env.VUE_APP_BASE_API}/api/file/upload`,
      server2:`${process.env.VUE_APP_BASE_API}/api/exam/api/paper/paper/uploadOper`,
      fileList: [],
      fileUrl: '',
      header: {}
    }
  },

  watch: {
    // 检测查询变化
    value: {
      handler() {
        this.fillValue()
      }
    }
  },

  created() {
    this.fillValue()
    this.header = { token: getToken() }
  },

  methods: {

    fillValue() {
      this.fileList = []
      this.fileUrl = this.value

      if (this.fileUrl) {
        this.fileList = [{ name: this.fileUrl, url: this.fileUrl }]
      }
    },

    // 文件超出个数限制时的钩子
    handleExceed() {
      this.$message.warning(`每次只能上传 ${this.limit} 个文件`)
    },
    // 删除文件之前的钩子
    beforeRemove() {
      return this.$confirm(`确定移除文件吗？`)
    },

    // 文件列表移除文件时的钩子
    handleRemove() {
      this.$emit('input', '')
      this.fileList = []
    },

    // 文件上传成功时的钩子
    handleSuccess(response) {
      if (response.code === 1) {
        this.$message({
          type: 'error',
          message: response.msg
        })
        this.fileList = []
        return
      }
      console.log(response.data)
      this.$parent.func2()
      if (response.data && response.data.name){
        this.$emit('input', response.data.name)
      }else{
        this.$emit('input', response.data[0].url)
      }
    }

  }
}
</script>
