<template>
  <div>
    hello
  </div>
  <videoPlayer class="vjs-custom-skin videoPlayer" ref="videoplayer"
               :playsinline="true" width="90%" :options="playerOptions"
               customEventName="changed" >
  </videoPlayer>
</template>

<script>
//videojs-flash必须要放在vue-video-player的后面
import 'video.js/dist/video-js.css'
import { videoPlayer } from 'vue-video-player'
import 'videojs-flash'
export default {
  name: "rtmpPlay",
  components: {
    videoPlayer
  },
  data() {
    return {
      playerOptions: {
        width: "800",
        height: "400",
        language: 'zh-CN',
        techOrder: ['flash'],
        muted: true,
        autoplay: true,
        controls: false,//不显示暂停、声音、进度条组件
        loop: true,
        sources: [{
          type: 'rtmp/mp4',
          src: 'rtmp://mobliestream.c3tv.com:554/live/goodtv.sdp' //网络rtmp流地址
          //src: 'rtmp://127.0.0.1:8822/live/badao' //本地rtmp流地址
        }],
      }
    };
  },
  mounted() {

  },
  methods: {

  },
};
</script>
