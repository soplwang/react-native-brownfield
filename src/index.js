/* @flow */
import {NativeModules, Platform} from 'react-native';

module.exports = {
  popToNative: (rootTag: number, animated?: boolean): void => {
    if (Platform.OS === 'ios') {
      NativeModules.ReactNativeBrownfield.popToNative(animated, rootTag);
    } else if (Platform.OS === 'android') {
      NativeModules.ReactNativeBrownfield.popToNative();
    } else {
      console.warn('Not implemented: popToNative');
    }
  },

  setNativeBackGestureAndButtonEnabled: (rootTag: number, enabled: boolean): void => {
    if (Platform.OS === 'ios') {
      NativeModules.ReactNativeBrownfield.setPopGestureRecognizerEnabled(
        enabled, rootTag
      );
    } else if (Platform.OS === 'android') {
      NativeModules.ReactNativeBrownfield.setHardwareBackButtonEnabled(enabled);
    } else {
      console.warn('Not implemented: setNativeGesturesAndButtonsEnabled');
    }
  },
};
