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
using Word = Microsoft.Office.Interop.Word;
using SaveFileDialog = System.Windows.Forms.SaveFileDialog;
using MessageBox = System.Windows.MessageBox;
using System.Diagnostics.Contracts;
using OneMoreBank.Model;

namespace OneMoreBank.View
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        int sum = 1000;
        int srok = 1;
        double rate = 8;
        public AuthorizationWindow(int Sum, int Srok, double Rate)
        {
            InitializeComponent();
            sum = Sum;
            srok = Srok;
            rate = Rate;
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = tbLogin.Text;
            string password = tbPassword.Password;
            Helper helper = new Helper();
            UfimtsevBancEntities2 db = Helper.GetContext();
            if (string.IsNullOrWhiteSpace(login) && string.IsNullOrWhiteSpace(password))
            {
                MessageBox.Show("Введите логин и пароль");
                return; 
            }
            else if (string.IsNullOrWhiteSpace(login))
            {
                MessageBox.Show("Введите логин");
                return;
            }
            else
            {
                if (string.IsNullOrWhiteSpace(password))
                {
                    MessageBox.Show("Введите пароль");
                    return;
                }
                else
                {
                    int IDUser = helper.SearchUsers(login, password);
                    if (IDUser >= 0)
                    {
                        int IDContract = helper.CreateContract(IDUser, sum, srok, rate);
                        var contract = helper.FindContract(IDContract);
                        CreateWord(IDUser, contract.NumberAccount, IDContract);
                    }
                    else
                    {
                        MessageBox.Show("Такого пользователя не существует");
                        tbLogin.Text = "";
                        tbPassword.Password= "";
                        return;
                    }
                }
            }
            CalculateWindow calculateWindow = new CalculateWindow();
            calculateWindow.Show();
            this.Close();

        }

        private void CreateWord(int IdUser, long IDBankAccount, int IdContract)
        {
            Helper helper = new Helper();
            
            User user = helper.FindUser(IdUser);
            Bank_account bankAccount = helper.FindBankAccount(IDBankAccount);
            var contract = helper.FindContract(IdContract);

            string TemplateFileName = @"D:\VSProjects\OneMoreBank\OneMoreBank\View\Resources\Шаблон договора.docx";

            var wordApp = new Word.Application();
            wordApp.Visible = false;

            var wordDocument = wordApp.Documents.Open(TemplateFileName);
            ReplaceWordStub("Номер договора", contract.IDContract.ToString(), wordDocument);
            ReplaceWordStub("_день__", DateTime.Today.ToString("dd"), wordDocument);
            ReplaceWordStub("месяц", DateTime.Today.ToString("MM"), wordDocument);
            ReplaceWordStub("Год", DateTime.Today.ToString("yy"), wordDocument);
            ReplaceWordStub("ФИО вкладчика", user.Surname + " " + user.Name + " " + user.Patronymic, wordDocument);
            ReplaceWordStub("ФИО вкладчика", user.Surname + " " + user.Name + " " + user.Patronymic, wordDocument);
            ReplaceWordStub("Сумма_вклада", contract.Amount.ToString(), wordDocument);
            ReplaceWordStub("Срок_вклада", contract.Period.ToString(), wordDocument);
            ReplaceWordStub("Дата_окончания_срока_вклада", contract.ExpirationDate.ToString("dd/MM/yyyy"), wordDocument);
            ReplaceWordStub("Процентная_ставка_по_вкладу", contract.Percent.ToString(), wordDocument);
            ReplaceWordStub("Номер счета вклада", bankAccount.NumberAccount.ToString(), wordDocument);
            ReplaceWordStub("Адрес_регистрации", user.Adress.ToString(), wordDocument);
            ReplaceWordStub("Адрес_электронной_почты", user.E_Mail.ToString(), wordDocument);
            ReplaceWordStub("Серия1", user.Series.ToString(), wordDocument);
            ReplaceWordStub("Номер1", user.Number.ToString(), wordDocument);
            ReplaceWordStub("Кем_и_когда_выдан", user.Issued.ToString() + " " + user.DateOfIssue.ToString(), wordDocument);
            ReplaceWordStub("Дата_рождения", user.DateOfBirth.ToString("dd/MM/yyyy"), wordDocument);
            ReplaceWordStub("Место_рождения", user.PlaceOfBirth.ToString(), wordDocument);

            SaveFileDialog sfd = new SaveFileDialog();
            if (sfd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                wordDocument.SaveAs(@"C:\Users\PC\Desktop\\Договор.docx");
            }
            wordDocument.Close();
        }
        private void ReplaceWordStub(string stubToReplace, string text, Word.Document wordDocument)
        {
            var range = wordDocument.Content;
            range.Find.ClearFormatting();
            range.Find.Execute(FindText: stubToReplace, ReplaceWith: text);
        }
    }
}
