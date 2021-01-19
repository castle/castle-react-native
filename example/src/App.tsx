import * as React from 'react';

import { StyleSheet, View, Text, Button, Alert } from 'react-native';
import Castle from 'react-native-castle';

export default function App() {
  const [version, setVersion] = React.useState<string | undefined>();
  const [clientId, setClientId] = React.useState<string | undefined>();
  const [clientIdHeaderName, setClientIdHeaderName] = React.useState<
    string | undefined
  >();
  const [userId, setUserId] = React.useState<string | undefined>();
  const [baseUrl, setBaseUrl] = React.useState<string | undefined>();
  const [queueSize, setQueueSize] = React.useState<number | undefined>();
  const [userSignature, setUserSignature] = React.useState<
    string | undefined
  >();
  const [userAgent, setUserAgent] = React.useState<string | undefined>();

  React.useEffect(() => {
    Castle.versionString().then(setVersion);
    Castle.clientId().then(setClientId);
    Castle.userId().then(setUserId);
    //Castle.baseUrl().then(setBaseUrl);
    Castle.queueSize().then(setQueueSize);
    Castle.userSignature().then(setUserSignature);
    Castle.userAgent().then(setUserAgent);
    Castle.clientIdHeaderName().then(setClientIdHeaderName);
  }, []);

  Castle.configure({
    publishableKey: 'pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ',
    screenTrackingEnabled: true,
    debugLoggingEnabled: true,
    deviceIDAutoForwardingEnabled: true,
    maxQueueLimit: 1000,
    flushLimit: 20,
    baseUrlWhitelist: ['https://google.com/'],
    useCloudflareApp: false,
  }).then(() => {
    console.log('Castle configured');
  });

  return (
    <View style={styles.container}>
      <Text>Version: {version}</Text>
      <Text>Client id: {clientId}</Text>
      <Text>Client id header name: {clientIdHeaderName}</Text>
      <Text>User id: {userId}</Text>
      <Text>User signature: {userSignature}</Text>
      <Text>Queue size: {queueSize}</Text>
      <Text>User Agent: {userAgent}</Text>
      <Button
        title="Track screen view"
        onPress={async () => {
          await Castle.screen('Example screen');
        }}
      />
      <Button
        title="Identify"
        onPress={async () => {
          await Castle.identify('thisisatestuser', {});
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
