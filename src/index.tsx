import { NativeModules } from 'react-native';

export interface Configuration {
  publishableKey: string;
  debugLoggingEnabled?: boolean;
  maxQueueLimit?: number;
  flushLimit?: number;
  useCloudflareApp?: boolean;
  apiDomain?: string;
  apiPath?: string;
  baseURLAllowList?: string[];
}

export type JsonValue = boolean | number | string | null | JsonList | JsonMap;
export interface JsonMap {
  [key: string]: JsonValue;
  [index: number]: JsonValue;
}
export interface JsonList extends Array<JsonValue> {}

type CastleType = {
  configure(configuration: Configuration): Promise<void>;
  configureWithPublishableKey(publishableKey: string): Promise<void>;
  identify(userId: string, traits: JsonMap): Promise<void>;
  secure(identifier: string): Promise<string>;
  screen(name: string): Promise<void>;
  flush(): Promise<void>;
  flushIfNeeded(url: string): Promise<boolean>;
  reset(): Promise<void>;
  baseUrl(): Promise<string>;
  clientId(): Promise<string>;
  clientIdHeaderName(): Promise<string>;
  userId(): Promise<string>;
  userSignature(): Promise<string>;
  userAgent(): Promise<string>;
  queueSize(): Promise<number>;
};

export const { Castle } = NativeModules;

if (!Castle) {
  throw new Error('Failed to load Castle native module.');
}

export default Castle as CastleType;
