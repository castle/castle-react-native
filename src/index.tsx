import { NativeModules } from 'react-native';

export interface Configuration {
  publishableKey: string;
  debugLoggingEnabled: boolean;
  maxQueueLimit: number;
  flushLimit: number;
  baseUrlWhitelist: Array<string>;
  useCloudflareApp: boolean;
}

export type JsonValue = boolean | number | string | null | JsonList | JsonMap;
export interface JsonMap {
  [key: string]: JsonValue;
  [index: number]: JsonValue;
}
export interface JsonList extends Array<JsonValue> {}

type CastleType = {
  configure(configuration: Configuration): Promise<void>;
  versionString(): Promise<string>;
  identify(userId: string, traits: JsonMap): Promise<void>;
  secure(identifier: string): Promise<string>;
  screen(name: string): Promise<void>;
  flush(): Promise<void>;
  flushIfNeeded(url: string): Promise<boolean>;
  reset(): Promise<void>;
  isWhitelistUrl(url: string): Promise<boolean>;
  baseUrl(): Promise<string>;
  clientId(): Promise<string>;
  clientIdHeaderName(): Promise<string>;
  userId(): Promise<string>;
  userSignature(): Promise<string>;
  userAgent(): Promise<string>;
  queueSize(): Promise<number>;
};

const { Castle } = NativeModules;

export default Castle as CastleType;
