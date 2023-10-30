<template>
  <div>
    <video id="myVideo" ref="myVideo" class="video-js vjs-default-skin" controls autoplay></video>
  </div>
</template>
<script>
import videojs from "video.js";
import "videojs-flash";
export default {
  name: "RtmpClient",
  data() {
    return {
      options: {
        techOrder: ["flash"],
        flash: {
          swf: "video-js.swf",
        },
        sources: [
          {
            src: "rtmp://localhost:1945/zbcs/room",
            type: "rtmp/flv",
          },
        ],
      },
    };
  },
  mounted() {
    this.player = videojs(this.$refs.myVideo, this.options, function () {
      console.log("player is ready");
    });
  },
  beforeDestroy() {
    if (this.player) {
      this.player.dispose();
    }
  },
};
</script>
