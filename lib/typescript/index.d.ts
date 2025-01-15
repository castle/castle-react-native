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
export interface JsonList extends Array<JsonValue> {
}
type CastleType = {
    configure(configuration: Configuration): Promise<void>;
    configureWithPublishableKey(publishableKey: string): Promise<void>;
    userJwt(userJwt: string): Promise<void>;
    screen(name: string): Promise<void>;
    custom(name: string): Promise<void>;
    customWithProperties(name: string, properties: JsonMap): Promise<void>;
    flush(): Promise<void>;
    flushIfNeeded(url: string): Promise<boolean>;
    reset(): Promise<void>;
    baseUrl(): Promise<string>;
    setAdvertisingIdentifier(identifier: string): Promise<void>;
    createRequestToken(): Promise<string>;
    requestTokenHeaderName(): Promise<string>;
    userAgent(): Promise<string>;
    queueSize(): Promise<number>;
};
export declare const Castle: any;
declare const _default: CastleType;
export default _default;
//# sourceMappingURL=index.d.ts.map