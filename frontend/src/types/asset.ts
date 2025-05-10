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
}

export type AssetTypeListResponse = ApiResponse<AssetType[]>
