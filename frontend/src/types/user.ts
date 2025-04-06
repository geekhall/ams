
export interface User {
  name: string;
  username: string;
  email?: string;
  password?: string;
  sex?: number;
  idCard?: string;
  phone?: string;
  avatar?: string;
  age?: number;
  status?: number;
  version?: number;
}

export interface UserResponse {
  code: number;
  message: string;
  user: User;
}
