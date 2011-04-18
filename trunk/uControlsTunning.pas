unit uControlsTunning;

interface

uses DBCtrls, Graphics, uGlobais, Dialogs;
 
type
	TDBEdit = class(DBCtrls.TDBEdit)
		private
			{ Private declarations }
			FOldColor : TColor;
		protected
			procedure DoEnter; override;
			procedure DoExit;override;
	end;

type 
	TDBLookupComboBox = class(DBCtrls.TDBLookupComboBox)
		private
			{ Private declarations }
			FOldColor : TColor;
		protected
			procedure DoEnter; override;
			procedure DoExit;override;
	end;

type 
	TDBMemo = class(DBCtrls.TDBMemo)
		private
			{ Private declarations }
			FOldColor : TColor;
		protected
			procedure DoEnter; override;
			procedure DoExit;override;
	end;

implementation

{ TDBEdit }
procedure TDBEdit.DoEnter;
begin
	inherited;
	FOldColor := Color;
	Color     := corFoco;
end;

procedure TDBEdit.DoExit;
begin
	inherited;
	Color := FOldColor;
end;

{ TDBLookupComboBox }

procedure TDBLookupComboBox.DoEnter;
begin
	inherited;
	FOldColor := Color;
	Color     := corFoco;
end;

procedure TDBLookupComboBox.DoExit;
begin
	inherited;
	Color := FOldColor;
end;

{ TDBMemo }

procedure TDBMemo.DoEnter;
begin
  inherited;
	FOldColor := Color;
	Color     := corFoco;
end;

procedure TDBMemo.DoExit;
begin
	inherited;
	Color := FOldColor;
end;

end.
