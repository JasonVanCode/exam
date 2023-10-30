package examination

type ElQuAnswer struct {
	ID       uint   `gorm:"column:id" json:"id"`             //问题ID
	QuId     uint   `gorm:"column:qu_id" json:"quId"`        //问题ID
	IsRight  bool   `gorm:"column:is_right" json:"isRight"`  //是否正确
	Image    string `gorm:"column:image" json:"image"`       //选项图片
	Content  string `gorm:"column:content" json:"content"`   //答案内容
	Analysis string `gorm:"column:analysis" json:"analysis"` //答案分析
}

func (ElQuAnswer) TableName() string {
	return "el_qu_answer"
}
