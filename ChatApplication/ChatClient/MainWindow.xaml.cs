using System;
using System.Collections.Generic;
using System.Linq;
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
using System.Data.Entity;
using System.Windows.Media.Animation;
using PasswordHash;
using System.Diagnostics;

namespace ChatClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private bool _introd = false;

        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void IntroductionCompleted(object sender, EventArgs e)
        {
            //if (!_introd)
            //{
                _introd = true;
                var next = this.FindResource("MainLoginAppear");
                var nextSB = (Storyboard)next;
                nextSB.Begin();
            //}
        }

        /*public class SpaceOrEnterKeyDownEventTrigger : EventTrigger
        {
            public SpaceOrEnterKeyDownEventTrigger()
                : base("KeyDown")
            {

            }
            protected override void OnEvent(EventArgs eventArgs)
            {
                var e = eventArgs as KeyEventArgs;
                if (e != null && e.Key == Key.Space || e.Key == Key.Enter)
                    this.InvokeActions(eventArgs);
            }
        }*/

        //private activity flag counter for scrolling error animations
        private int _errorActiveFlag = -1;
        int activeErrorFlag
        {
            get { return _errorActiveFlag; }
            set
            {
                _errorActiveFlag = value;
                if (_errorActiveFlag == 1)
                {
                    openErrorMarquee();
                }
                else if (_errorActiveFlag == 0)
                {
                    closeErrorMarquee();
                }
            }
        }

        private void logIn(object sender, RoutedEventArgs e)
        {
            string nameRecord = "";
            string passRecord = "";

            if (UsernameField.Text == "" || UserPassField.Password == "")
            {
                if (activeErrorFlag == -1)
                {
                    activeErrorFlag = 1;
                    Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                    errorMarqueeScroll("Username and password required");
                }
                else
                {
                    activeErrorFlag++;
                    Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                    errorMarqueeScroll("Username and password required");
                }
            }
            else
            {
                var userNullCheck = new user();
                using (otongadgethubEntities logCheck = new otongadgethubEntities())
                {
                    userNullCheck = logCheck.users.FirstOrDefault(a => a.username == UsernameField.Text);
                    
                }

                if (userNullCheck == null)
                {
                    if (activeErrorFlag == -1)
                    {
                        activeErrorFlag = 1;
                        Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                        errorMarqueeScroll("Username does not exist");
                    }
                    else
                    {
                        activeErrorFlag++;
                        Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                        errorMarqueeScroll("Username does not exist");
                    }
                }

                if (userNullCheck != null)
                {
                    nameRecord = userNullCheck.username;
                }

                if (nameRecord == UsernameField.Text)
                {
                    passRecord = Encrypt.MD5(UserPassField.Password).ToLower();
                    if (passRecord == userNullCheck.password)
                    {
                        //var chatClientWPFWindowSet = Application.Current.Windows.Cast<Window>().FirstOrDefault(window => window is ChatWPFClient) as ChatWPFClient;

                        //var set = Application.Current.Windows.OfType<ChatWPFClient>().FirstOrDefault(window => window is ChatWPFClient) as ChatWPFClient;

                        WPFUserSession.sessionUser = userNullCheck;

                        UserMenu menu = new UserMenu();
                        menu.Show();
                        this.Close();
                    }
                    else
                    {
                        if (activeErrorFlag == -1)
                        {
                            activeErrorFlag = 1;
                            Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                            errorMarqueeScroll("Password invalid");
                        }
                        else
                        {
                            activeErrorFlag++;
                            Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
                            errorMarqueeScroll("Password invalid");
                        }
                    }
                }
            }
        }

        private void openErrorMarquee()
        {
            errorMarquee.Visibility = System.Windows.Visibility.Visible;

            DoubleAnimation openMarquee = new DoubleAnimation();
            openMarquee.From = 0;
            openMarquee.To = 17;
            openMarquee.Duration = new Duration(TimeSpan.FromSeconds(1.0));
            //openMarquee.Completed += (s, doneEvent) => errorMarqueeScroll();
            errorMarquee.BeginAnimation(Rectangle.HeightProperty, openMarquee, HandoffBehavior.Compose);
        }

        private void errorMarqueeScroll(string errorMessage)
        {
            //activeErrorFlag++;
            errorText.Text = errorMessage;
            errorText.Visibility = System.Windows.Visibility.Visible;

            double height = errorCanvas.ActualHeight - errorText.ActualHeight;
            errorText.Margin = new Thickness(0, height / 2, 0, 0);
            DoubleAnimation doubleErrorAnimation = new DoubleAnimation();
            doubleErrorAnimation.From = -errorText.ActualWidth;
            doubleErrorAnimation.To = errorCanvas.ActualWidth;
            
            //doubleErrorAnimation.RepeatBehavior = RepeatBehavior.Forever;
            doubleErrorAnimation.Completed += (s, doneEvent) =>
            {
                activeErrorFlag--;
                Debug.WriteLine("Animations ongoing: " + activeErrorFlag);
            };
            doubleErrorAnimation.Duration = new Duration(TimeSpan.FromSeconds(7.0));
            errorText.BeginAnimation(Canvas.RightProperty, doubleErrorAnimation, HandoffBehavior.Compose);
        }

        private void closeErrorMarquee()
        {
            DoubleAnimation closeMarquee = new DoubleAnimation();
            closeMarquee.From = 17;
            closeMarquee.To = 0;
            closeMarquee.Duration = new Duration(TimeSpan.FromSeconds(1.0));
            closeMarquee.Completed += (s, doneEvent) => {
                if (activeErrorFlag == 0)
                {
                    errorMarquee.Visibility = System.Windows.Visibility.Hidden;
                    errorText.Visibility = System.Windows.Visibility.Hidden;
                    activeErrorFlag--;
                }
            };
            errorMarquee.BeginAnimation(Rectangle.HeightProperty, closeMarquee, HandoffBehavior.Compose);
        }

        //code for checking clicks

        Stopwatch w = new Stopwatch();
        long milliseconds_prev = 0;
        long millseconds_difference = 0;

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (_checkFastClicks())
            {
                Debug.WriteLine("Fast click, difference: " + millseconds_difference + " ms");
            }
            else
                Debug.WriteLine("Slow click, difference: " + millseconds_difference + " ms");
        }

        bool _checkFastClicks()
        {
            bool result = false;

            if (!w.IsRunning)
            {
                w.Start();
            }
            if (w.IsRunning)
            {
                millseconds_difference = w.ElapsedMilliseconds - milliseconds_prev;
                if (w.ElapsedMilliseconds - milliseconds_prev < 8000)//imp
                {
                    if (w.ElapsedMilliseconds > 0)
                    {
                        milliseconds_prev = w.ElapsedMilliseconds;
                        result = true;
                    }
                    else
                        result = false;
                }
                else
                {
                    milliseconds_prev = 0;
                    w.Reset();
                    w.Stop();
                    result = false;
                }
            }

            return result;
        }

        private void IntroductionSkip(object sender, KeyEventArgs e)
        {
            if (_introd == false)
            {
                var prev = this.FindResource("logolayer2excompsoundfad_mp4");
                var prevSB = (Storyboard)prev;
                prevSB.SkipToFill();
                _introd = true;
                IntroductionCompleted(sender, e);
            }
        }
    }
}
