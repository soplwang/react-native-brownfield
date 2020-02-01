declare module 'react-native-brownfield' {
  /**
   * A method to pop to native screen used to push React Native experience.
   */
  export function popToNative(rootTag: number, animated?: boolean): void;

  /**
   * A method used to toggle iOS native back gesture and Android hardware back button.
   */
  export function setNativeGesturesAndButtonsEnabled(rootTag: number, enabled: boolean): void;
}