import request from '@/utils/request'     // 假设你用的是 axios 封装

export interface ReportRequest {
    year: number
    type: 'year' | 'quarter'
    quarter?: number
}

export function generateReport(params: ReportRequest) {
    return request.post('/report/export', params, {
        responseType: 'blob'   // 二进制流
    })
}
