import loki from "./loki";
import { AxiosRequestConfig } from "axios";
import { ApiResponse } from "@/types/index";
import { MessageDTO, CreateMessageDTO, MessageListResponse } from "@/types/message";

// 获取消息列表
export const getMessageList = async (params: {
  pageIndex: number;
  pageSize: number;
  userId: string;
  search?: string;
}): Promise<MessageListResponse> => {
  return await loki.request({
    url: "/message/list",
    method: "POST",
    data: params,
  } as AxiosRequestConfig);
};

// 发送消息
export const sendMessage = async (message: CreateMessageDTO): Promise<ApiResponse<MessageDTO>> => {
  return await loki.request({
    url: "/message/send",
    method: "POST",
    data: message,
  } as AxiosRequestConfig);
};

// 更新消息
export const updateMessage = async (message: MessageDTO): Promise<ApiResponse<MessageDTO>> => {
  return await loki.request({
    url: "/message/update",
    method: "POST",
    data: message,
  } as AxiosRequestConfig);
};

// 删除消息
export const deleteMessage = async (id: number): Promise<ApiResponse<any>> => {
  return await loki.request({
    url: `/message/delete/${id}`,
    method: "DELETE",
  } as AxiosRequestConfig);
};

// 获取角色列表
export const getRoleList = async (): Promise<ApiResponse<Array<{
  id: number;
  name: string;
}>>> => {
  return await loki.request({
    url: "/role/list",
    method: "GET",
  } as AxiosRequestConfig);
};
