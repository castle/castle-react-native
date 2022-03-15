import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text, Button, Alert } from 'react-native';
import Castle from '@castleio/react-native-castle';

export default function App() {
  const [requestToken, setRequestToken] = useState<string | undefined>();
  const [requestTokenHeaderName, setRequestTokenHeaderName] = useState<
    string | undefined
  >();
  const [baseUrl, setBaseUrl] = useState<string | undefined>();
  const [queueSize, setQueueSize] = useState<number | undefined>();
  const [userAgent, setUserAgent] = useState<string | undefined>();

  useEffect(() => {
    Castle.configure({
      publishableKey: 'pk_CTsfAeRTqxGgA7HHxqpEESvjfPp4QAKA',
      debugLoggingEnabled: true,
      maxQueueLimit: 1000,
      flushLimit: 20,
      useCloudflareApp: false,
      baseURLAllowList: ['google.com', 'docs.castle.io'],
    }).then(async () => {
      await Castle.userJwt(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjMjQ0ZjMwLTM0MzItNGJiYy04OGYxLTFlM2ZjMDFiYzFmZSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsInJlZ2lzdGVyZWRfYXQiOiIyMDIyLTAxLTAxVDA5OjA2OjE0LjgwM1oifQ.eAwehcXZDBBrJClaE0bkO9XAr4U3vqKUpyZ-d3SxnH0'
      );

      // Fetch properties
      Castle.createRequestToken().then(setRequestToken);
      Castle.baseUrl().then(setBaseUrl);
      Castle.queueSize().then(setQueueSize);
      Castle.userAgent().then(setUserAgent);
      Castle.requestTokenHeaderName().then(setRequestTokenHeaderName);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Request token: {requestToken}</Text>
      <Text>Request token header name: {requestTokenHeaderName}</Text>
      <Text>BaseUrl: {baseUrl}</Text>
      <Text>Queue size: {queueSize}</Text>
      <Text>User Agent: {userAgent}</Text>
      <Button
        title="Track screen view"
        onPress={async () => {
          await Castle.screen('Example screen');
        }}
      />
      <Button
        title="Track custom event"
        onPress={async () => {
          await Castle.custom('Custom event');
        }}
      />
      <Button
        title="Track custom event with properties"
        onPress={async () => {
          await Castle.customWithProperties('Custom event with properties', {
            someKey: 'value',
          });
        }}
      />
      <Button
        title="Set user jwt"
        onPress={async () => {
          await Castle.userJwt(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjMjQ0ZjMwLTM0MzItNGJiYy04OGYxLTFlM2ZjMDFiYzFmZSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsInJlZ2lzdGVyZWRfYXQiOiIyMDIyLTAxLTAxVDA5OjA2OjE0LjgwM1oifQ.eAwehcXZDBBrJClaE0bkO9XAr4U3vqKUpyZ-d3SxnH0'
          );
        }}
      />
      <Button
        title="Test request interception"
        onPress={() => Alert.alert('Request interception pressed')}
      />
      <Button
        title="Flush"
        onPress={async () => {
          await Castle.flush();
        }}
      />
      <Button
        title="Reset"
        onPress={async () => {
          await Castle.reset();
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
