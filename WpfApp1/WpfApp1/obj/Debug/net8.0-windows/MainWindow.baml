   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	   -   5          � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)   .��5
      � $��10q�6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5       � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      �� 5      $
��Auto �6   .+�5   
   �� $��Quản lý sản phẩm��6   $��0��6+   $��0��68   $��2��6H   $��Center=�6\   $��30(�6y   $
��Bold"�6�   �� 5   
   $��1��6   $��0��6   $��Mã sản phẩm��6-   $��10q�6C   $��Center=�6O   �� 5   
   -   5         ��Name$ txtMaSP��5   0   $��1��6   $��1��6    $��10q�6A   $	��200��6M   $
��Left=�6Y   �� 5   
   $��2��6   $��0��6   $��Tên sản phẩm��6-   $��10q�6D   $��Center=�6P   �� 5   
   -   5        $ txtTenSp��5   0   $��2��6   $��1��6    $��10q�6B   $	��300��6N   $
��Left=�6Z   �� 5   
   $��3��6   $��0��6   $��Số lượng��6-   $��10q�6@   $��Center=�6L   �� 5   
   -   5        $ 
txtSoLuong��5   0   $��3��6   $��1��6    $��10q�6D   $	��200��6P   $
��Left=�6\   �� 5    
   $��4��6   $��0��6   $��
Đơn giá��6-   $��10q�6?   $��Center=�6K   �� 5!   
   -   5        $ 	txtDonGia��5!   0   $��4��6   $��1��6    $��10q�6C   $	��200��6O   $
��Left=�6[   �� 5"   
   $��5��6   $��0��6   $��
Mã loại��6-   $��10q�6?   $��Center=�6K   �� 5#   
   -   5         ��Name$	 cbo��5#   <   $��10q�6   $��5��6   $��1��6,   $
��Left=�6I   $	��150��6d   &   System.Windows.Controls.DataGrid  5%   
   -   5          Name$	 dtg��5%   /      AutoGenerateColumns$ False��6   $��6��6<   $��0��6I   $��2��6Y      Columns 5&      0  *System.Windows.Controls.DataGridTextColumn  5'      ,  &System.Windows.Controls.DataGridColumn   Header$ Mã sản phẩm��6%   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6:   �� *MaSp+  5(      $ Tên sản phẩm��6%   	 6;   �� *TenSp+  5)      $ Tên loại��6%   	 67   �� *	TenLoai+  5*      $ 
Đơn giá��6%   	 66   �� *DonGia+  5+      $ Số lượng��6%   	 67   �� *	SoLuong+  5,      $ Thành tiền��6%   	 69   �� *	ThanhTien+5/      �� 50   
   $��7��6   $��0��6"   $��2��62   
 �� Orientation$
 
Horizontal=�6F   $��Center=�6_   .+�51      �� -   5        $��10q�51      .��61   Thêm67   �� 52      -	   5        $��10q�52      .��63   Sửa68   �� 53      -
   5        $��10q�53      .��63   Xóa68   �� 54      -   5        $��10q�54      .��61   Tìm66   5:      5@      5A      