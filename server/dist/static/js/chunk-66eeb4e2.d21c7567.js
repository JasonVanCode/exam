(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-66eeb4e2"],{2223:function(e,t,a){"use strict";a("fc89")},2934:function(e,t,a){"use strict";a.d(t,"c",(function(){return n})),a.d(t,"b",(function(){return r})),a.d(t,"a",(function(){return l})),a.d(t,"d",(function(){return o}));var i=a("b775");function n(e,t){return Object(i["c"])(e,t)}function r(e,t){return Object(i["c"])(e,{ids:t})}function l(e,t,a){return Object(i["c"])(e,{ids:t,state:a})}function o(e,t){return Object(i["c"])(e,t)}},2995:function(e,t,a){"use strict";a.d(t,"b",(function(){return n})),a.d(t,"a",(function(){return r}));var i=a("b775");function n(e){return Object(i["c"])("/exam/api/sys/user/update",e)}function r(e){return Object(i["c"])("/exam/api/sys/user/save",e)}},"333d":function(e,t,a){"use strict";var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"pagination-container",class:{hidden:e.hidden}},[a("el-pagination",e._b({attrs:{background:e.background,"current-page":e.currentPage,"page-size":e.pageSize,layout:e.layout,"page-sizes":e.pageSizes,total:e.total},on:{"update:currentPage":function(t){e.currentPage=t},"update:current-page":function(t){e.currentPage=t},"update:pageSize":function(t){e.pageSize=t},"update:page-size":function(t){e.pageSize=t},"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}},"el-pagination",e.$attrs,!1))],1)},n=[];a("c5f6");Math.easeInOutQuad=function(e,t,a,i){return e/=i/2,e<1?a/2*e*e+t:(e--,-a/2*(e*(e-2)-1)+t)};var r=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(e){window.setTimeout(e,1e3/60)}}();function l(e){document.documentElement.scrollTop=e,document.body.parentNode.scrollTop=e,document.body.scrollTop=e}function o(){return document.documentElement.scrollTop||document.body.parentNode.scrollTop||document.body.scrollTop}function s(e,t,a){var i=o(),n=e-i,s=20,c=0;t="undefined"===typeof t?500:t;var u=function e(){c+=s;var o=Math.easeInOutQuad(c,i,n,t);l(o),c<t?r(e):a&&"function"===typeof a&&a()};u()}var c={name:"Pagination",props:{total:{required:!0,type:Number},page:{type:Number,default:1},limit:{type:Number,default:20},pageSizes:{type:Array,default:function(){return[10,20,30,50]}},layout:{type:String,default:"total, sizes, prev, pager, next, jumper"},background:{type:Boolean,default:!0},autoScroll:{type:Boolean,default:!0},hidden:{type:Boolean,default:!1}},computed:{currentPage:{get:function(){return this.page},set:function(e){this.$emit("update:page",e)}},pageSize:{get:function(){return this.limit},set:function(e){this.$emit("update:limit",e)}}},methods:{handleSizeChange:function(e){this.$emit("pagination",{page:this.currentPage,limit:e}),this.autoScroll&&s(0,800)},handleCurrentChange:function(e){this.$emit("pagination",{page:e,limit:this.pageSize}),this.autoScroll&&s(0,800)}}},u=c,d=(a("5660"),a("2877")),p=Object(d["a"])(u,i,n,!1,null,"6af373ef",null);t["a"]=p.exports},"51c1":function(e,t,a){},5660:function(e,t,a){"use strict";a("7a30")},"5ba1":function(e,t,a){"use strict";var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-popover",{ref:"popover",attrs:{placement:"bottom-start",trigger:"click"},on:{show:e.onShowPopover,hide:e.onHidePopover}},[a("el-tree",{ref:"tree",staticClass:"select-tree",style:"min-width: "+e.treeWidth,attrs:{data:e.data,props:e.props,"expand-on-click-node":!1,"filter-node-method":e.filterNode,placeholder:"选择部门","check-strictly":"false","highlight-current":"","default-expand-all":""},on:{"node-click":e.onClickNode}}),a("el-input",{ref:"input",class:{rotate:e.showStatus},style:"width: "+e.width+"px",attrs:{slot:"reference",placeholder:e.placeholder,clearable:"","suffix-icon":"el-icon-arrow-down"},slot:"reference",model:{value:e.labelModel,callback:function(t){e.labelModel=t},expression:"labelModel"}})],1)},n=[],r={name:"DepartTree",model:{prop:"value",event:"selected"},props:{value:String,width:String,options:{type:Array,required:!0},placeholder:{type:String,required:!1,default:"请选择"},props:{type:Object,required:!1,default:function(){return{parent:"parentId",value:"rowGuid",label:"areaName",children:"children"}}}},data:function(){return{showStatus:!1,treeWidth:"auto",labelModel:"",valueModel:"0"}},computed:{dataType:function(){var e=JSON.stringify(this.options);return-1!==e.indexOf(this.props.children)},data:function(){return this.dataType?this.options:this.switchTree()}},watch:{labelModel:function(e){e||(this.valueModel=""),this.$refs.tree.filter(e)},value:function(e){this.labelModel=this.queryTree(this.data,e)}},created:function(){var e=this;this.value&&(this.labelModel=this.queryTree(this.data,this.value)),this.$nextTick((function(){e.treeWidth="".concat((e.width||e.$refs.input.$refs.input.clientWidth)-24,"px")}))},methods:{onClickNode:function(e){this.labelModel=e[this.props.label],this.valueModel=e[this.props.value],this.onCloseTree()},switchTree:function(){return this.cleanChildren(this.buildTree(this.options,"0"))},onCloseTree:function(){this.$refs.popover.showPopper=!1},onShowPopover:function(){this.showStatus=!0,this.$refs.tree.filter(!1)},onHidePopover:function(){this.showStatus=!1,this.$emit("selected",this.valueModel)},filterNode:function(e,t){return!e||-1!==t[this.props.label].indexOf(e)},queryTree:function(e,t){var a=[];a=a.concat(e);while(a.length){var i=a.shift();if(i[this.props.children]&&(a=a.concat(i[this.props.children])),i[this.props.value]===t)return i[this.props.label]}return""},buildTree:function(e){var t=this,a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"0",i=function a(i){for(var n=[],r=0;r<e.length;r++){var l=e[r];l[t.props.parent]===i&&(l.children=a(l.rowGuid),n.push(l))}return n};return i(a)},cleanChildren:function(e){var t=function e(t){return t.map((function(t){return t.children.length?e(t.children):delete t.children,t})),t};return t(e)}}},l=r,o=(a("2223"),a("2877")),s=Object(o["a"])(l,i,n,!1,null,null,null);t["a"]=s.exports},"5fee":function(e,t,a){"use strict";a("51c1")},7845:function(e,t,a){"use strict";var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"app-container"},[a("div",{staticClass:"filter-container"},[e._t("filter-content"),a("el-row",[a("el-col",[e.options.addRoute?a("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:e.handleAdd}},[e._v("添加")]):e._e()],1)],1)],2),a("div",{directives:[{name:"show",rawName:"v-show",value:e.multiShow&&e.options.multiActions,expression:"multiShow && options.multiActions"}],staticClass:"filter-container"},[a("el-select",{staticClass:"filter-item",staticStyle:{width:"130px"},attrs:{placeholder:e.selectedLabel},on:{change:e.handleOption},model:{value:e.multiNow,callback:function(t){e.multiNow=t},expression:"multiNow"}},e._l(e.options.multiActions,(function(e){return a("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1),a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.listLoading,expression:"listLoading"}],attrs:{data:e.dataList.records,"header-cell-style":{background:"#f2f3f4",color:"#555","font-weight":"bold","line-height":"32px"},border:"",fit:"","highlight-current-row":""},on:{"selection-change":e.handleSelection}},[e.options.multi?a("el-table-column",{attrs:{align:"center",type:"selection",width:"55"}}):e._e(),e._t("data-columns")],2),a("pagination",{directives:[{name:"show",rawName:"v-show",value:e.dataList.total>0,expression:"dataList.total>0"}],attrs:{total:e.dataList.total,page:e.listQuery.current,limit:e.listQuery.size},on:{"update:page":function(t){return e.$set(e.listQuery,"current",t)},"update:limit":function(t){return e.$set(e.listQuery,"size",t)},pagination:e.getList}})],1)},n=[],r=(a("ac6a"),a("2934")),l=a("333d"),o={name:"PagingTable",components:{Pagination:l["a"]},props:{options:{type:Object,default:function(){return{multiActions:[],listUrl:"/exam/api",deleteUrl:"",stateUrl:"",multi:!1}}},listQuery:{type:Object,default:function(){return{current:1,size:10,params:{},t:0}}}},data:function(){return{dataList:{total:0},listLoading:!0,selectedIds:[],selectedObjs:[],selectedLabel:"",multiShow:!1,multiNow:""}},watch:{listQuery:{handler:function(){this.getList()},deep:!0}},created:function(){this.getList()},methods:{handleAdd:function(){this.options.addRoute?this.$router.push({name:this.options.addRoute,params:{}}):console.log("未设置添加数据跳转路由！")},getList:function(){var e=this;this.listLoading=!0,this.listQuery.t=(new Date).getTime(),Object(r["c"])(this.options.listUrl,this.listQuery).then((function(t){e.dataList=t.data,e.listLoading=!1}))},handleFilter:function(){this.getList()},handleOption:function(e){this.multiNow="","delete"!==e?"enable"!==e?"disable"!==e?this.$emit("multi-actions",{opt:e,ids:this.selectedIds}):this.handleState(1):this.handleState(0):this.handleDelete()},handleState:function(e){var t=this;Object(r["a"])(this.options.stateUrl,this.selectedIds,e).then((function(e){0===e.code&&(t.$message({type:"success",message:"状态修改成功!"}),t.getList())}))},handleDelete:function(){var e=this;0!==this.selectedIds.length?this.$confirm("确实要删除吗?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((function(){Object(r["b"])(e.options.deleteUrl,e.selectedIds).then((function(){e.$message({type:"success",message:"删除成功!"}),e.getList()}))})):this.$message({message:"请至少选择一条数据！",type:"warning"})},handleSelection:function(e){var t=[];e.forEach((function(e){t.push(e.id)})),this.selectedObjs=e,this.selectedIds=t,this.multiShow=t.length>0,this.selectedLabel="已选"+t.length+"项",this.$emit("select-changed",{ids:this.selectedIds,objs:this.selectedObjs})}}},s=o,c=(a("5fee"),a("2877")),u=Object(c["a"])(s,i,n,!1,null,null,null);t["a"]=u.exports},"7a30":function(e,t,a){},"9b73":function(e,t,a){"use strict";a.d(t,"d",(function(){return n})),a.d(t,"c",(function(){return r})),a.d(t,"b",(function(){return l})),a.d(t,"a",(function(){return o})),a.d(t,"e",(function(){return s})),a.d(t,"f",(function(){return c}));var i=a("b775");function n(e){return Object(i["c"])("/exam/api/sys/depart/paging",e)}function r(e){return Object(i["c"])("/exam/api/sys/depart/tree",e)}function l(e){var t={id:e};return Object(i["c"])("/exam/api/sys/depart/detail",t)}function o(e){var t={ids:e};return Object(i["c"])("/exam/api/sys/depart/delete",t)}function s(e){return Object(i["c"])("/exam/api/sys/depart/save",e)}function c(e,t){var a={id:e,sort:t};return Object(i["c"])("/exam/api/sys/depart/sort",a)}},c2a2:function(e,t,a){"use strict";a.r(t);var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("data-table",{ref:"pagingTable",attrs:{options:e.options,"list-query":e.listQuery},on:{"multi-actions":e.handleMultiAction},scopedSlots:e._u([{key:"filter-content",fn:function(){return[a("el-input",{staticClass:"filter-item",staticStyle:{width:"200px"},attrs:{placeholder:"搜索登录名"},model:{value:e.listQuery.params.userName,callback:function(t){e.$set(e.listQuery.params,"userName",t)},expression:"listQuery.params.userName"}}),a("el-input",{staticClass:"filter-item",staticStyle:{width:"200px"},attrs:{placeholder:"搜索姓名"},model:{value:e.listQuery.params.realName,callback:function(t){e.$set(e.listQuery.params,"realName",t)},expression:"listQuery.params.realName"}}),a("el-button",{staticClass:"filter-item",attrs:{type:"primary",icon:"el-icon-plus"},on:{click:e.handleAdd}},[e._v(" 添加 ")]),a("el-button-group",{staticClass:"filter-item",staticStyle:{float:"right"}},[a("el-button",{attrs:{size:"mini",icon:"el-icon-upload2"},on:{click:e.showImport}},[e._v("导入")])],1)]},proxy:!0},{key:"data-columns",fn:function(){return[a("el-table-column",{attrs:{type:"selection",width:"55"}}),a("el-table-column",{attrs:{align:"center",label:"用户名"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("a",{on:{click:function(a){return e.handleUpdate(t.row)}}},[e._v(e._s(t.row.userName))])]}}])}),a("el-table-column",{attrs:{align:"center",label:"姓名",prop:"realName"}}),a("el-table-column",{attrs:{align:"center",label:"角色",prop:"roleIds"}}),a("el-table-column",{attrs:{align:"center",label:"考试安排"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(" "+e._s(t.row.depart?t.row.depart.deptName:"")+" ")]}}])}),a("el-table-column",{attrs:{align:"center",label:"创建时间",prop:"createdAt"}}),a("el-table-column",{attrs:{align:"center",label:"状态"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(" "+e._s(e._f("stateFilter")(t.row.state))+" ")]}}])})]},proxy:!0}])}),a("el-dialog",{attrs:{visible:e.dialogVisible,title:"添加用户",width:"500px"},on:{"update:visible":function(t){e.dialogVisible=t}}},[a("el-form",{attrs:{model:e.formData,"label-position":"left","label-width":"100px"}},[a("el-form-item",{attrs:{label:"准考证号"}},[a("el-input",{model:{value:e.formData.userName,callback:function(t){e.$set(e.formData,"userName",t)},expression:"formData.userName"}})],1),a("el-form-item",{attrs:{label:"姓名"}},[a("el-input",{model:{value:e.formData.realName,callback:function(t){e.$set(e.formData,"realName",t)},expression:"formData.realName"}})],1),a("el-form-item",{attrs:{label:"身份证"}},[a("el-input",{attrs:{placeholder:"不修改请留空"},model:{value:e.formData.identification,callback:function(t){e.$set(e.formData,"identification",t)},expression:"formData.identification"}})],1),a("el-form-item",{attrs:{label:"角色"}},[a("meet-role",{model:{value:e.formData.roles,callback:function(t){e.$set(e.formData,"roles",t)},expression:"formData.roles"}})],1),a("el-form-item",{attrs:{label:"考试安排"}},[a("depart-tree-select",{attrs:{options:e.treeData,props:e.defaultProps},model:{value:e.formData.departId,callback:function(t){e.$set(e.formData,"departId",t)},expression:"formData.departId"}})],1)],1),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.dialogVisible=!1}}},[e._v("取 消")]),a("el-button",{attrs:{type:"primary"},on:{click:e.handleSave}},[e._v("确 定")])],1)],1),a("el-dialog",{attrs:{visible:e.importVisible,title:"导入会员",width:"30%"},on:{"update:visible":function(t){e.importVisible=t}}},[a("el-row",[a("el-button",{attrs:{type:"primary"},on:{click:e.chooseFile}},[e._v("上传导入")]),a("input",{ref:"upFile",staticClass:"file",staticStyle:{display:"none"},attrs:{name:"file",type:"file"},on:{change:e.doImport}})],1)],1)],1)},n=[],r=(a("28a5"),a("7845")),l=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-select",{staticStyle:{width:"100%"},attrs:{"remote-method":e.fetchList,multiple:"",filterable:"",remote:"","reserve-keyword":"",clearable:"","automatic-dropdown":"",placeholder:"请选择角色"},on:{change:e.handlerChange},model:{value:e.values,callback:function(t){e.values=t},expression:"values"}},e._l(e.list,(function(e){return a("el-option",{key:e.id,attrs:{label:e.title,value:e.id}})})),1)},o=[],s=a("b775");function c(){return Object(s["c"])("/exam/api/sys/role/list",{})}var u={name:"MeetRole",props:{value:Array,default:Array},data:function(){return{list:[],values:[]}},watch:{value:{handler:function(){this.values=this.value},deep:!0}},created:function(){this.values=this.value,this.fetchList()},methods:{fetchList:function(){var e=this;c().then((function(t){e.list=t.data}))},handlerChange:function(e){this.$emit("change",e),this.$emit("input",e)}}},d=u,p=a("2877"),f=Object(p["a"])(d,l,o,!1,null,null,null),h=f.exports,m=a("2995"),b=a("5ba1"),g=a("9b73"),v=a("f4bc"),y={name:"SysUserList",components:{DepartTreeSelect:b["a"],DataTable:r["a"],MeetRole:h},filters:{userState:function(e){var t={0:"正常",1:"禁用"};return t[e]}},data:function(){return{importVisible:!1,treeData:[],defaultProps:{value:"id",label:"deptName",children:"children"},dialogVisible:!1,listQuery:{current:1,size:10,params:{}},formData:{avatar:""},options:{listUrl:"/exam/api/sys/user/paging",stateUrl:"/sys/user/state",deleteUrl:"/exam/api/sys/user/delete",multiActions:[{value:"enable",label:"启用"},{value:"disable",label:"禁用"},{value:"delete",label:"删除"}]}}},created:function(){var e=this;Object(g["c"])({}).then((function(t){console.log(11111111),console.log(t.data),e.treeData=t.data.records,console.log(e.treeData)}))},methods:{doImport:function(e){var t=this,a=e.target.files[0];Object(v["c"])(a).then((function(e){0!==e.code?t.$alert(e.data.msg,"导入信息",{dangerouslyUseHTMLString:!0}):(t.$message({message:"数据导入成功！",type:"success"}),t.importVisible=!1,t.$refs.pagingTable.getList())}))},chooseFile:function(){this.$refs.upFile.dispatchEvent(new MouseEvent("click"))},showImport:function(){this.importVisible=!0},handleUploadSuccess:function(e){this.formData.avatar=e.data.url},handleAdd:function(){this.formData={},this.dialogVisible=!0},handleUpdate:function(e){this.dialogVisible=!0,this.formData=e,this.formData.roles=e.roleIds.split(","),this.formData.password=null,console.log(JSON.stringify(this.formData))},departSelected:function(e){this.formData.departId=e.id},handleSave:function(){var e=this;this.formData.role_ids=this.formData.roles[0],console.log(this.formData);var t={};t.dataFlag=this.formData.dataFlag,t.departId=this.formData.departId,t.id=this.formData.id,t.identification=this.formData.identification,t.realName=this.formData.realName,t.roleIds=this.formData.roleIds,t.role_ids=this.formData.role_ids,t.roles=this.formData.roles,t.salt=this.formData.salt,t.state=this.formData.state,t.userName=this.formData.userName,Object(m["a"])(t).then((function(){e.$message({type:"success",message:"操作成功!"}),e.dialogVisible=!1,e.$refs.pagingTable.getList()}))},handleMultiAction:function(e){"cancel"===e.opt&&this.handleCancelOrder(e.ids)}}},w=y,x=Object(p["a"])(w,i,n,!1,null,null,null);t["default"]=x.exports},f4bc:function(e,t,a){"use strict";a.d(t,"b",(function(){return n})),a.d(t,"e",(function(){return r})),a.d(t,"a",(function(){return l})),a.d(t,"d",(function(){return o})),a.d(t,"c",(function(){return s}));var i=a("b775");function n(e){return Object(i["c"])("/repo/Detail",{id:parseInt(e)})}function r(e){return Object(i["c"])("/exam/api/qu/qu/save",e)}function l(e){return Object(i["a"])("/exam/api/qu/qu/export",e,"导出的数据.xlsx")}function o(){return Object(i["a"])("/exam/api/qu/qu/import/template",{},"qu-import-template.xlsx")}function s(e){return Object(i["d"])("/exam/api/qu/qu/import",e)}},fc89:function(e,t,a){}}]);