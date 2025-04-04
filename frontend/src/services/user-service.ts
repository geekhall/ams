// （未使用）
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> 服务模块(services/auth-service.ts) -> API模块(utils/http.ts) -> Axios
import http from '~/api/loki'
import axios from "axios"
import { User, UserResponse } from "~/models/user"


// TODO: 统一所有后端返回接口类型
export class UserService {
  // 获取所有用户
  static async list(): Promise<UserResponse> {
    console.log("####### auth-service.ts login() #######");
    return http.post("/user/list");
  }
}

