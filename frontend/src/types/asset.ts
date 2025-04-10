import { ApiResponse } from "."

export interface AssetDTO {
  assetName: string
  assetCode: string
  assetType: string
  departmentName: string
  status: string
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
}

export type AssetTypeListResponse = ApiResponse<AssetType[]>
