import { ApiResponse } from "./index";
interface Message {
  id: number
  title: string
  content: string
  sender: string
  send_time: string
}

interface MessageForm {
  title: string
  content: string
}

export interface MessageDTO {
  id: number;
  title: string;
  content: string;
  sender: string;
  send_time: string;
}

export interface CreateMessageDTO extends Omit<MessageDTO, 'id'> { }

export interface MessageListResponse extends ApiResponse<{
  total: number;
  list: MessageDTO[];
}> { }

