   M S B A M L   `   `   `  ����  
ChatClient    ChatClient.UserMenu   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  UserMenu��5   	   $	��350��6   $	��525��6'    � Icon$ media/favicon.gif��63   ���	#FF3C3636��6c   Z�  � 	Resources 5         	OnLoaded1 �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value R� KeyTime  System.Windows.Visibility   Visible	 R� Value��%�  &	        �� 5      .��5      U� $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�6#   $
 Menu��6�   .\�5        $ 0:0:1��6   $ -508.943Q�6+   5	      U� 5
      $ Opacity�6,   $
 Menu��6P   .\�5        $ 0:0:1��6'   $	 1.0Q�67   5      T� 5      $ (UIElement.Visibility)�6,   $ 	MenuLabel��6_   ..�5      i� $ 0:0:0.9��6&   #	 Z 68   i� 5      $ 0:0:2��6&   #	 Z 66   5      U� 5      $ (UIElement.Opacity)�6,   $ 	MenuLabel��6\   .\�5        $ 0:0:0.9��6$   $ 0Q�66     5      $ 0:0:2��6$   $ 1Q�64   5      T� 5      $ (UIElement.Visibility)�6,   $ ChatClientOnlyButton��6_   ..�5      i� $ 0:0:1��6&   #	 Z 66   5      U� 5      $ (UIElement.Opacity)�6,   $ ChatClientOnlyButton��6\   .\�5        $ 0:0:1��6$   $ 0Q�64     5      $ 0:0:2��6$   $ 1Q�64   5      5      5      
 � Triggers
 5      :� 5   
    :� RoutedEvent$ FrameworkElement.Loaded��6   .[�5       �� #��[  6   5!      ��5#      �� 5$   
    �� EndPoint$ 0.5,1&�6    �� 
StartPoint$ 0.5,0&�6/   .��5%      �  � Color$ Black��6    � Offset$ 0Q�6)   � 5&      $ 	#FF6F6D95��6   $ 1Q�6-   5'      .��5)      � -   5         �Name$ GridBody��5)      .+�5*   
   �� -   5        $��WindowMainCanvas��5*      }�.  .+�5+      �� -   5         ��Name$
 Menu��5+      ���	#755E5E83$
��Left=�67   $	��273��6R   
���   �$	��Top=�6n   $	��446��6�    �� RadiusY$
 27.5��6�    �� RadiusX$
 27.5��6�    �� Left$	 545��6�   
 �� Top$ 23��6�    J� RenderTransformOrigin$ 0.5,0.5&�6�    J� Opacity$ 0Q�6�   z�5,      V� 5-      .~�5.      �� �� 5/      �� 50      T� 51      52      54      �� 55      -   5         ��Name$ ChatClientOnlyButton��55      $��Chat (Clients Only)��63   $
��Left=�6Q   $��80��6l   $��
132,65,0,0q�6x     OTonButtonStyle1#���  6�   $	��Top=�6�   $	��259��6�   $��Impact)�6�   $��26.667(�6�   ���	#FF1C045B$y�Hidden=�66  �� 56      -   5         ��Name$ 	MenuLabel��56      $
��Left=�6+   $��25��6F   $��
231,35,0,0q�6R   $
��Wrap=�6f   $
��Menu��6z   $	��Top=�6�   $	��101��6�   $��Copperplate Gothic Light)�6�   $��20(�6�   $y�Hidden=�6�   ��57      �� 58      $ 0.5,1&�6*   $ 0.5,0&�6;   .��59      � $ 	#FF0A1D5F��6'   $ 0.374Q�69   � 5:      $ 	#FF6E7FB9��6'   $ 1Q�69   5;      5=      �� 5>      -   5        $��errorCanvas��5>   )   }�. $	��446��6<   $��17��6H   $��36,152,35,151q�6T   .+�5?      �� -   5        $ errorMarquee��5?      ���	#FF0A0A0C$
��Left=�6C   $��17��6^   ���	#FF5B1D1D$	��Top=�6}   $	��446��6�   $ -1��6�   $y�Hidden=�6�   �� 5@      -   5        $ 	errorText��5@      $
��Left=�6/   $��16��6J   $
��Wrap=�6V   $��	TextBlock��6j   $	��Top=�6{   $	��690��6�   $��Copperplate Gothic Bold)�6�   $��16(�6�   ���	#FF7E0202$y�Hidden=�6�   5A      5B      5C      5D      