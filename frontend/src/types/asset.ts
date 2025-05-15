import { ApiResponse } from "."

export interface AssetDTO {
  name: string
  code: string
  sn: string
  type: string
  model: string
  config: string
  ip: string
  description: string
  provider: string
  departmentName: string
  ownerName: string
  userName: string
  location: string
  status: string
  useStatus: string
  purchaseDate: string
  purchasePrice: number
  count: number
}

export interface Asset extends AssetDTO {
  id: string
}

export type AssetListResponse = ApiResponse<{
  items: Asset[]
  total: number
}>

export type AssetNamesResponse = ApiResponse<{
  names: string[]
}>

export interface AssetType {
  id: string
  name: string
  status: 'active' | 'inactive'
  assetCount?: number  // 关联的资产数量
}

export type AssetTypeListResponse = ApiResponse<AssetType[]>

export interface AssetSummary {
  totalCount: number
  totalValue: number
  monthlyCountGrowth: number
  monthlyValueGrowth: number
}

export type AssetSummaryResponse = ApiResponse<AssetSummary>

// 资产领用记录
export interface AssetBorrowRecord {
  id: string
  name: string
  code: string
  type: string
  borrowDepartment: string
  borrower: string
  borrowCount: number
  borrowDate: string
  expectedReturnDate: string
  actualReturnDate?: string
  status: 'using' | 'returned' | 'overdue'
  reason: string
  returnNote?: string
}

export interface AssetBorrowListResponse {
  items: AssetBorrowRecord[]
  total: number
}

// 资产领用
export interface BorrowAssetParams {
  assetId: string
  borrowCount: number
  borrowDepartment: string
  borrower: string
  borrowDate: string
  expectedReturnDate: string
  reason: string
}
