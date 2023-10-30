<template>

  <div class="camera_outer">

    <video id="videoCamera" width="100px" height="100px" autoplay/>

    <canvas id="canvasCamera" style="display:none;" width="400px" height="400px" />

    <div v-if="imgSrc" class="img_bg_camera">

      <img :src="imgSrc" alt="" class="tx_img">

    </div>
    <button style="display: none" @click="shangchuang()">获取upToken</button>
    <button ref="inputResult" style="display: none" @click="getCompetence()">打开摄像头</button>

    <button style="display: none" @click="stopNavigator()">关闭摄像头</button>

    <button ref="setResult" style="display: none" @click="setImage()">拍照</button>

  </div>

</template>

<script>

import * as qiniu from 'qiniu-js'
import { shangchuan } from '@/api/common'
import { getUpToken, getUsername, setUpToken } from '@/utils/auth'
export default {

  data() {
    return {

      videoWidth: 400,

      videoHeight: 400,

      imgSrc: '',

      thisCancas: null,

      thisContext: null,

      thisVideo: null,
      upToken: null
    }
  },
  created() {
    this.shangchuang()
    this.$nextTick(() => { this.$refs.inputResult.click() })
    this.times = setInterval(() => {
      this.$nextTick(() => { this.$refs.setResult.click() })
    }, 30000)
  },
  methods: {
    shangchuang() {
      // this.upToken = getUpToken()
      // console.log(this.upToken)
      // if (this.upToken === '' || this.upToken === null || this.upToken ===undefined) {
      //
      // }
      shangchuan('/file/upToken').then((res) => {
        this.upToken = res.data
        setUpToken(this.upToken)
        return
      }).catch((e) => {
        this.$message.error(e.message)
      })
      console.log(this.upToken)
    },

    // 调用权限（打开摄像头功能）
    upLoadFun(file) {
      const config = { useCdnDomain: true, region: qiniu.region.z0 }
      const putExtra = { fname: file, params: { id: 1 }, mimeType: null }
      // 开始上传  token 需要找后端获取(单独的方法)

      const key = getUsername() + '/' + Date.now() + '.png'
      const upToken = this.upToken
      const headers = qiniu.getHeadersForMkFile(upToken)
      // file 是获取到的文件对象
      // key 是文件名字，传null将使用hash值来当作文件名
      const options = {
        quality: 0.9,
        noCompressIfLarger: true
        // maxWidth: 1000,
        // maxHeight: 618
      }
      qiniu.compressImage(file, options).then(data => {
        // const observable = qiniu.upload(data.dist, key, upToken, putExtra, config)
        // const subscription = observable.subscribe(observer) // 上传开始
        const observable = qiniu.upload(data.dist, key, upToken, headers, putExtra, config)
        this.subscription = observable.subscribe(observe)
      })
      //


      const observe = {
        next(res) {
          // console.log('已上传大小，单位为字节：' + res.total.loaded)
          // console.log('本次上传的总量控制信息，单位为字节：' + res.total.size)
          // console.log('当前上传进度，范围：0～100：' + res.total.percent);
          console.log(res)
        },
        error(err) {
          // console.log(err.code)
          // console.log(err.message)
          // console.log(err.isRequestError)
          // console.log(err.reqId)
          console.log(err)
        },
        /* 完成后的操作*/
        complete(res) {
          // 上传成功以后会返回key 和 hash  key就是文件名了！
          console.log(res)
          // let fileUrl =baseUrl + '/' + res.key
        }
      }
    },
    getCompetence() {
      var _this = this

      this.thisCancas = document.getElementById('canvasCamera')

      this.thisContext = this.thisCancas.getContext('2d')
      console.log(this.thisContext)
      this.thisVideo = document.getElementById('videoCamera')

      // 旧版本浏览器可能根本不支持mediaDevices，我们首先设置一个空对象

      if (navigator.mediaDevices === undefined) {
        navigator.mediaDevices = {}
      }

      // 一些浏览器实现了部分mediaDevices，我们不能只分配一个对象

      // 使用getUserMedia，因为它会覆盖现有的属性。

      // 这里，如果缺少getUserMedia属性，就添加它。

      if (navigator.mediaDevices.getUserMedia === undefined) {
        navigator.mediaDevices.getUserMedia = function(constraints) {
          // 首先获取现存的getUserMedia(如果存在)

          var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.getUserMedia

          // 有些浏览器不支持，会返回错误信息

          // 保持接口一致

          if (!getUserMedia) {
            return Promise.reject(new Error('getUserMedia is not implemented in this browser'))
          }

          // 否则，使用Promise将调用包装到旧的navigator.getUserMedia

          return new Promise(function(resolve, reject) {
            getUserMedia.call(navigator, constraints, resolve, reject)
          })
        }
      }

      var constraints = { audio: false, video: { width: '400', height: '400', transform: 'scaleX(-1)' }}

      navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
        // 旧的浏览器可能没有srcObject

        if ('srcObject' in _this.thisVideo) {
          _this.thisVideo.srcObject = stream
        } else {
          // 避免在新的浏览器中使用它，因为它正在被弃用。

          _this.thisVideo.src = window.URL.createObjectURL(stream)
        }

        _this.thisVideo.onloadedmetadata = function(e) {
          _this.thisVideo.play()
        }
      }).catch(err => {
        console.log(err)
      })
    },

    // 绘制图片（拍照功能）
    getUrl(img) {
      const file = this.base64ImgtoFile(img) // 获取文件流
      console.log(file)
      const imgUrl = window.webkitURL.createObjectURL(file) ||
        window.URL.createObjectURL(file) // 获取链接
      console.log(imgUrl)
    },
    // 获取文件流
    base64ImgtoFile(dataurl, filename = 'file') {
      console.log(dataurl)
      const arr = dataurl.split(',')
      const mime = arr[0].match(/:(.*?);/)[1]
      const suffix = mime.split('/')[1]
      const bstr = atob(arr[1])
      let n = bstr.length
      const u8arr = new Uint8Array(n)
      while (n--) {
        u8arr[n] = bstr.charCodeAt(n)
      }
      return new File([u8arr], `${filename}.${suffix}`, {
        type: mime
      })
    },

    setImage() {
      var _this = this
      // 点击，canvas画图

      _this.thisContext.drawImage(_this.thisVideo, 0, 0, 400, 400)

      // 获取图片base64链接

      var image = this.thisCancas.toDataURL('image/png')
      console.log(image)

      this.base64ToFile(image)
      // _this.imgSrc = image
      // console.log(this.imgSrc)
      // this.$emit('refreshDataList', this.imgSrc)
    },

    // base64转文件

    dataURLtoFile(dataurl, filename) {
      var arr = dataurl.split(',')

      var mime = arr[0].match(/:(.*?);/)[1]

      var bstr = atob(arr[1])

      var n = bstr.length

      var u8arr = new Uint8Array(n)

      while (n--) {
        u8arr[n] = bstr.charCodeAt(n)
      }

      return new File([u8arr], filename, { type: mime })
    },

    // 关闭摄像头
    base64ToFile(base64, fileName) {
      // 将base64按照 , 进行分割 将前缀  与后续内容分隔开
      const data = base64.split(',')
      // 利用正则表达式 从前缀中获取图片的类型信息（image/png、image/jpeg、image/webp等）
      const type = data[0].match(/:(.*?);/)[1]
      // 从图片的类型信息中 获取具体的文件格式后缀（png、jpeg、webp）
      const suffix = type.split('/')[1]
      // 使用atob()对base64数据进行解码  结果是一个文件数据流 以字符串的格式输出
      const bstr = window.atob(data[1])
      // 获取解码结果字符串的长度
      let n = bstr.length
      // 根据解码结果字符串的长度创建一个等长的整形数字数组
      // 但在创建时 所有元素初始值都为 0
      const u8arr = new Uint8Array(n)
      // 将整形数组的每个元素填充为解码结果字符串对应位置字符的UTF-16 编码单元
      while (n--) {
        // charCodeAt()：获取给定索引处字符对应的 UTF-16 代码单元
        u8arr[n] = bstr.charCodeAt(n)
      }
      // 利用构造函数创建File文件对象
      // new File(bits, name, options)
      const file = new File([u8arr], `${fileName}.${suffix}`, {
        type: type
      })
      // 将File文件对象返回给方法的调用者
      console.log(file)
      this.upLoadFun(file)
      // this.handleFileUpload(file)
      // return file
    },
    handleFileUpload(event) {
      // 阻止发生默认行为
      // event.preventDefault()
      const formData = new FormData()
      const file = this.$refs.file.files[0]
      formData.append('file', file)
      console.log(formData.get('file'))
      this.upLoadFun(formData)
    },

    stopNavigator() {
      this.thisVideo.srcObject.getTracks()[0].stop()
    }

  }

}

</script>
