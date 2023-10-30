import { post } from '@/utils/request'

export function login(data) {
  return post('/user/login', data)
}

export function getInfo(token) {
  console.log(token)
  return post('/user/info', token)
}

export function logout() {
  return post('/exam/api/sys/user/logout', {})
}

export function reg(data) {
  return post('/user/register', data)
}

export function jsonInBlacklist(){
  return post('/jwt/jsonInBlacklist')
}
