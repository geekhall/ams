import { Locales } from '~/utils/types';

import en from './en.json';
import cn from './cn.json';

export const messages = {
  [Locales.EN]: en,
  [Locales.CN]: cn,
}

export const defaultLocale = Locales.EN;
