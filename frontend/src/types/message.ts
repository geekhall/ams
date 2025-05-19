import { ApiResponse } from "./index";
export interface Message {
  id: string
  title: string
  content: string
  sender: string
  send_time: string
}

export interface MessageForm {
  title: string
  content: string
}

export interface MessageDTO {
  id: string;
  title: string;
  content: string;
  sender: string;
  send_time: string;
  type: string;
  status: number;
}

export interface CreateMessageDTO extends Omit<MessageDTO, 'id'> { }

export interface MessageListResponse extends ApiResponse<{
  total: number;
  items: MessageDTO[];
}> { }

