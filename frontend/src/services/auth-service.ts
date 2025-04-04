// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> 服务模块(services/auth-service.ts) -> API模块(api/loki.ts) -> Axios
import loki from '~/api/loki'
import axios from "axios"
import { User, AuthResponse } from "~/models/auth"


export class AuthService {
  // 用户登录
  static async login(user: User): Promise<AuthResponse> {
    console.log("####### auth-service.ts login() #######");
    return loki.post("/auth/login", user);
  }

  // 用户注册
  static async register(user: User): Promise<AuthResponse> {
    console.log("####### auth-service.ts register() #######");
    return loki.post("/auth/register", user);
  }

  // 用户注销
  static async logout(): Promise<void> {
    console.log("####### auth-service.ts logout() #######");
    localStorage.removeItem("token");
    delete axios.defaults.headers.common['Authorization']
  }
}
