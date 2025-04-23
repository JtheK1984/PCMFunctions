{******************************************************************************}
{* DCPcrypt v2.1 written by David Barton (crypto@cityinthesky.co.uk) **********}
{******************************************************************************}
{* Block cipher component definitions *****************************************}
{******************************************************************************}
{* Copyright (c) 1999-2002 David Barton                                       *}
{* Permission is hereby granted, free of charge, to any person obtaining a    *}
{* copy of this software and associated documentation files (the "Software"), *}
{* to deal in the Software without restriction, including without limitation  *}
{* the rights to use, copy, modify, merge, publish, distribute, sublicense,   *}
{* and/or sell copies of the Software, and to permit persons to whom the      *}
{* Software is furnished to do so, subject to the following conditions:       *}
{*                                                                            *}
{* The above copyright notice and this permission notice shall be included in *}
{* all copies or substantial portions of the Software.                        *}
{*                                                                            *}
{* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR *}
{* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *}
{* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *}
{* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *}
{* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *}
{* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        *}
{* DEALINGS IN THE SOFTWARE.                                                  *}
{******************************************************************************}
unit DCPblockciphers;



interface
uses
  Classes, Sysutils, DCPcrypt2;

{******************************************************************************}
    { Base type definition for 256 bit block ciphers }
type
  TDCP_blockcipher256= class(TDCP_blockcipher)
  private
    IV, CV: array[0..15] of byte;

//    procedure IncCounter;
  public
    class function GetBlockSize: integer; override;
      { Get the block size of the cipher (in bits) }
    procedure Reset; override;
      { Reset any stored chaining information }
    procedure Burn; override;
      { Clear all stored key information and chaining information }
    procedure SetIV(const Value); override;
      { Sets the IV to Value and performs a reset }
    procedure GetIV(var Value); override;
      { Returns the current chaining information, not the actual IV }
    procedure Init(const Key; Size: longword; InitVector: pointer); override;
      { Do key setup based on the data in Key, size is in bits }
    procedure EncryptCBC(const Indata; var Outdata; Size: longword); override;
      { Encrypt size bytes of data using the CBC method of encryption }
    procedure DecryptCBC(const Indata; var Outdata; Size: longword); override;
      { Decrypt size bytes of data using the CBC method of decryption }
  end;

implementation


{$POINTERMATH ON}

{** TDCP_blockcipher256 ********************************************************}

//procedure TDCP_blockcipher256.IncCounter;
//var
//  i: integer;
//begin
//  Inc(CV[15]);
//  i:= 15;
//  while (i> 0) and (CV[i] = 0) do
//  begin
//    Inc(CV[i-1]);
//    Dec(i);
//  end;
//end;

class function TDCP_blockcipher256.GetBlockSize: integer;
begin
  Result:= 128;
end;

procedure TDCP_blockcipher256.Init(const Key; Size: longword; InitVector: pointer);
begin
  inherited Init(Key,Size,InitVector);
  InitKey(Key,Size);
  if InitVector= nil then
  begin
    FillChar(IV,16,{$IFDEF DCP1COMPAT}$FF{$ELSE}0{$ENDIF});
    EncryptECB(IV,IV);
    Reset;
  end
  else
  begin
    Move(InitVector^,IV,16);
    Reset;
  end;
end;

procedure TDCP_blockcipher256.SetIV(const Value);
begin
  if not fInitialized then
    raise EDCP_blockcipher.Create('Cipher not initialized');
  Move(Value,IV,16);
  Reset;
end;

procedure TDCP_blockcipher256.GetIV(var Value);
begin
  if not fInitialized then
    raise EDCP_blockcipher.Create('Cipher not initialized');
  Move(CV,Value,16);
end;

procedure TDCP_blockcipher256.Reset;
begin
  if not fInitialized then
    raise EDCP_blockcipher.Create('Cipher not initialized')
  else
    Move(IV,CV,16);
end;

procedure TDCP_blockcipher256.Burn;
begin
  FillChar(IV,16,$FF);
  FillChar(CV,16,$FF);
  inherited Burn;
end;

procedure TDCP_blockcipher256.EncryptCBC(const Indata; var Outdata; Size: longword);
var
  i: longword;
  p1, p2: PByte;
begin
  if not fInitialized then
    raise EDCP_blockcipher.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div 16) do
  begin
    Move(p1^,p2^,16);
    XorBlock(p2^,CV,16);
    EncryptECB(p2^,p2^);
    Move(p2^,CV,16);
    {$IFDEF DELPHIXE2_UP} p1:= PByte(p1) + 16; {$ELSE} Inc(p1, 16); {$ENDIF}
    {$IFDEF DELPHIXE2_UP} p2:= PByte(p2) + 16; {$ELSE} Inc(p2, 16); {$ENDIF}
  end;
  if (Size mod 16)<> 0 then
  begin
    EncryptECB(CV,CV);
    Move(p1^,p2^,Size mod 16);
    XorBlock(p2^,CV,Size mod 16);
  end;
end;

procedure TDCP_blockcipher256.DecryptCBC(const Indata; var Outdata; Size: longword);
var
  i: longword;
  p1, p2: PByte;
  Temp: array[0..15] of byte;
begin
  if not fInitialized then
    raise EDCP_blockcipher.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  FillChar(Temp, SizeOf(Temp), 0);
  for i:= 1 to (Size div 16) do
  begin
    Move(p1^,p2^,16);
    Move(p1^,Temp,16);
    DecryptECB(p2^,p2^);
    XorBlock(p2^,CV,16);
    Move(Temp,CV,16);
    {$IFDEF DELPHIXE2_UP} p1:= PByte(p1) + 16; {$ELSE} Inc(p1, 16); {$ENDIF}
    {$IFDEF DELPHIXE2_UP} p2:= PByte(p2) + 16; {$ELSE} Inc(p2, 16); {$ENDIF}
  end;
  if (Size mod 16)<> 0 then
  begin
    EncryptECB(CV,CV);
    Move(p1^,p2^,Size mod 16);
    XorBlock(p2^,CV,Size mod 16);
  end;
end;

end.
