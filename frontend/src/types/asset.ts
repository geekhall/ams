
export interface Asset {
  id: string
  assetName: string
  assetCode: string
  assetType: string
  departmentName: string
  status: string
  purchaseDate: string
  purchasePrice: number
  count: number
}

export interface AssetListResponse {
  code: number
  message: string
  data: {
    items: Asset[]
    total: number
  };
}

export interface AssetNamesResponse {
  code: number
  message: string
  data: {
    names: string[]
  };
}

export interface AssetType {
  id: string
  name: string
}

export interface AssetTypeListResponse {
  code: number
  message: string
  data: AssetType[]
}
