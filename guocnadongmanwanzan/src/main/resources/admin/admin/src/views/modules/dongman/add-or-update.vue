<template>
    <div class="addEdit-block">
        <el-form
                class="detail-form-content"
                ref="ruleForm"
                :model="ruleForm"
                :rules="rules"
                label-width="auto"
                :style="{backgroundColor:addEditForm.addEditBoxColor}">
            <el-row>
                <input id="updateId" name="id" type="hidden">
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="动漫名称" prop="dongmanName">
                       <el-input v-model="ruleForm.dongmanName"
                                 placeholder="动漫名称" clearable  :readonly="ro.dongmanName"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="动漫名称" prop="dongmanName">
                           <el-input v-model="ruleForm.dongmanName"
                                     placeholder="动漫名称" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="12">
                    <el-form-item class="select" v-if="type!='info'"  label="国漫先驱类型" prop="dongmanTypes">
                        <el-select v-model="ruleForm.dongmanTypes" :disabled="ro.dongmanTypes" placeholder="请选择国漫先驱类型">
                            <el-option
                                v-for="(item,index) in dongmanTypesOptions"
                                v-bind:key="item.codeIndex"
                                :label="item.indexName"
                                :value="item.codeIndex">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item class="input" label="国漫先驱类型" prop="dongmanValue">
                        <el-input v-model="ruleForm.dongmanValue"
                            placeholder="国漫先驱类型" readonly></el-input>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="12">
                    <el-form-item class="upload" v-if="type!='info' && !ro.dongmanPhoto" label="封面" prop="dongmanPhoto">
                        <file-upload
                            tip="点击上传封面"
                            action="file/upload"
                            :limit="3"
                            :multiple="true"
                            :fileUrls="ruleForm.dongmanPhoto?$base.url+ruleForm.dongmanPhoto:''"
                            @change="dongmanPhotoUploadChange"
                        ></file-upload>
                    </el-form-item>
                    <div v-else>
                        <el-form-item v-if="ruleForm.dongmanPhoto" label="封面" prop="dongmanPhoto">
                            <img style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in (ruleForm.dongmanPhoto || '').split(',')" :src="$base.url+item" width="100" height="100">
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="12">
                    <el-form-item class="upload" v-if="type!='info' && !ro.dongmanVideo" label="介绍视频" prop="dongmanVideo">
                        <file-upload
                            tip="点击上传介绍视频"
                            action="file/upload"
                            :limit="3"
                            :multiple="true"
                            :fileUrls="ruleForm.dongmanVideo?$base.url+ruleForm.dongmanVideo:''"
                            @change="dongmanVideoUploadChange"
                        ></file-upload>
                    </el-form-item>
                    <div v-else>
                        <el-form-item v-if="ruleForm.dongmanVideo" label="介绍视频" prop="dongmanVideo">
                            <video :src="$base.url+ruleForm.dongmanVideo" width="100" height="100" controls="controls">
                            </video>
                        </el-form-item>
                    </div>
                </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="更新时间" prop="dongmanShijian">
                       <el-input v-model="ruleForm.dongmanShijian"
                                 placeholder="更新时间" clearable  :readonly="ro.dongmanShijian"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="更新时间" prop="dongmanShijian">
                           <el-input v-model="ruleForm.dongmanShijian"
                                     placeholder="更新时间" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="出品公司" prop="dongmanFaxing">
                       <el-input v-model="ruleForm.dongmanFaxing"
                                 placeholder="出品公司" clearable  :readonly="ro.dongmanFaxing"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="出品公司" prop="dongmanFaxing">
                           <el-input v-model="ruleForm.dongmanFaxing"
                                     placeholder="出品公司" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="地    区" prop="dongmanAdd">
                       <el-input v-model="ruleForm.dongmanAdd"
                                 placeholder="地    区" clearable  :readonly="ro.dongmanAdd"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="地    区" prop="dongmanAdd">
                           <el-input v-model="ruleForm.dongmanAdd"
                                     placeholder="地    区" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="发行公司" prop="dongmanGs">
                       <el-input v-model="ruleForm.dongmanGs"
                                 placeholder="发行公司" clearable  :readonly="ro.dongmanGs"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="发行公司" prop="dongmanGs">
                           <el-input v-model="ruleForm.dongmanGs"
                                     placeholder="发行公司" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="12">
                    <el-form-item v-if="type!='info'"  class="input" label="发行日期" prop="chuchangTime">
                        <el-date-picker
                                value-format="yyyy-MM-dd"
                                v-model="ruleForm.chuchangTime"
                                type="date"
                                placeholder="发行日期"
                                :disabled="ro.chuchangTime">
                        </el-date-picker>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.chuchangTime" label="发行日期" prop="chuchangTime">
                            <span v-html="ruleForm.chuchangTime"></span>
                        </el-form-item>
                    </div>
                </el-col>

               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="单集时长" prop="dongmanSc">
                       <el-input v-model="ruleForm.dongmanSc"
                                 placeholder="单集时长" clearable  :readonly="ro.dongmanSc"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="单集时长" prop="dongmanSc">
                           <el-input v-model="ruleForm.dongmanSc"
                                     placeholder="单集时长" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="集    数" prop="dongmanJishu">
                       <el-input v-model="ruleForm.dongmanJishu"
                                 placeholder="集    数" clearable  :readonly="ro.dongmanJishu"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="集    数" prop="dongmanJishu">
                           <el-input v-model="ruleForm.dongmanJishu"
                                     placeholder="集    数" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
               <el-col :span="12">
                   <el-form-item class="input" v-if="type!='info'"  label="导    演" prop="dongmanDaoyan">
                       <el-input v-model="ruleForm.dongmanDaoyan"
                                 placeholder="导    演" clearable  :readonly="ro.dongmanDaoyan"></el-input>
                   </el-form-item>
                   <div v-else-if="type=='info'">
                       <el-form-item class="input" label="导    演" prop="dongmanDaoyan">
                           <el-input v-model="ruleForm.dongmanDaoyan"
                                     placeholder="导    演" readonly></el-input>
                       </el-form-item>
                   </div>
               </el-col>
                <el-col :span="12">
                    <el-form-item class="select" v-if="type!='info'"  label="动漫状态" prop="zhuangtaiTypes">
                        <el-select v-model="ruleForm.zhuangtaiTypes" :disabled="ro.zhuangtaiTypes" placeholder="请选择动漫状态">
                            <el-option
                                v-for="(item,index) in zhuangtaiTypesOptions"
                                v-bind:key="item.codeIndex"
                                :label="item.indexName"
                                :value="item.codeIndex">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item class="input" label="动漫状态" prop="zhuangtaiValue">
                        <el-input v-model="ruleForm.zhuangtaiValue"
                            placeholder="动漫状态" readonly></el-input>
                        </el-form-item>
                    </div>
                </el-col>
                <el-col :span="24">
                    <el-form-item v-if="type!='info'"  label="动漫详情" prop="dongmanContent">
                        <editor style="min-width: 200px; max-width: 600px;"
                                v-model="ruleForm.dongmanContent"
                                class="editor"
                                action="file/upload">
                        </editor>
                    </el-form-item>
                    <div v-else-if="type=='info'">
                        <el-form-item v-if="ruleForm.dongmanContent" label="动漫详情" prop="dongmanContent">
                            <span v-html="ruleForm.dongmanContent"></span>
                        </el-form-item>
                    </div>
                </el-col>
            </el-row>
            <el-form-item class="btn">
                <el-button v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
                <el-button v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
                <el-button v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    import styleJs from "../../../utils/style.js";
    // 数字，邮件，手机，url，身份证校验
    import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
    export default {
        data() {
            return {
                addEditForm:null,
                id: '',
                type: '',
                sessionTable : "",//登录账户所在表名
                role : "",//权限
                userId:"",//当前登录人的id
                ro:{
                    dongmanName: false,
                    dongmanTypes: false,
                    dongmanPhoto: false,
                    dongmanVideo: false,
                    dongmanShijian: false,
                    dongmanFaxing: false,
                    dongmanAdd: false,
                    dongmanGs: false,
                    chuchangTime: false,
                    dongmanSc: false,
                    dongmanJishu: false,
                    dongmanDaoyan: false,
                    zhuangtaiTypes: false,
                    dongmanContent: false,
                    dongmanDelete: false,
                    insertTime: false,
                },
                ruleForm: {
                    dongmanName: '',
                    dongmanTypes: '',
                    dongmanPhoto: '',
                    dongmanVideo: '',
                    dongmanShijian: '',
                    dongmanFaxing: '',
                    dongmanAdd: '',
                    dongmanGs: '',
                    chuchangTime: '',
                    dongmanSc: '',
                    dongmanJishu: '',
                    dongmanDaoyan: '',
                    zhuangtaiTypes: '',
                    dongmanContent: '',
                    dongmanDelete: '',
                    insertTime: '',
                },
                dongmanTypesOptions : [],
                zhuangtaiTypesOptions : [],
                rules: {
                   dongmanName: [
                              { required: true, message: '动漫名称不能为空', trigger: 'blur' },
                          ],
                   dongmanTypes: [
                              { required: true, message: '国漫先驱类型不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   dongmanPhoto: [
                              { required: true, message: '封面不能为空', trigger: 'blur' },
                          ],
                   dongmanVideo: [
                              { required: true, message: '介绍视频不能为空', trigger: 'blur' },
                          ],
                   dongmanShijian: [
                              { required: true, message: '更新时间不能为空', trigger: 'blur' },
                          ],
                   dongmanFaxing: [
                              { required: true, message: '出品公司不能为空', trigger: 'blur' },
                          ],
                   dongmanAdd: [
                              { required: true, message: '地    区不能为空', trigger: 'blur' },
                          ],
                   dongmanGs: [
                              { required: true, message: '发行公司不能为空', trigger: 'blur' },
                          ],
                   chuchangTime: [
                              { required: true, message: '发行日期不能为空', trigger: 'blur' },
                          ],
                   dongmanSc: [
                              { required: true, message: '单集时长不能为空', trigger: 'blur' },
                          ],
                   dongmanJishu: [
                              { required: true, message: '集    数不能为空', trigger: 'blur' },
                          ],
                   dongmanDaoyan: [
                              { required: true, message: '导    演不能为空', trigger: 'blur' },
                          ],
                   zhuangtaiTypes: [
                              { required: true, message: '动漫状态不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   dongmanContent: [
                              { required: true, message: '动漫详情不能为空', trigger: 'blur' },
                          ],
                   dongmanDelete: [
                              { required: true, message: '逻辑删除不能为空', trigger: 'blur' },
                              {  pattern: /^[0-9]*$/,
                                  message: '只允许输入整数',
                                  trigger: 'blur'
                              }
                          ],
                   insertTime: [
                              { required: true, message: '录入时间不能为空', trigger: 'blur' },
                          ],
                }
            };
        },
        props: ["parent"],
        computed: {
        },
        created() {
            //获取当前登录用户的信息
            this.sessionTable = this.$storage.get("sessionTable");
            this.role = this.$storage.get("role");
            this.userId = this.$storage.get("userId");


            if (this.role != "管理员"){
            }
            this.addEditForm = styleJs.addStyle();
            this.addEditStyleChange()
            this.addEditUploadStyleChange()
            //获取下拉框信息
                this.$http({
                    url:`dictionary/page?page=1&limit=100&sort=&order=&dicCode=dongman_types`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        this.dongmanTypesOptions = data.data.list;
                    }
                });
                this.$http({
                    url:`dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhuangtai_types`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        this.zhuangtaiTypesOptions = data.data.list;
                    }
                });


        },
        mounted() {
        },
        methods: {
            // 下载
            download(file){
                window.open(`${file}`)
            },
            // 初始化
            init(id,type) {
                if (id) {
                    this.id = id;
                    this.type = type;
                }
                if(this.type=='info'||this.type=='else'){
                    this.info(id);
                }
                // 获取用户信息
                this.$http({
                    url:`${this.$storage.get("sessionTable")}/session`,
                    method: "get"
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        var json = data.data;
                    } else {
                        this.$message.error(data.msg);
                    }
                });
            },
            // 多级联动参数
            info(id) {
                let _this =this;
                _this.$http({
                    url: `dongman/info/${id}`,
                    method: 'get'
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                        _this.ruleForm = data.data;
                        _this.ruleForm.dongmanContent = _this.ruleForm.dongmanContent.replaceAll("src=\"upload/","src=\""+this.$base.url+"upload/");
                    } else {
                        _this.$message.error(data.msg);
                    }
                });
            },
            // 提交
            onSubmit() {
                this.$refs["ruleForm"].validate(valid => {
                    if (valid) {
                        this.ruleForm.dongmanContent = this.ruleForm.dongmanContent.replaceAll(this.$base.url,"");
                        this.$http({
                            url:`dongman/${!this.ruleForm.id ? "save" : "update"}`,
                            method: "post",
                            data: this.ruleForm
                        }).then(({ data }) => {
                            if (data && data.code === 0) {
                                this.$message({
                                    message: "操作成功",
                                    type: "success",
                                    duration: 1500,
                                    onClose: () => {
                                        this.parent.showFlag = true;
                                        this.parent.addOrUpdateFlag = false;
                                        this.parent.dongmanCrossAddOrUpdateFlag = false;
                                        this.parent.search();
                                        this.parent.contentStyleChange();
                                    }
                                });
                            } else {
                                this.$message.error(data.msg);
                            }
                        });
                    }
                });
            },
            // 获取uuid
            getUUID () {
                return new Date().getTime();
            },
            // 返回
            back() {
                this.parent.showFlag = true;
                this.parent.addOrUpdateFlag = false;
                this.parent.dongmanCrossAddOrUpdateFlag = false;
                this.parent.contentStyleChange();
            },
            //图片
            dongmanPhotoUploadChange(fileUrls){
                this.ruleForm.dongmanPhoto = fileUrls;
                this.addEditUploadStyleChange()
            },
            dongmanVideoUploadChange(fileUrls){
                this.ruleForm.dongmanVideo = fileUrls;
                this.addEditUploadStyleChange()
            },

            addEditStyleChange() {
                this.$nextTick(()=>{
                    // input
                    document.querySelectorAll('.addEdit-block .input .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.inputHeight
                        el.style.color = this.addEditForm.inputFontColor
                        el.style.fontSize = this.addEditForm.inputFontSize
                        el.style.borderWidth = this.addEditForm.inputBorderWidth
                        el.style.borderStyle = this.addEditForm.inputBorderStyle
                        el.style.borderColor = this.addEditForm.inputBorderColor
                        el.style.borderRadius = this.addEditForm.inputBorderRadius
                        el.style.backgroundColor = this.addEditForm.inputBgColor
                    })
                    document.querySelectorAll('.addEdit-block .input .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.inputHeight
                        el.style.color = this.addEditForm.inputLableColor
                        el.style.fontSize = this.addEditForm.inputLableFontSize
                    })
                    // select
                    document.querySelectorAll('.addEdit-block .select .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.selectHeight
                        el.style.color = this.addEditForm.selectFontColor
                        el.style.fontSize = this.addEditForm.selectFontSize
                        el.style.borderWidth = this.addEditForm.selectBorderWidth
                        el.style.borderStyle = this.addEditForm.selectBorderStyle
                        el.style.borderColor = this.addEditForm.selectBorderColor
                        el.style.borderRadius = this.addEditForm.selectBorderRadius
                        el.style.backgroundColor = this.addEditForm.selectBgColor
                    })
                    document.querySelectorAll('.addEdit-block .select .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.selectHeight
                        el.style.color = this.addEditForm.selectLableColor
                        el.style.fontSize = this.addEditForm.selectLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .select .el-select__caret').forEach(el=>{
                        el.style.color = this.addEditForm.selectIconFontColor
                        el.style.fontSize = this.addEditForm.selectIconFontSize
                    })
                    // date
                    document.querySelectorAll('.addEdit-block .date .el-input__inner').forEach(el=>{
                        el.style.height = this.addEditForm.dateHeight
                        el.style.color = this.addEditForm.dateFontColor
                        el.style.fontSize = this.addEditForm.dateFontSize
                        el.style.borderWidth = this.addEditForm.dateBorderWidth
                        el.style.borderStyle = this.addEditForm.dateBorderStyle
                        el.style.borderColor = this.addEditForm.dateBorderColor
                        el.style.borderRadius = this.addEditForm.dateBorderRadius
                        el.style.backgroundColor = this.addEditForm.dateBgColor
                    })
                    document.querySelectorAll('.addEdit-block .date .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.dateHeight
                        el.style.color = this.addEditForm.dateLableColor
                        el.style.fontSize = this.addEditForm.dateLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .date .el-input__icon').forEach(el=>{
                        el.style.color = this.addEditForm.dateIconFontColor
                        el.style.fontSize = this.addEditForm.dateIconFontSize
                        el.style.lineHeight = this.addEditForm.dateHeight
                    })
                    // upload
                    let iconLineHeight = parseInt(this.addEditForm.uploadHeight) - parseInt(this.addEditForm.uploadBorderWidth) * 2 + 'px'
                    document.querySelectorAll('.addEdit-block .upload .el-upload--picture-card').forEach(el=>{
                        el.style.width = this.addEditForm.uploadHeight
                        el.style.height = this.addEditForm.uploadHeight
                        el.style.borderWidth = this.addEditForm.uploadBorderWidth
                        el.style.borderStyle = this.addEditForm.uploadBorderStyle
                        el.style.borderColor = this.addEditForm.uploadBorderColor
                        el.style.borderRadius = this.addEditForm.uploadBorderRadius
                        el.style.backgroundColor = this.addEditForm.uploadBgColor
                    })
                    document.querySelectorAll('.addEdit-block .upload .el-form-item__label').forEach(el=>{
                        el.style.lineHeight = this.addEditForm.uploadHeight
                        el.style.color = this.addEditForm.uploadLableColor
                        el.style.fontSize = this.addEditForm.uploadLableFontSize
                    })
                    document.querySelectorAll('.addEdit-block .upload .el-icon-plus').forEach(el=>{
                        el.style.color = this.addEditForm.uploadIconFontColor
                        el.style.fontSize = this.addEditForm.uploadIconFontSize
                        el.style.lineHeight = iconLineHeight
                        el.style.display = 'block'
                    })
                    // 多文本输入框
                    document.querySelectorAll('.addEdit-block .textarea .el-textarea__inner').forEach(el=>{
                        el.style.height = this.addEditForm.textareaHeight
                        el.style.color = this.addEditForm.textareaFontColor
                        el.style.fontSize = this.addEditForm.textareaFontSize
                        el.style.borderWidth = this.addEditForm.textareaBorderWidth
                        el.style.borderStyle = this.addEditForm.textareaBorderStyle
                        el.style.borderColor = this.addEditForm.textareaBorderColor
                        el.style.borderRadius = this.addEditForm.textareaBorderRadius
                        el.style.backgroundColor = this.addEditForm.textareaBgColor
                    })
                    document.querySelectorAll('.addEdit-block .textarea .el-form-item__label').forEach(el=>{
                        // el.style.lineHeight = this.addEditForm.textareaHeight
                        el.style.color = this.addEditForm.textareaLableColor
                        el.style.fontSize = this.addEditForm.textareaLableFontSize
                    })
                    // 保存
                    document.querySelectorAll('.addEdit-block .btn .btn-success').forEach(el=>{
                        el.style.width = this.addEditForm.btnSaveWidth
                        el.style.height = this.addEditForm.btnSaveHeight
                        el.style.color = this.addEditForm.btnSaveFontColor
                        el.style.fontSize = this.addEditForm.btnSaveFontSize
                        el.style.borderWidth = this.addEditForm.btnSaveBorderWidth
                        el.style.borderStyle = this.addEditForm.btnSaveBorderStyle
                        el.style.borderColor = this.addEditForm.btnSaveBorderColor
                        el.style.borderRadius = this.addEditForm.btnSaveBorderRadius
                        el.style.backgroundColor = this.addEditForm.btnSaveBgColor
                    })
                    // 返回
                    document.querySelectorAll('.addEdit-block .btn .btn-close').forEach(el=>{
                        el.style.width = this.addEditForm.btnCancelWidth
                        el.style.height = this.addEditForm.btnCancelHeight
                        el.style.color = this.addEditForm.btnCancelFontColor
                        el.style.fontSize = this.addEditForm.btnCancelFontSize
                        el.style.borderWidth = this.addEditForm.btnCancelBorderWidth
                        el.style.borderStyle = this.addEditForm.btnCancelBorderStyle
                        el.style.borderColor = this.addEditForm.btnCancelBorderColor
                        el.style.borderRadius = this.addEditForm.btnCancelBorderRadius
                        el.style.backgroundColor = this.addEditForm.btnCancelBgColor
                    })
                })
            },
            addEditUploadStyleChange() {
                this.$nextTick(()=>{
                    document.querySelectorAll('.addEdit-block .upload .el-upload-list--picture-card .el-upload-list__item').forEach(el=>{
                        el.style.width = this.addEditForm.uploadHeight
                        el.style.height = this.addEditForm.uploadHeight
                        el.style.borderWidth = this.addEditForm.uploadBorderWidth
                        el.style.borderStyle = this.addEditForm.uploadBorderStyle
                        el.style.borderColor = this.addEditForm.uploadBorderColor
                        el.style.borderRadius = this.addEditForm.uploadBorderRadius
                        el.style.backgroundColor = this.addEditForm.uploadBgColor
                    })
                })
            },
        }
    };
</script>
<style lang="scss">
.editor{
  height: 500px;

  & /deep/ .ql-container {
	  height: 310px;
  }
}
.amap-wrapper {
  width: 100%;
  height: 500px;
}
.search-box {
  position: absolute;
}
.addEdit-block {
	margin: -10px;
}
.detail-form-content {
	padding: 12px;
	background-color: transparent;
}
.btn .el-button {
  padding: 0;
}</style>

