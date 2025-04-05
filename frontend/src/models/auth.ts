// Authentication 模块的数据模型

export interface User {
  username: string;
  email?: string;
  password?: string;
  phone?: string;
  avatar?: string;
  status?: number;
}
export interface RegisterInfo {
  username: string
  email: string
  password: string
  confirm: string
  phone?: string
  smsChapta?: string
  chapta?: string
  remember?: boolean
  idCard?: string
}
export interface AuthResponse {
  code: number;
  message: string;
  token: string;
  user: {
    password: any;
    id: number;
    username: string;
    email?: string;
    avatar?: string;
  }
}

export interface AuthState {
  user: { username: string, rememberPassword?: string } | null;
  token: string | null;
}

