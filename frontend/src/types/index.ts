
import axios, { AxiosResponse } from 'axios'

export interface ApiResponse<T> extends AxiosResponse<T> {
  code: number
  message: string
  data: T
}
