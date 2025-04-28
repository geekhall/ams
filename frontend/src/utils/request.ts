// src/utils/request.ts
import axios from 'axios'

const request = axios.create({
    baseURL: '/api',
    timeout: 10000,
    // 如果你用的是 cookie/session，可以打开下面这一行
    // withCredentials: true,
})

// 获取 Token
function getAuthToken() {
    return localStorage.getItem('token'); // 从 localStorage 获取 Token
}

// 添加 Authorization 头部
function addAuthorizationHeader(config: any) {
    const token = getAuthToken();
    if (token) {
        config.headers['Authorization'] = `Bearer ${token}`; // 将 Token 添加到请求头中
    }
    return config;
}

// 使用请求拦截器，每次发送请求前自动添加 Authorization 头
request.interceptors.request.use(addAuthorizationHeader, error => {
    return Promise.reject(error); // 如果发生错误，直接返回错误
});

// 导出封装好的 axios 实例
export default request;
