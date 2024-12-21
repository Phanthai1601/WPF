using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfApp1.Models;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        QlbanHangContext db = new QlbanHangContext();


        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            HienThi();
            var qrCbo  = from lsp in db.LoaiSanPhams
                         select lsp;
            cbo.ItemsSource = qrCbo.ToList();
            cbo.DisplayMemberPath = "TenLoai";
            cbo.SelectedValuePath = "MaLoai";
        }

        private void HienThi()
        {
            var sanphamQuery = from sp in db.SanPhams
                               select new
                               {
                                   sp.MaSp,
                                   sp.TenSp,
                                   sp.MaLoaiNavigation.TenLoai,
                                   sp.DonGia,
                                   sp.SoLuong,
                                   ThanhTien = sp.DonGia * sp.SoLuong,
                               };
            dtg.ItemsSource = sanphamQuery.ToList();
        }

        private void btnAdd(object sender, RoutedEventArgs e)
        {
            SanPham sp = new SanPham();
            sp.MaSp = txtMaSP.Text;
            sp.TenSp = txtTenSp.Text;
            sp.MaLoai = cbo.SelectedValue.ToString();
            sp.DonGia = int.Parse(txtDonGia.Text);
            sp.SoLuong = int.Parse(txtSoLuong.Text);
            db.SanPhams.Add(sp);
            db.SaveChanges();
            HienThi();
            

        }

        private void btnUpdate(object sender, RoutedEventArgs e)
        {
            var qr = from sp in db.SanPhams
                     where sp.MaSp == txtMaSP.Text
                     select sp;
            SanPham sp1 = qr.FirstOrDefault();
                if(sp1 != null)
            {
                sp1.TenSp = txtTenSp.Text;
                sp1.MaLoai  = cbo.SelectedValue.ToString();
                sp1.SoLuong = int.Parse(txtSoLuong.Text);
                sp1.DonGia = int.Parse(txtDonGia.Text) ;

            }
                db.SaveChanges();
            HienThi() ;


        }

        private void btnDelete(object sender, RoutedEventArgs e)
        {
            var qr = from sp in db.SanPhams
                     where sp.MaSp == txtMaSP.Text
                     select sp;
            SanPham xoa  = qr.FirstOrDefault();
            if(xoa != null)
            {
                MessageBoxResult tl = MessageBox.Show("Bạn có muốn xóa sản phẩm này không ?", "Xóa", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if(tl == MessageBoxResult.Yes)
                {
                    db.SanPhams.Remove(xoa);
                    db.SaveChanges() ;
                    HienThi();
                }
            }
            else
            {
                MessageBox.Show("Không có sản phẩm muốn xóa ", "Xóa", MessageBoxButton.OK, MessageBoxImage.Information);
            }

        }

        private void btnFind(object sender, RoutedEventArgs e)
        {
            var find = from sp in db.SanPhams
                       join lsp in db.LoaiSanPhams
                       on sp.MaLoai equals lsp.MaLoai
                       group sp by lsp.TenLoai into nhom
                       select new
                       {
                           TenLoai = nhom.Key,
                           TongSoLuong = nhom.Sum(sp => sp.SoLuong),
                           TongTien = nhom.Sum(sp => sp.DonGia * sp.SoLuong),
                       };
            Window1 wd = new Window1();
            wd.data.ItemsSource = find.ToList();
            wd.ShowDialog();    

        }

        private void dtg_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(dtg.SelectedItem != null)
            {
                var dongChon  = (dynamic)dtg.SelectedItem;
                txtMaSP.Text = dongChon.MaSp;
                txtTenSp.Text = dongChon.TenSp;
                cbo.Text = dongChon.TenLoai;
                txtDonGia.Text = dongChon.DonGia.ToString();
                txtSoLuong.Text = dongChon.SoLuong.ToString();
            }
        }
    }
}