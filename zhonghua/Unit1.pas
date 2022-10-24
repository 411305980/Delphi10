Unit Unit1;

Interface

Uses
  System.IOUtils, System.IniFiles, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

Type
  TForm1 = Class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtname: TEdit;
    edtAge: TEdit;
    Label3: TLabel;
    rgsex: TRadioGroup;
    rbMan: TRadioButton;
    rbwoman: TRadioButton;
    grp1: TGroupBox;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    cbbAddress: TComboBox;
    Procedure Button1Click(Sender: TObject);
    Procedure Button2Click(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;

Implementation

{$R *.dfm}

Procedure TForm1.Button1Click(Sender: TObject);
Var
  Inifile: TIniFile;
  Section: String;
Begin
  //Inifile := TIniFile.Create('D:\delphi-demo\delphi1\22-10-20INI文件操作\zhonghua\Win32\Debug\Userconfig.ini');
  Inifile := TIniFile.Create(TDirectory.GetCurrentDirectory() + '/' + 'Userconfig.ini');
  Section := '饶中华亲友团';
  Inifile.WriteString(Section, 'editname', edtname.Text);
  Inifile.WriteString(Section, 'editage', edtAge.Text);
  Inifile.Writebool(Section, 'man/woman', rbMan.Checked);
  Inifile.Writebool(Section, '爱好选择1', CheckBox1.Checked);
  Inifile.Writebool(Section, '爱好选择2', CheckBox2.Checked);
  Inifile.Writebool(Section, '爱好选择3', CheckBox3.Checked);
  Inifile.Writebool(Section, '爱好选择4', CheckBox4.Checked);
  Inifile.Writebool(Section, '爱好选择5', CheckBox5.Checked);
  Inifile.Writebool(Section, '爱好选择6', CheckBox6.Checked);
  Inifile.WriteInteger(Section, 'Address', cbbAddress.ItemIndex);

End;

Procedure TForm1.Button2Click(Sender: TObject);
Var
  Inifile: TIniFile;
Begin
 // Inifile := TIniFile.Create('D:\delphi-demo\delphi1\22-10-20INI文件操作\zhonghua\Win32\Debug\Userconfig.ini');
  Inifile := TIniFile.Create(TDirectory.GetCurrentDirectory() + '/' + 'Userconfig.ini');
  edtname.Text := Inifile.ReadString('饶中华亲友团', 'editname', '');
  edtAge.Text := Inifile.ReadString('饶中华亲友团', 'editage', '');
  rbMan.Checked := Inifile.ReadBool('饶中华亲友团', 'man/woman', false);
  rbwoman.checked := Not rbMan.Checked;
  CheckBox1.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择1', false);
  CheckBox2.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择2', false);
  CheckBox3.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择3', false);
  CheckBox4.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择4', false);
  CheckBox5.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择5', false);
  CheckBox6.Checked := Inifile.ReadBool('饶中华亲友团', '爱好选择6', false);
  cbbAddress.ItemIndex := Inifile.readInteger('饶中华亲友团', 'Address', 0);
 // ShowMessage(TDirectory.GetCurrentDirectory())  --显示消息内容程序根目录
End;

End.

