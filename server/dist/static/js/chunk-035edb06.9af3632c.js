(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-035edb06"],{2934:function(t,e,a){"use strict";a.d(e,"c",(function(){return i})),a.d(e,"b",(function(){return r})),a.d(e,"a",(function(){return s})),a.d(e,"d",(function(){return o}));var n=a("b775");function i(t,e){return Object(n["c"])(t,e)}function r(t,e){return Object(n["c"])(t,{ids:e})}function s(t,e,a){return Object(n["c"])(t,{ids:e,state:a})}function o(t,e){return Object(n["c"])(t,e)}},"2a75":function(t,e,a){"use strict";var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("file-upload-local",{attrs:{accept:t.accept,tips:t.tips,"list-type":t.listType,"paper-type":t.paperType,"user-data":t.userData},model:{value:t.fileUrl,callback:function(e){t.fileUrl=e},expression:"fileUrl"}})],1)},i=[],r=(a("c5f6"),function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"content"},[a("el-upload",{attrs:{action:1==t.paperType?t.server2:t.server,accept:t.accept,"before-remove":t.beforeRemove,"on-remove":t.handleRemove,"on-success":t.handleSuccess,data:t.userData,drag:"picture"!==t.listType,headers:t.header,"file-list":t.fileList,"list-type":t.listType},model:{value:t.fileUrl,callback:function(e){t.fileUrl=e},expression:"fileUrl"}},["picture"===t.listType?a("el-button",{attrs:{size:"small",type:"primary"}},[t._v("点击上传")]):t._e(),"picture"!==t.listType?a("i",{staticClass:"el-icon-upload"}):t._e(),"picture"!==t.listType?a("div",{staticClass:"el-upload__text"},[a("em",[t._v("点击上传")])]):t._e(),t.tips?a("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[t._v(t._s(t.tips))]):t._e()],1)],1)}),s=[],o=(a("7f7f"),a("5f87")),c={name:"FileUploadLocal",props:{paperType:Number,value:String,accept:String,tips:String,listType:String,limit:{type:Number,default:1},userData:Object},data:function(){return{server:"".concat("http://localhost:8899","/api/file/upload"),server2:"".concat("http://localhost:8899","/api/exam/api/paper/paper/uploadOper"),fileList:[],fileUrl:"",header:{}}},watch:{value:{handler:function(){this.fillValue()}}},created:function(){this.fillValue(),this.header={token:Object(o["a"])()}},methods:{fillValue:function(){this.fileList=[],this.fileUrl=this.value,this.fileUrl&&(this.fileList=[{name:this.fileUrl,url:this.fileUrl}])},handleExceed:function(){this.$message.warning("每次只能上传 ".concat(this.limit," 个文件"))},beforeRemove:function(){return this.$confirm("确定移除文件吗？")},handleRemove:function(){this.$emit("input",""),this.fileList=[]},handleSuccess:function(t){if(1===t.code)return this.$message({type:"error",message:t.msg}),void(this.fileList=[]);console.log(t.data),this.$parent.func2(),t.data&&t.data.name?this.$emit("input",t.data.name):this.$emit("input",t.data[0].url)}}},l=c,u=a("2877"),d=Object(u["a"])(l,r,s,!1,null,null,null),p=d.exports,h={name:"FileUpload",components:{FileUploadLocal:p},props:{paperType:Number,value:String,accept:{type:String,default:"*"},tips:String,listType:{type:String,default:"picture"},userData:Object},data:function(){return{fileUrl:""}},watch:{value:{handler:function(){this.fillValue()}},fileUrl:{handler:function(){this.$emit("input",this.fileUrl)}}},mounted:function(){},created:function(){this.fillValue()},methods:{func2:function(){this.$emit("changeOper")},fillValue:function(){this.fileUrl=this.value}}},f=h,m=Object(u["a"])(f,n,i,!1,null,null,null);e["a"]=m.exports},"2f21":function(t,e,a){"use strict";var n=a("79e5");t.exports=function(t,e){return!!t&&n((function(){e?t.call(null,(function(){}),1):t.call(null)}))}},3200:function(t,e,a){"use strict";a.d(e,"b",(function(){return i})),a.d(e,"e",(function(){return r})),a.d(e,"g",(function(){return s})),a.d(e,"c",(function(){return o})),a.d(e,"d",(function(){return c})),a.d(e,"f",(function(){return l})),a.d(e,"a",(function(){return u}));var n=a("b775");function i(t){return Object(n["c"])("/exam/api/paper/paper/create-paper",t)}function r(t){return Object(n["c"])("/exam/api/paper/paper/paper-detail",t)}function s(t){return Object(n["c"])("/exam/api/paper/paper/qu-detail",t)}function o(t){return Object(n["c"])("/exam/api/paper/paper/fill-answer",t)}function c(t){return Object(n["c"])("/exam/api/paper/paper/hand-exam",t)}function l(t){return Object(n["c"])("/exam/api/paper/paper/paper-result",t)}function u(){return Object(n["c"])("/exam/api/paper/paper/check-process",{})}},"55dd":function(t,e,a){"use strict";var n=a("5ca1"),i=a("d8e8"),r=a("4bf8"),s=a("79e5"),o=[].sort,c=[1,2,3];n(n.P+n.F*(s((function(){c.sort(void 0)}))||!s((function(){c.sort(null)}))||!a("2f21")(o)),"Array",{sort:function(t){return void 0===t?o.call(r(this)):o.call(r(this),i(t))}})},"6cc6":function(t,e,a){"use strict";a("7201")},"70fe":function(t,e,a){"use strict";a.r(e);var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"app-container"},[a("el-row",{attrs:{gutter:24}},[a("el-col",{attrs:{span:24}},[a("el-card",{staticStyle:{"margin-bottom":"10px"}},[t._v(" 距离比赛结束还有： "),a("exam-timer",{on:{timeout:function(e){return t.doHandler()}},model:{value:t.paperData.leftSeconds,callback:function(e){t.$set(t.paperData,"leftSeconds",e)},expression:"paperData.leftSeconds"}}),a("el-button",{staticStyle:{float:"right","margin-top":"-10px"},attrs:{loading:t.loading,type:"primary",icon:"el-icon-plus"},on:{click:function(e){return t.handHandExam()}}},[t._v(" "+t._s(t.handleText)+" ")])],1)],1),a("el-col",{staticStyle:{"margin-bottom":"10px"},attrs:{span:5,xs:24}},[a("el-card",{staticClass:"content-h"},[void 0!==t.paperData.radioList&&t.paperData.radioList.length>0?a("div",[a("p",{staticClass:"card-title"},[t._v("单选题")]),a("el-row",{staticClass:"card-line",attrs:{gutter:24}},t._l(t.paperData.radioList,(function(e){return a("el-tag",{attrs:{type:t.cardItemClass(e.answered,e.quId)},on:{click:function(a){return t.handSave(e)}}},[t._v(" "+t._s(e.sort+1))])})),1)],1):t._e(),void 0!==t.paperData.multiList&&t.paperData.multiList.length>0?a("div",[a("p",{staticClass:"card-title"},[t._v("多选题")]),a("el-row",{staticClass:"card-line",attrs:{gutter:24}},t._l(t.paperData.multiList,(function(e){return a("el-tag",{attrs:{type:t.cardItemClass(e.answered,e.quId)},on:{click:function(a){return t.handSave(e)}}},[t._v(t._s(e.sort+1))])})),1)],1):t._e(),void 0!==t.paperData.judgeList&&t.paperData.judgeList.length>0?a("div",[a("p",{staticClass:"card-title"},[t._v("判断题")]),a("el-row",{staticClass:"card-line",attrs:{gutter:24}},t._l(t.paperData.judgeList,(function(e){return a("el-tag",{attrs:{type:t.cardItemClass(e.answered,e.quId)},on:{click:function(a){return t.handSave(e)}}},[t._v(t._s(e.sort+1))])})),1)],1):t._e(),void 0!==t.paperData.operList&&t.paperData.operList.length>0?a("div",[a("p",{staticClass:"card-title"},[t._v("实操题")]),a("el-row",{staticClass:"card-line",attrs:{gutter:24}},t._l(t.paperData.operList,(function(e){return a("el-tag",{attrs:{type:t.cardItemClass(e.answered,e.quId)},on:{click:function(a){return t.handSave(e)}}},[t._v(t._s(e.sort+1)+" ")])})),1)],1):t._e(),a("shiping",{staticStyle:{"margin-top":"30px"}}),a("div",{staticStyle:{width:"100px",float:"left","text-align":"center",height:"40px","line-height":"40px"}},[t._v("监考中")])],1)],1),a("el-col",{attrs:{span:19,xs:24}},[a("el-card",{staticClass:"qu-content content-h"},[t.quData.quInfo?a("p",[a("pre",[t._v(t._s(t.quData.sort+1)+"."+t._s(t.quData.quInfo.content))])]):t._e(),null!=t.quData.quInfo.image&&""!=t.quData.quInfo.image?a("p",[a("el-image",{staticStyle:{"max-width":"50%"},attrs:{src:t.quData.quInfo.image}})],1):t._e(),1===t.quData.quType||3===t.quData.quType?a("div",[a("el-radio-group",{model:{value:t.radioValue,callback:function(e){t.radioValue=e},expression:"radioValue"}},t._l(t.quData.answerList,(function(e){return a("el-radio",{attrs:{label:e.id}},[t._v(t._s(e.answerInfo.content)+" "),null!=e.answerInfo.image&&""!=e.answerInfo.image?a("div",{staticStyle:{clear:"both"}},[a("el-image",{staticStyle:{"max-width":"30%"},attrs:{src:"https://code.icmc100.com/api/"+e.answerInfo.image}})],1):t._e()])})),1)],1):t._e(),2===t.quData.quType?a("div",[a("el-checkbox-group",{model:{value:t.multiValue,callback:function(e){t.multiValue=e},expression:"multiValue"}},t._l(t.quData.answerList,(function(e){return a("el-checkbox",{key:e.id,attrs:{label:e.id}},[t._v(t._s(e.abc)+"."+t._s(e.answerInfo.content)+" "),null!=e.answerInfo.image&&""!=e.answerInfo.image?a("div",{staticStyle:{clear:"both"}},[a("el-image",{staticStyle:{"max-width":"100%"},attrs:{src:"https://code.icmc100.com/api/"+e.answerInfo.image}})],1):t._e()])})),1)],1):t._e(),4===t.quData.quType?a("div",[a("file-upload",{attrs:{"list-type":"file","paper-type":1,"user-data":{quId:t.quData.quId,paperId:t.quData.paperId}},on:{changeOper:t.changeOper},model:{value:t.quData.fileName,callback:function(e){t.$set(t.quData,"fileName",e)},expression:"quData.fileName"}})],1):t._e(),a("div",{staticStyle:{"margin-top":"20px"}},[t.showPrevious?a("el-button",{attrs:{type:"primary",icon:"el-icon-back"},on:{click:function(e){return t.handPrevious()}}},[t._v(" 上一题 ")]):t._e(),t.showNext?a("el-button",{attrs:{type:"warning",icon:"el-icon-right"},on:{click:function(e){return t.handNext()}}},[t._v(" 下一题 ")]):t._e()],1)])],1)],1)],1)},i=[],r=a("2d63"),s=a("c80c"),o=(a("96cf"),a("3b8d")),c=(a("55dd"),a("ac6a"),a("db72")),l=a("3200"),u=a("5c96"),d=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("span",{staticStyle:{color:"#ff0000","font-weight":"700"}},[t._v(t._s(t.min)+"分钟"+t._s(t.sec)+"秒")])},p=[],h=(a("c5f6"),{name:"ExamTimer",props:{value:Number},data:function(){return{leftSeconds:0,min:"00",sec:"00"}},watch:{value:{handler:function(){this.leftSeconds=this.value,this.countdown()}}},created:function(){this.leftSeconds=this.value,this.countdown()},methods:{countdown:function(){if(this.leftSeconds<0)this.$emit("timeout");else{var t=parseInt(this.leftSeconds/60),e=parseInt(this.leftSeconds%60);this.min=t>9?t:"0"+t,this.sec=e>9?e:"0"+e,this.leftSeconds-=1;var a=this;setTimeout((function(){a.countdown()}),1e3)}}}}),f=h,m=a("2877"),v=Object(m["a"])(f,d,p,!1,null,null,null),g=v.exports,w=a("2f62"),b=a("2a75"),y=a("7c97"),I=(a("2934"),{name:"ExamProcess",components:{ExamTimer:g,FileUpload:b["a"],Shiping:y["a"]},data:function(){return{aa:0,noShow:!1,isFullscreen:!1,showPrevious:!1,showNext:!0,loading:!1,handleText:"交卷",pageLoading:!1,paperId:0,cardItem:{},allItem:[],quData:{answerList:[]},paperData:{leftSeconds:99999,radioList:[],multiList:[],judgeList:[],operList:[]},radioValue:"",multiValue:[],answeredIds:[],msgBox:{}}},computed:Object(c["a"])({},Object(w["b"])(["userId","roles"])),mounted:function(){var t=this;window.addEventListener("beforeunload",(function(e){t.beforeunloadHandler(e)}))},destroyed:function(){var t=this;window.removeEventListener("beforeunload",(function(e){t.beforeunloadHandler(e)}))},created:function(){this.stopF5Refresh();var t=this.$route.params.id;"undefined"!==typeof t&&(this.paperId=parseInt(t),this.fetchData(this.paperId))},methods:{stopF5Refresh:function(){document.onkeydown=function(t){var e=window.event||t,a=e.keyCode||e.which;a>111&&a<124&&(e.preventDefault?e.preventDefault():(e.keyCode=0,e.returnValue=!1))},document.oncontextmenu=function(){return!1},history.pushState(null,null,window.location.href),window.addEventListener("popstate",(function(){history.pushState(null,null,window.location.href)}))},beforeunloadHandler:function(t){return t=t||window.event,t&&(t.returnValue="您是否确认离开此页面-您输入的数据可能不会被保存"),"您是否确认离开此页面-您输入的数据可能不会被保存"},cardItemClass:function(t,e){return e===this.cardItem.quId?"warning":t?"success":t?void 0:"info"},countNotAnswered:function(){var t=0;return this.paperData.radioList.forEach((function(e){e.answered||(t+=1)})),this.paperData.multiList.forEach((function(e){e.answered||(t+=1)})),this.paperData.judgeList.forEach((function(e){e.answered||(t+=1)})),this.paperData.operList.forEach((function(e){e.answered||(t+=1)})),t},handNext:function(){var t=this.cardItem.sort+1;this.handSave(this.allItem[t])},changeOper:function(){this.cardItem.answered=!0},handPrevious:function(){var t=this.cardItem.sort-1;this.handSave(this.allItem[t])},logout:function(){var t=Object(o["a"])(Object(s["a"])().mark((function t(){return Object(s["a"])().wrap((function(t){while(1)switch(t.prev=t.next){case 0:return this.$msgbox.close(),t.next=3,this.$store.dispatch("user/logout");case 3:this.$router.push("/login");case 4:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),doHandler:function(){var t=this;this.handleText="正在交卷，请等待...",this.loading=!0;var e={id:this.paperId};Object(l["d"])(e).then((function(){t.msgBox=t.$confirm("比赛提交成功，即将退出系统！","提示",{confirmButtonText:"确定",cancelButtonText:"取消",showCancelButton:!1,showConfirmButton:!1,type:"success",showClose:!1,closeOnClickModal:!1,center:!0}),setTimeout(t.logout,3e3)}))},handHandExam:function(){var t=this;this.handSave(this.cardItem,(function(){var e="确定要结束比赛吗？";t.$confirm(e,"提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){t.doHandler()})).catch((function(){t.$message({type:"info",message:"交卷已取消，您可以继续作答！"})}))}))},handSave:function(t,e){var a=this;console.log(this.cardItem);var n=this.multiValue;""!==this.radioValue&&n.push(this.radioValue);var i={paperId:this.paperId,quId:this.cardItem.quId,answers:n,answer:""};Object(l["c"])(i).then((function(){n.length>0&&(a.cardItem.answered=!0),e&&e(),a.fetchQuData(t)}))},fetchQuData:function(t){var e=this,a=this;if(console.log(t),4==t.quType){var n,i=Object(r["a"])(this.allItem);try{for(i.s();!(n=i.n()).done;){var s=n.value;console.log("===>",s),0==this.aa&&4!=s.quType&&0==s.answered&&this.$confirm("确认进入实操题吗，将不能再修改选择题！","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){e.cardItem.quType=4,e.aa=1}))}}catch(p){i.e(p)}finally{i.f()}}if(4!=this.cardItem.quType||4==t.quType){t.id===this.allItem[0].id?this.showPrevious=!1:this.showPrevious=!0;var o=this.allItem.length-1;t.id===this.allItem[o].id?this.showNext=!1:this.showNext=!0;var c=u["Loading"].service({text:"拼命加载中",background:"rgba(0, 0, 0, 0.7)"});this.cardItem=t;var d={paperId:this.paperId,quId:t.quId};Object(l["g"])(d).then((function(t){console.log(t),e.quData=t.data,null!=e.quData.quInfo.image&&""!=e.quData.quInfo.image&&(e.quData.quInfo.image="https://code.icmc100.com/api/"+e.quData.quInfo.image),null!=e.quData.quInfo.scimage&&""!=e.quData.quInfo.scimage&&(e.quData.quInfo.scimage="https://code.icmc100.com/api/"+e.quData.quInfo.scimage),e.radioValue="",e.multiValue=[],e.quData.answerList.forEach((function(t){1!==e.quData.quType&&3!==e.quData.quType||!t.checked||(e.radioValue=t.id),2===e.quData.quType&&t.checked&&e.multiValue.push(t.id)})),c.close()}))}else a.$message({type:"error",message:"单选题已提交完，无法选择！"})},fetchData:function(t){var e=this,a={id:t};Object(l["e"])(a).then((function(t){e.paperData=t.data;var a=e.paperData.radioList.length+e.paperData.multiList.length+e.paperData.judgeList.length+e.paperData.operList.length;a<2&&(e.showPrevious=!1,e.showNext=!1,e.noShow=!0),e.paperData.radioList.length>0?e.cardItem=e.paperData.radioList[0]:e.paperData.multiList.length>0?e.cardItem=e.paperData.multiList[0]:e.paperData.judgeList.length>0?e.cardItem=e.paperData.judgeList[0]:e.paperData.operList.length>0&&(e.cardItem=e.paperData.operList[0]);var n=e;e.paperData.radioList.forEach((function(t){n.allItem.push(t)})),e.paperData.multiList.forEach((function(t){n.allItem.push(t)})),e.paperData.judgeList.forEach((function(t){n.allItem.push(t)})),e.paperData.operList.forEach((function(t){n.allItem.push(t)})),e.fetchQuData(e.cardItem)}))}}}),D=I,x=(a("6cc6"),Object(m["a"])(D,n,i,!1,null,"1779dcfd",null));e["default"]=x.exports},7201:function(t,e,a){},"7c97":function(t,e,a){"use strict";var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"camera_outer"},[a("video",{attrs:{id:"videoCamera",width:"100px",height:"100px",autoplay:""}}),a("canvas",{staticStyle:{display:"none"},attrs:{id:"canvasCamera",width:"400px",height:"400px"}}),t.imgSrc?a("div",{staticClass:"img_bg_camera"},[a("img",{staticClass:"tx_img",attrs:{src:t.imgSrc,alt:""}})]):t._e(),a("button",{staticStyle:{display:"none"},on:{click:function(e){return t.shangchuang()}}},[t._v("获取upToken")]),a("button",{ref:"inputResult",staticStyle:{display:"none"},on:{click:function(e){return t.getCompetence()}}},[t._v("打开摄像头")]),a("button",{staticStyle:{display:"none"},on:{click:function(e){return t.stopNavigator()}}},[t._v("关闭摄像头")]),a("button",{ref:"setResult",staticStyle:{display:"none"},on:{click:function(e){return t.setImage()}}},[t._v("拍照")])])},i=[],r=(a("34ef"),a("4917"),a("28a5"),a("f744")),s=a("2934"),o=a("5f87"),c={data:function(){return{videoWidth:400,videoHeight:400,imgSrc:"",thisCancas:null,thisContext:null,thisVideo:null,upToken:null}},created:function(){var t=this;this.shangchuang(),this.$nextTick((function(){t.$refs.inputResult.click()})),this.times=setInterval((function(){t.$nextTick((function(){t.$refs.setResult.click()}))}),3e4)},methods:{shangchuang:function(){var t=this;Object(s["d"])("/file/upToken").then((function(e){t.upToken=e.data,Object(o["e"])(t.upToken)})).catch((function(e){t.$message.error(e.message)})),console.log(this.upToken)},upLoadFun:function(t){var e=this,a={useCdnDomain:!0,region:r["c"].z0},n={fname:t,params:{id:1},mimeType:null},i=Object(o["b"])()+"/"+Date.now()+".png",s=this.upToken,c=r["b"](s),l={quality:.9,noCompressIfLarger:!0};r["a"](t,l).then((function(t){var o=r["d"](t.dist,i,s,c,n,a);e.subscription=o.subscribe(u)}));var u={next:function(t){console.log(t)},error:function(t){console.log(t)},complete:function(t){console.log(t)}}},getCompetence:function(){var t=this;this.thisCancas=document.getElementById("canvasCamera"),this.thisContext=this.thisCancas.getContext("2d"),console.log(this.thisContext),this.thisVideo=document.getElementById("videoCamera"),void 0===navigator.mediaDevices&&(navigator.mediaDevices={}),void 0===navigator.mediaDevices.getUserMedia&&(navigator.mediaDevices.getUserMedia=function(t){var e=navigator.webkitGetUserMedia||navigator.mozGetUserMedia||navigator.getUserMedia;return e?new Promise((function(a,n){e.call(navigator,t,a,n)})):Promise.reject(new Error("getUserMedia is not implemented in this browser"))});var e={audio:!1,video:{width:"400",height:"400",transform:"scaleX(-1)"}};navigator.mediaDevices.getUserMedia(e).then((function(e){"srcObject"in t.thisVideo?t.thisVideo.srcObject=e:t.thisVideo.src=window.URL.createObjectURL(e),t.thisVideo.onloadedmetadata=function(e){t.thisVideo.play()}})).catch((function(t){console.log(t)}))},getUrl:function(t){var e=this.base64ImgtoFile(t);console.log(e);var a=window.webkitURL.createObjectURL(e)||window.URL.createObjectURL(e);console.log(a)},base64ImgtoFile:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"file";console.log(t);var a=t.split(","),n=a[0].match(/:(.*?);/)[1],i=n.split("/")[1],r=atob(a[1]),s=r.length,o=new Uint8Array(s);while(s--)o[s]=r.charCodeAt(s);return new File([o],"".concat(e,".").concat(i),{type:n})},setImage:function(){var t=this;t.thisContext.drawImage(t.thisVideo,0,0,400,400);var e=this.thisCancas.toDataURL("image/png");console.log(e),this.base64ToFile(e)},dataURLtoFile:function(t,e){var a=t.split(","),n=a[0].match(/:(.*?);/)[1],i=atob(a[1]),r=i.length,s=new Uint8Array(r);while(r--)s[r]=i.charCodeAt(r);return new File([s],e,{type:n})},base64ToFile:function(t,e){var a=t.split(","),n=a[0].match(/:(.*?);/)[1],i=n.split("/")[1],r=window.atob(a[1]),s=r.length,o=new Uint8Array(s);while(s--)o[s]=r.charCodeAt(s);var c=new File([o],"".concat(e,".").concat(i),{type:n});console.log(c),this.upLoadFun(c)},handleFileUpload:function(t){var e=new FormData,a=this.$refs.file.files[0];e.append("file",a),console.log(e.get("file")),this.upLoadFun(e)},stopNavigator:function(){this.thisVideo.srcObject.getTracks()[0].stop()}}},l=c,u=a("2877"),d=Object(u["a"])(l,n,i,!1,null,null,null);e["a"]=d.exports}}]);