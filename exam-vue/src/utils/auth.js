import Cookies from 'js-cookie'

const TokenKey = 'Admin-Token'
const upToken = 'qiniuyun'
const ToUsername = 'shname'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function getUpToken() {
  return Cookies.get(upToken)
}

export function getUsername() {
  return Cookies.get(ToUsername)
}

export function setUpToken(token) {
  return Cookies.set(upToken, token)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function setUsername(token) {
  return Cookies.set(ToUsername, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}
