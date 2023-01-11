using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;


namespace OneMoreBank.View
{
    /// <summary>
    /// Логика взаимодействия для ContributionWindow.xaml
    /// </summary>
    public partial class ContributionWindow : Window
    {
        int amount;
        int period;
        double stable;
        double optimal;
        double standart;
        public ContributionWindow(int Sum, double Stable, double Optimal, double Standart, int StableIncome, int OptimalIncome, int StandartIncome, int srok)
        {
            InitializeComponent();
            amount = Sum;
            period = srok;

            tblStableIncome.Text = StableIncome.ToString() + " руб.";
            tblOptimalIncome.Text = OptimalIncome.ToString() + " руб.";
            tblStandartIncome.Text = StandartIncome.ToString() + " руб.";
            tblStableSum.Text = (Sum + StableIncome).ToString() + " руб.";
            tblOptimalSum.Text = (Sum + OptimalIncome).ToString() + " руб.";
            tblStandartSum.Text = (Sum + StandartIncome).ToString() + " руб.";

            stable = Stable;
            optimal = Optimal;
            standart = Standart;

            tbl_stab_stav.Text = stable.ToString() + " %";
            tbl_opt_stavka.Text = optimal.ToString() + " %";
            tbl_standart_stavka.Text = standart.ToString() + " %";
        }

        private void contribution1_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow form = new AuthorizationWindow(amount, period, stable);
            form.Show();
            this.Close();
        }

        private void contribution2_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow form = new AuthorizationWindow(amount, period, optimal);
            form.Show();
            this.Close();
        }
        private void contribution3_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow form = new AuthorizationWindow(amount, period, standart);
            form.Show();
            this.Close();
        }

        private void btnExtract_Click(object sender, RoutedEventArgs e)
        {
            UIElement element = gb_screen as UIElement;
            Uri path = new Uri(@"C:\Users\PC\Desktop\screenshot.png");
            CaptureScreen(element, path);
        }

        public void CaptureScreen(UIElement source, Uri destination)
        {
            try
            {
                double Height, Width;

                Height = source.RenderSize.Height;
                Width = source.RenderSize.Width;

                RenderTargetBitmap renderTarget = new RenderTargetBitmap((int)Width, (int)Height, 96, 96, PixelFormats.Pbgra32);
                VisualBrush visualBrush = new VisualBrush(source);
                DrawingVisual drawingVisual = new DrawingVisual();
                using (DrawingContext drawingContext = drawingVisual.RenderOpen())
                {
                    drawingContext.DrawRectangle(visualBrush, null, new Rect(new Point(0, 0), new Point(Width, Height)));
                }
                renderTarget.Render(drawingVisual);
                PngBitmapEncoder encoder = new PngBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(renderTarget));
                using (FileStream stream = new FileStream(destination.LocalPath, FileMode.Create, FileAccess.Write))
                {
                    encoder.Save(stream);
                }
                //Create a new PDF document
                PdfDocument doc = new PdfDocument();
                //Add a page to the document
                PdfPage page = doc.Pages.Add();
                //Create PDF ghaphics for the page
                PdfGraphics graphics = page.Graphics;
                //Load the image from the disk
                PdfBitmap image = new PdfBitmap(@"C:\Users\PC\Desktop\screenshot.png");
                //Draw the image
                graphics.DrawImage(image, 0, 0);
                ////Save the document
                doc.Save(@"C:\Users\PC\Desktop\Выписка.pdf");
                //Close the document
                doc.Close(true);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
    }
    }
