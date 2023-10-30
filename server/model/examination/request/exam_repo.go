package request

import (
	"examination/server/model/examination/common"
)

type ExamRepoRequest struct {
	common.PageInfo
	Params ExamRepoRequestParam `json:"params"`
}

type ExamRepoRequestParam struct {
	Title string `json:"title"`
}

// 保存题库
type SetRepoRequest struct {
	Id       int             `json:"id"`
	Title    string          `json:"title"`
	Remark   string          `json:"remark"`
	RepoList []QuDetailLists `json:"repoList"`
}

// 题目
type QuDetailLists struct {
	QuType   int `json:"quType"`
	QuAllNum int `json:"quAllNum"`
	QuLists  []struct {
		Id int `json:"id"`
	} `json:"quLists"`
}

type RepoDetailForm struct {
	Id int `json:"id"`
}

type RepoDetailRet struct {
	Id          int                 `json:"id"`
	Title       string              `json:"title"`
	Remark      string              `json:"remark"`
	RepoQuLists []RepoDetailQuLists `json:"repoQuLists"`
}

type RepoDetailQuLists struct {
	QuType  int `json:"quType"`
	QuLists []struct {
		Id int `json:"id"`
	} `json:"quLists"`
	QuAllNum int `json:"quAllNum"`
}

type DelRepo struct {
	Ids []int `json:"ids"`
}
