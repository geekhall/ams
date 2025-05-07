import { ApiResponse } from "./index";

export interface MessageDTO {
  id: number;
  title: string;
  content: string;
  sender: string;
  date: string;
  receiverType: 'all' | 'specific';
  receivers: number[];
  status: 'active' | 'deleted';
}

export interface CreateMessageDTO extends Omit<MessageDTO, 'id'> { }

export interface MessageListResponse extends ApiResponse<{
  total: number;
  list: MessageDTO[];
}> { }

