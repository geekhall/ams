// 调用顺序：Vue组件 -> Pinia存储模块(store/user.ts) -> 服务模块(services/user-service.ts) -> API模块(utils/http.ts) -> Axios
import { defineStore } from 'pinia'
import { User } from '~/models/user'
import { UserService } from '~/services/user-service'

// 定义一个名为 user 的 store
export const useUserStore = defineStore('user', {
  state: (): User => ({
    name: '',
    username: '',
    email: '',
    password: '',
    sex: 0,
    idCard: '',
    phone: '',
    avatar: '',
    age: 0,
    status: 0,
    version: 0,
  }),
  getters: {
    name: (state): string | null => state.name || null,
    username: (state): string | null => state.username,
    email: (state): string | null => state.email || null,
    password: (state): string | null => state.password || null,
    sex: (state): number | null => state.sex || null,
    idCard: (state): string | null => state.idCard || null,
    phone: (state): string | null => state.phone || null,
    avatar: (state): string | null => state.avatar || null,
    age: (state): number | null => state.age || null,
    status: (state): number | null => state.status || null,
    version: (state): number | null => state.version || null,
  },
  actions: {
    async list() {
      console.log('get user list ::::: ');
      const response = await UserService.list()
      console.log('get user list ::::: ', response);
    },
  }
})

