   M S B A M L   `   `   `  ����  
ChatClient    ChatClient.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6F   -   5          � Title$  
MainWindow��5   	   $	��350��6   $	��525��6)    � Icon$ media/favicon.gif��65   ���	#FF3C3636��6e   Z�  � 	Resources 5          logolayer2excompsoundfad_mp4 g� FillBehavior p� Source �� 
TargetName �� TargetProperty9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value	 R� KeyTime  System.Windows.Visibility
   Visible R� Value   Hidden  MainLoginAppear��%m  &	        &	 �    �� 5   
   -   5        $
 Stop=�5   \   .��5      p� $( "media/logolayer2excompsoundfad.mp4?�6   $" logolayer2excompsoundfad_mp4��6E   U� 5	      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.X)�6)   $" logolayer2excompsoundfad_mp4��6�   .\�5
        $ 0��6!   $
 -606Q�6-   5      U� 5      $U O(UIElement.RenderTransform).(TransformGroup.Children)[3].(TranslateTransform.Y)�6)   $" logolayer2excompsoundfad_mp4��6�   .\�5        $ 0��6!   $
 -449Q�6-   5      T� 5      $ (UIElement.Visibility)�6)   $" logolayer2excompsoundfad_mp4��6\   ..�5      i� $	 0��6#   # Z
 6/   i� 5      $	 0:0:28��6#   # Z 64   5      5      �� 5   
   .��5      T� $ (UIElement.Visibility)�6)   $" logolayer2excompsoundfad_mp4��6\   ..�5      i� $	 0��6#   # Z 6/   5      U� 5      $ (UIElement.Opacity)�6)   $
 Menu��6Y   .\�5        $ 0��6!   $ 0Q�6-     5      $ 0:0:1��6!   $ 1Q�61   5      U� 5      $ (UIElement.Opacity)�6)   $ button��6Y   .\�5        $ 0��6!   $ 0Q�6-     5      $ 0:0:1��6!   $ 1Q�61   5      U� 5       $ (UIElement.Opacity)�6)   $ UsernameField��6Y   .\�5!        $ 0��6!   $ 0Q�6-     5"      $ 0:0:1��6!   $ 1Q�61   5#      U� 5$      $ (UIElement.Opacity)�6)   $ 	textBlock��6Y   .\�5%        $ 0��6!   $ 0Q�6-     5&      $ 0:0:1��6!   $ 1Q�61   5'      U� 5(      $ (UIElement.Opacity)�6)   $ UserPassField��6Y   .\�5)        $ 0��6!   $ 0Q�6-     5*      $ 0:0:1��6!   $ 1Q�61   5+      U� 5,      $ (UIElement.Opacity)�6)   $ 
textBlock1��6Y   .\�5-        $ 0��6!   $ 0Q�6-     5.      $ 0:0:1��6!   $ 1Q�61   5/      50      51      ��52      �� 53   
    �� EndPoint$ 0.5,1&�6    �� 
StartPoint$ 0.5,0&�6/   .��54      �  � Color$ Black��6    � Offset$ 0Q�6)   � 55      $ 	#FF6F6D95��6   $ 1Q�6-   56       � Triggers 58      :� 59   
    :� RoutedEvent$ FrameworkElement.Loaded��6   .[�5:      �� -   5         ��Name$2 ,logolayer2excompsoundfad_mp4_BeginStoryboard��5:      #��[  6T   5;      :� 5<   
   $ Keyboard.KeyDown��6   .[�5=      ��  �� BeginStoryboardName$2 ,logolayer2excompsoundfad_mp4_BeginStoryboard��6   5>      .��5@      � .+�5A   
   r� -   5         r�Name$" logolayer2excompsoundfad_mp4��5A      $��607,450,-605,-450q�6=    r� Stretch$
 Fill=�6X    J� RenderTransformOrigin$ 0.5,0.5&�6g   z�5B      V� 5C      .~�5D      �� �� 5E      �� 5F      T� 5G      5H      5J      �� 5K   
   -   5         ��Name$
 Menu��5K      ���	#755E5E83$
��Left=�63   $	��273��6N   $��	35,23,0,0q�6[   
���   �$	��Top=�6}   $	��446��6�    �� RadiusY$
 27.5��6�    �� RadiusX$
 27.5��6�    J� Opacity$ 0Q�6�   �� 5L   
   -   5         ��Name$ button��5L      $��Log In��6!   $
��Left=�62   $��80��6M   $��162,200,0,0q�6Y     OTonButtonStyle1#���  6n   $	��Top=�6�   $	��187��6�   $��Impact)�6�   $��26.667(�6�   ���	#FF1C045B �� 	IsDefault . $ 0Q�6  �� 5M   
   -   5         ��Name$ UsernameField��5M      $
��Left=�6)   $��25��6D   $��
204,57,0,0q�6P    �� TextWrapping$
 Wrap=�6d   $��
[Username]��6x   $	��Top=�6�   $	��193��6�   ���	#BD251E1E  � UseLayoutRounding  .  $��Copperplate Gothic Light)�6�   $��16(�6  $ 0Q�6  .��6  ��5N      �� 5O      $ 0.5,1&�6&   ! � MappingMode$! RelativeToBoundingBox=�67   $ 0.5,0&�6[   .��5P      � $ 	#FF1E2E95��6#   $	 0.5Q�65   � 5Q      $ White��6#   $ 1Q�61   5R      .��5S   "   5T      �� 5U   
   -   5        " ��Name$" 	textBlock��5U      $
��Left=�6'   $��16��6B   $��	98,57,0,0q�6N   $
��Wrap=�6a   $��	Username:��6u   $	��Top=�6�   $	��101��6�   $��Copperplate Gothic Light)�6�   $��16(�6�   $ 0Q�6�   ��5V      �� 5W      $ 0.5,1&�6&   $ 0.5,0&�67   .��5X      � $ 	#FF0A1D5F��6#   $ 0.374Q�65   � 5Y      $ 	#FF6E7FB9��6#   $ 1Q�65   5Z      5\      G� 5]   
   -	   5        # G�Name$# UserPassField��5]      $
��Left=�6-   $��25��6H   $��
204,99,0,0q�6T   $	��Top=�6h   $	��193��6�   ���	#BD251E1E  .  $��Copperplate Gothic Light)�6�   $��16(�6�   $ 0Q�6�   ��5^      �� 5_      $ 0.5,1&�6&   $! RelativeToBoundingBox=�67   $ 0.5,0&�6[   .��5`      � $ 	#FF1E2E95��6#   $	 0.5Q�65   � 5a      $ White��6#   $ 1Q�61   5b      5d      �� 5e   
   -
   5        $" 
textBlock1��5e      $
��Left=�6(   $��16��6C   $��	98,99,0,0q�6O   $
��Wrap=�6b   $��	Password:��6v   $	��Top=�6�   $	��101��6�   $��Copperplate Gothic Light)�6�   $��16(�6�   $ 0Q�6�   ��5f      �� 5g      $ 0.5,1&�6&   $ 0.5,0&�67   .��5h      � $ 	#FF0A1D5F��6#   $ 0.374Q�65   � 5i      $ 	#FF6E7FB9��6#   $ 1Q�65   5j      5l      �� 5m   
   -   5        $ ��Name$$ errorCanvas��5m   %   }�. $	��446��6:   $��17��6F   $��36,152,35,151q�6R   $ 0Q�6i   .+�5n      �� -   5        $ errorMarquee��5n      ���	#FF0A0A0C$
��Left=�6?   $��17��6Z   ���	#FF5B1D1D$	��Top=�6y   $	��446��6�   % �� Left$% -1��6�   $y�Hidden=�6�   �� 5o      -   5        $" 	errorText��5o      $
��Left=�6+   $��16��6F   $
��Wrap=�6R   $��	TextBlock��6f   $	��Top=�6w   $	��690��6�   $��Copperplate Gothic Bold)�6�   $��16(�6�   ���	#FF7E0202$y�Hidden=�6�   5p      5q      5r      