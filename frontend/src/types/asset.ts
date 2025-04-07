
export interface Asset {
  id: string;
  assetName: string
  assetCode: string
  assetType: string
  departmentName: string
  status: number
  purchaseDate: string
  purchasePrice: number
  count: number
}

export interface AssetListResponse {
  code: number;
  message: string;
  data: Asset[];
}
