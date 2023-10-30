<template>
  <div>
    <file-upload-local v-model="fileUrl" :accept="accept" :tips="tips" :list-type="listType" :paper-type="paperType" :user-data="userData"/>
  </div>
</template>

<script>

import FileUploadLocal from './local'

export default {
  name: 'FileUpload',
  components: { FileUploadLocal },
  props: {
    paperType :Number,
    value: String,
    accept: {
      type: String,
      default: '*'
    },
    tips: String,
    listType: {
      type: String,
      default: 'picture'
    },
    userData:Object
  },
  data() {
    return {
      fileUrl: ''
    }
  },

  watch: {
    // 检测查询变化
    value: {
      handler() {
        this.fillValue()
      }
    },

    // 检测查询变化
    fileUrl: {
      handler() {

        this.$emit('input', this.fileUrl)
      }
    }
  },
  mounted() {

  },

  created() {
    this.fillValue()
  },

  methods: {
    func2(){
      this.$emit('changeOper')
    },
    fillValue() {
      this.fileUrl = this.value
    }

  }
}
</script>
