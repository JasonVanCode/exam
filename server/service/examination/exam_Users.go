package examination

import (
	"errors"
	"examination/server/global"
	"examination/server/model/common/request"
	"examination/server/model/examination"
	"examination/server/utils"
	"fmt"
	"gorm.io/gorm"
)

type UserService struct{}

//@author: [piexlmax](https://github.com/piexlmax)
//@author: [SliverHorn](https://github.com/SliverHorn)
//@function: Login
//@description: 用户登录
//@param: u *model.SysUser
//@return: err error, userInter *model.SysUser

func (userService *UserService) Login(u *examination.SysUser) (userInter *examination.SysUser, err error) {
	if nil == global.GVA_DB {
		return nil, fmt.Errorf("db not init")
	}
	var user examination.SysUser
	err = global.GVA_DB.Where("user_name = ?", u.UserName).First(&user).Error

	if err == nil {
		if ok := utils.BcryptCheck(u.Password, user.Password); !ok {
			fmt.Println(utils.BcryptCheck(u.Password, user.Password))
			return nil, errors.New("密码错误")
		}
	}
	return &user, err
}

func (userService *UserService) Register(u examination.SysUser) (userInter examination.SysUser, err error) {
	var user examination.SysUser
	fmt.Println(2222)
	if !errors.Is(global.GVA_DB.Where("user_name = ?", u.UserName).First(&user).Error, gorm.ErrRecordNotFound) { // 判断用户名是否注册
		return userInter, errors.New("用户名已注册")
	}
	// 否则 附加uuid 密码hash加密 注册
	u.Password = utils.BcryptHash(u.Password)
	err = global.GVA_DB.Create(&u).Error
	return u, err
}

func (userService *UserService) SaveUser(u examination.SysUser, id uint) (err error) {

	return global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		u.CreatedAt = new(global.LocalTime)
		fmt.Println(11111)
		// 否则 附加uuid 密码hash加密 注册
		u.Password = utils.BcryptHash(u.Password)

		if err := tx.Debug().Model(&examination.SysUser{}).
			Select("depart_id", "identification", "real_name", "role_ids", "user_name", "password").
			Where("id = ? ", id).
			Updates(map[string]interface{}{
				"depart_id":      u.DepartId,
				"identification": u.Identification,
				"real_name":      u.RealName,
				"role_ids":       u.RoleIds,
				"user_name":      u.UserName,
				"password":       u.Password,
			}).Error; err != nil {
			return err
		}
		return nil
	})

}

func (userService *UserService) GetUserById(id uint) (userInter examination.SysUser, err error) {
	var user examination.SysUser
	if errors.Is(global.GVA_DB.First(&user, id).Error, gorm.ErrRecordNotFound) { // 判断用户名是否注册
		return userInter, errors.New("该账户不存在")
	}
	return user, nil
}

// GetUserList
// @function: GetCompanyList
// @description: 用户列表分页
func (service *UserService) GetUserList(info request.PageInfos) (list interface{}, total int64, err error) {

	limit := info.Size
	offset := info.Size * (info.Current - 1)
	db := global.GVA_DB.Model(&examination.SysUser{})
	var sysUser []examination.SysUser
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Preload("Depart").Limit(limit).Offset(offset).Order("id desc").Find(&sysUser).Error
	return sysUser, total, err
}

// DeleteUser
// @function: DeleteUser
// @description: 删除会员
// @param: quType string
// @return: list interface{}
func (service *UserService) DeleteUser(getId request.IdsReq) (err error) {

	var sysUser []examination.SysUser

	err = global.GVA_DB.Find(&sysUser, "id in ?", getId.Ids).Delete(&sysUser).Error
	if err != nil {
		return err
	}

	return nil
}

// StateUser
// @function: StateUser
// @description: 删除会员
// @param: quType string
// @return: list interface{}
func (service *UserService) StateUser(getId request.IdsReqState) (err error) {
	if err := global.GVA_DB.Model(&examination.SysUser{}).
		Select("state").Where("id in ? ", getId.Ids).
		Updates(map[string]interface{}{
			"state": getId.State,
		}).Error; err != nil {
		return err
	}
	return nil

}
