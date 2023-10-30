<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card class="box">
          <div slot="header" class="clearfix">
            <span>项目信息</span>
            <el-button style="float: right; padding: 3px 0; font-size: 12px" type="text">系统版本：{{ version }}</el-button>

          </div>

          <div style="line-height: 32px;">

            <div class="title">技术栈</div>
            <div class="tags">
              <el-tag>SpringBoot</el-tag>
              <el-tag>Shiro</el-tag>
              <el-tag>MyBatis Plus</el-tag>
              <el-tag>Redis</el-tag>
              <el-tag>JWT</el-tag>
              <el-tag>Vue</el-tag>
              <el-tag>Vue2</el-tag>
              <el-tag>ElementUI</el-tag>
            </div>

          </div>

        </el-card>
      </el-col>
      <el-col :span="8"/>
    </el-row>
  </div>
</template>

<script>
import Shiping from '@/components/Shiping'
import { mapGetters } from 'vuex'
import config from '../../../package.json'
import FileUpload from '@/components/FileUpload'
export default {
  name: 'Dashboard',
  components: { Shiping, FileUpload },
  data() {
    return {
      currentRole: 'adminDashboard',
      version: config.version
    }
  },
  computed: {
    ...mapGetters([
      'roles',
      'siteData'
    ])
  },
  created() {

  }
}
</script>

<style scoped>
.box{
  height: calc(100vh - 120px);
  font-size: 14px;
  line-height: 28px;
}
.title{
  font-size: 18px;
  font-weight: 700;
  padding-bottom: 10px;
  padding-top: 20px;
  margin-bottom: 10px;
  border-bottom: #eee 1px dotted;
}

.tags span{
  margin-right: 10px;
}

.box a{
  color: #20a0ff;
}

.box a:hover{
  color: #ff0000;
}
</style>
