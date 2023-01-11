using System;
using System.Collections.Generic;
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

namespace OneMoreBank.View
{
    /// <summary>
    /// Логика взаимодействия для CalculateWindow.xaml
    /// </summary>
    public partial class CalculateWindow : Window
    {
        public CalculateWindow()
        {
            InitializeComponent();
        }
        private void btnCompare_Click(object sender, RoutedEventArgs e)
        {
            if (tblOptimal.Text == "От 6 месяцев")
            {
                MessageBox.Show("Неверный ввод");
                return;
            }
            
            ContributionWindow contributionWindow = new ContributionWindow(Convert.ToInt32(tbSum.Text.Replace("   Руб.", "")), stable, optimal, standard, Convert.ToInt32(tblStable.Text.Replace("   Руб.", "")), Convert.ToInt32(tblOptimal.Text.Replace("   Руб.", "")), Convert.ToInt32(tblStandart.Text.Replace("   Руб.", "")), Convert.ToInt32(tbSrok.Text.Replace("   Руб.", "")));
            contributionWindow.Show();
            this.Close();

        }

        double stable = 9.85;
        double optimal = 6.1;
        double standard = 6.55;

        private void Сalculate()
        {
            int sum = 600000, srok = 12, add = 0;

            if (tbSum != null && tbSrok != null && tbAdd != null)
            {
                sum = Convert.ToInt32(tbSum.Text);

                srok = Convert.ToInt32(tbSrok.Text);

                add = Convert.ToInt32(tbAdd.Text);
            }


            tblStable.Text = ((int)Math.Round(sum * stable / 100 * srok / 12)).ToString() + "   Руб.";

            if (srok > 5)
            {
                tblOptimal.Text = ((int)Math.Round(sum * Math.Pow(1 + optimal / 100 / 12, srok) - sum + srok * add)).ToString() + "   Руб.";
            }
            else
            {
                tblOptimal.Text = "От 6 месяцев";
            }

            double standartResult = (int)Math.Round(sum * standard / 100);

            for (int i = 0; i < srok; i++)
            {
                standartResult = standartResult + add;
                standartResult = standartResult + Math.Round(standartResult * standard / 100);
            }
            standartResult = (int)standartResult * srok / 24;
            tblStandart.Text = Math.Abs(standartResult).ToString() + "   Руб.";
        }


        private void sl_sum_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {

            tbSum.Text = slSum.Value.ToString();

        }

        private void tb_sum_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                if (tbSum.Text == "")
                {
                    tbSum.Text = "1000";
                    Сalculate();
                    return;
                }

                if (int.TryParse(tbSum.Text, out var number))
                {
                    if (slSum == null)
                    {
                        return;
                    }

                    if (number < 1000 || number > 10000000)
                    {
                        slSum.Value = 1000;
                        tbSum.Text = "1000";
                        Сalculate();
                        MessageBox.Show("Неверный Ввод");
                        return;
                    }

                    slSum.Value = number;
                    Сalculate();
                    return;
                }
                MessageBox.Show("Неверный Ввод");
            }

            catch
            {
                slSum.Value = 1000;
                tbSum.Text = "1000";
                Сalculate();
                MessageBox.Show("Неверный Ввод");
                return;
            }
        }

        private void sl_srok_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            tbSrok.Text = slSrok.Value.ToString();
        }

        private void tb_srok_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                if (tbSrok.Text == "")
                {
                    tbSrok.Text = "1";
                    Сalculate();
                    return;
                }

                if (int.TryParse(tbSrok.Text, out var number))
                {
                    if (slSrok == null)
                    {
                        return;
                    }

                    if (number < 1 || number > 60)
                    {
                        slSrok.Value = 1;
                        tbSrok.Text = "1";
                        Сalculate();
                        MessageBox.Show("Неверный Ввод");
                        return;
                    }

                    slSrok.Value = number;
                    Сalculate();
                    return;
                }
                MessageBox.Show("Неверный Ввод");
            }

            catch
            {
                Сalculate();
                slSrok.Value = 1;
                tbSrok.Text = "1";
                MessageBox.Show("Неверный Ввод");
                return;
            }
        }

        private void sl_popoln_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {

            tbAdd.Text = slAdd.Value.ToString();

        }

        private void tb_popoln_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                if (tbAdd.Text == "")
                {
                    tbAdd.Text = "0";
                    Сalculate();
                    return;
                }

                if (int.TryParse(tbAdd.Text, out var number))
                {
                    if (slAdd == null)
                    {
                        return;
                    }

                    if (number < 0 || number > 5000000)
                    {
                        slAdd.Value = 0;
                        tbAdd.Text = "0";
                        Сalculate();
                        MessageBox.Show("Неверный Ввод");
                        return;
                    }

                    slAdd.Value = number;
                    Сalculate();
                    return;
                }
                MessageBox.Show("Неверный Ввод");
            }

            catch
            {
                Сalculate();
                slAdd.Value = 0;
                tbAdd.Text = "0";
                MessageBox.Show("Неверный Ввод");
                return;
            }


        }

        private void tb_sum_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void tb_srok_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void tb_popoln_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }
    }
}
