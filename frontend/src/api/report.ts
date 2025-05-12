import loki from '@/api/loki'     // 假设你用的是 axios 封装
import { AxiosRequestConfig } from 'axios'
export interface ReportRequest {
    year: number
    type: 'year' | 'quarter'
    quarter?: number
}

export const generateReport = async (params: ReportRequest) => {
    return await loki.request({
        url: "/report/export",
        method: "POST",
        data: { params },
        responseType: 'blob'   // 二进制流
    } as AxiosRequestConfig);
}
