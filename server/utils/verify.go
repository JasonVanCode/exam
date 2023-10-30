package utils

var (
	IdVerify               = Rules{"ID": []string{NotEmpty()}}
	ApiVerify              = Rules{"Path": {NotEmpty()}, "Description": {NotEmpty()}, "ApiGroup": {NotEmpty()}, "Method": {NotEmpty()}}
	MenuVerify             = Rules{"Path": {NotEmpty()}, "ParentId": {NotEmpty()}, "Name": {NotEmpty()}, "Component": {NotEmpty()}, "Sort": {Ge("0")}}
	MenuMetaVerify         = Rules{"Title": {NotEmpty()}}
	LoginexaVerify         = Rules{"Username": {NotEmpty()}, "Password": {NotEmpty()}}
	LoginVerify            = Rules{"CaptchaId": {NotEmpty()}, "Username": {NotEmpty()}, "Password": {NotEmpty()}}
	RegisterVerify         = Rules{"Username": {NotEmpty()}, "NickName": {NotEmpty()}, "Password": {NotEmpty()}, "AuthorityId": {NotEmpty()}}
	RegistersVerify        = Rules{"userName": {NotEmpty()}, "realName": {NotEmpty()}, "password": {NotEmpty()}}
	PageInfoVerify         = Rules{"Current": {NotEmpty()}, "Size": {NotEmpty()}}
	CustomerVerify         = Rules{"CustomerName": {NotEmpty()}, "CustomerPhoneData": {NotEmpty()}}
	AutoCodeVerify         = Rules{"Abbreviation": {NotEmpty()}, "StructName": {NotEmpty()}, "PackageName": {NotEmpty()}, "Fields": {NotEmpty()}}
	AutoPackageVerify      = Rules{"PackageName": {NotEmpty()}}
	AuthorityVerify        = Rules{"AuthorityId": {NotEmpty()}, "AuthorityName": {NotEmpty()}}
	AuthorityIdVerify      = Rules{"AuthorityId": {NotEmpty()}}
	OldAuthorityVerify     = Rules{"OldAuthorityId": {NotEmpty()}}
	ChangePasswordVerify   = Rules{"Password": {NotEmpty()}, "NewPassword": {NotEmpty()}}
	SetUserAuthorityVerify = Rules{"AuthorityId": {NotEmpty()}}
	ExamPageInfo           = Rules{"Current": {NotEmpty()}, "Size": {NotEmpty()}}
	SetRepoInfo            = Rules{"Title": {NotEmpty()}, "QuLists": {NotEmpty()}}
	ElQuInfoVerify         = Rules{"QuType": {NotEmpty()}, "Level": {NotEmpty()}, "Content": {NotEmpty()}}
	SortIdVerify           = Rules{"Id": {NotEmpty()}}
	DepartVerify           = Rules{"DeptName": {NotEmpty()}}
	CreatePaperVerify      = Rules{"ExamId": {NotEmpty()}}
	QuDetailInfo           = Rules{"PaperId": {NotEmpty()}, "QuId": {NotEmpty()}}
	FillAnswerVerify       = Rules{"PaperId": {NotEmpty()}, "QuId": {NotEmpty()}}
)
