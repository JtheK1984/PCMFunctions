{ ****************************************************************************** }
{ * DCPcrypt v2.1 written by David Barton (crypto@cityinthesky.co.uk) ********** }
{ * MODIFICATIONS BY WARREN POSTMA FOR VERSION 2.1 : XE, XE2+ support          * }
{ * Also, Unicode support fixes, and removal of "overloading".                 *)
  {*                                                                            * }
{ ****************************************************************************** }
{ * Main component definitions ************************************************* }
{ ****************************************************************************** }
{ * Copyright (c) 1999-2003 David Barton                                       * }
{ * Permission is hereby granted, free of charge, to any person obtaining a    * }
{ * copy of this software and associated documentation files (the "Software"), * }
{ * to deal in the Software without restriction, including without limitation  * }
{ * the rights to use, copy, modify, merge, publish, distribute, sublicense,   * }
{ * and/or sell copies of the Software, and to permit persons to whom the      * }
{ * Software is furnished to do so, subject to the following conditions:       * }
{ *                                                                            * }
{ * The above copyright notice and this permission notice shall be included in * }
{ * all copies or substantial portions of the Software.                        * }
{ *                                                                            * }
{ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * }
{ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   * }
{ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    * }
{ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * }
{ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    * }
{ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        * }
{ * DEALINGS IN THE SOFTWARE.                                                  * }
{ ****************************************************************************** }
unit DCPcrypt2;

interface

uses  Classes,
      Types,
      System.NetEncoding,
      Sysutils;

{ ************************************ }
{ A few predefined types to help out }
{ ************************************ }

type
   Pbyte = ^byte;
   Pword = ^word;
   Pdword = ^dword;
   Pint64 = ^int64;
   dword = longword;
   Pwordarray = ^Twordarray;
   Twordarray = array [0 .. 19383] of word;
   Pdwordarray = ^Tdwordarray;
   Tdwordarray = array [0 .. 8191] of dword;

type

   PointerToInt = Pbyte;

   { ****************************************************************************** }
   { The base class from which all encryption components will be derived. }
   { Stream ciphers will be derived directly from this class where as }
   { Block ciphers will have a further foundation class TDCP_blockcipher. }

type
   EDCP_cipher = class(Exception);

   TDCP_cipher = class(TComponent)
   protected
      fInitialized: boolean; { Whether or not the key setup has been done yet }
      procedure DeadInt(Value: integer);
      { Knudge to display vars in the object inspector }
      procedure DeadStr(Value: string);
      { Knudge to display vars in the object inspector }
   private
      function _GetId: integer;
      function _GetAlgorithm: string;
      function _GetMaxKeySize: integer;
   public
      property Initialized: boolean read fInitialized;

      class function GetId: integer; virtual;
      { Get the algorithm id }
      class function GetAlgorithm: string; virtual;
      { Get the algorithm name }
      class function GetMaxKeySize: integer; virtual;
      { Get the maximum key size (in bits) }
      class function SelfTest: boolean; virtual;
      { Tests the implementation with several test vectors }
      procedure Init(const Key; Size: longword; InitVector: pointer); virtual;
      { Do key setup based on the data in Key, size is in bits }
      procedure Burn; virtual;
      { Clear all stored key information }
      procedure Reset; virtual;
      { Reset any stored chaining information }
      procedure Encrypt(const Indata; var Outdata; Size: longword); virtual;
      { Encrypt size bytes of data and place in Outdata }
      procedure Decrypt(const Indata; var Outdata; Size: longword); virtual;
      { Decrypt size bytes of data and place in Outdata }
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
   published
      property Id: integer read _GetId write DeadInt;
      property Algorithm: string read _GetAlgorithm write DeadStr;
      property MaxKeySize: integer read _GetMaxKeySize write DeadInt;
   end;
   TDCP_cipherclass = class of TDCP_cipher;

   { ****************************************************************************** }
   { The base class from which all block ciphers are to be derived, this }
   { extra class takes care of the different block encryption modes. }

type
   TDCP_ciphermode = (cmCBC, cmCFB8bit, cmCFBblock, cmOFB, cmCTR);

   EDCP_blockcipher = class(EDCP_cipher);

   TDCP_blockcipher = class(TDCP_cipher)
   protected
      fCipherMode: TDCP_ciphermode; { The cipher mode the encrypt method uses }
      procedure InitKey(const Key; Size: longword); virtual;
   private
      function _GetBlockSize: integer;
   public
      class function GetBlockSize: integer; virtual;
      { Get the block size of the cipher (in bits) }
      procedure SetIV(const Value); virtual;
      { Sets the IV to Value and performs a reset }
      procedure GetIV(var Value); virtual;
      { Returns the current chaining information, not the actual IV }
      procedure Encrypt(const Indata; var Outdata; Size: longword); override;
      { Encrypt size bytes of data and place in Outdata using CipherMode }
      procedure Decrypt(const Indata; var Outdata; Size: longword); override;
      { Decrypt size bytes of data and place in Outdata using CipherMode }
      procedure EncryptECB(const Indata; var Outdata); virtual;
      { Encrypt a block of data using the ECB method of encryption }
      procedure DecryptECB(const Indata; var Outdata); virtual;
      { Decrypt a block of data using the ECB method of decryption }
      procedure EncryptCBC(const Indata; var Outdata; Size: longword); virtual;
      { Encrypt size bytes of data using the CBC method of encryption }
      procedure DecryptCBC(const Indata; var Outdata; Size: longword); virtual;
      { Decrypt size bytes of data using the CBC method of decryption }
      constructor Create(AOwner: TComponent); override;
   published
      property BlockSize: integer read _GetBlockSize write DeadInt;
      property CipherMode: TDCP_ciphermode read fCipherMode write fCipherMode
        default cmCBC;
   end;
   TDCP_blockcipherclass = class of TDCP_blockcipher;

procedure XorBlock(var InData1, InData2; Size: longword);

implementation

{$IFDEF MSWINDOWS}
uses Windows;
{$ENDIF}


{ ** TDCP_cipher *************************************************************** }
procedure TDCP_cipher.DeadInt(Value: integer);
begin
end;

procedure TDCP_cipher.DeadStr(Value: string);
begin
end;

function TDCP_cipher._GetId: integer;
begin
   Result := GetId;
end;

function TDCP_cipher._GetAlgorithm: string;
begin
   Result := GetAlgorithm;
end;

function TDCP_cipher._GetMaxKeySize: integer;
begin
   Result := GetMaxKeySize;
end;

class function TDCP_cipher.GetId: integer;
begin
   Result := -1;
end;

class function TDCP_cipher.GetAlgorithm: string;
begin
   Result := '';
end;

class function TDCP_cipher.GetMaxKeySize: integer;
begin
   Result := -1;
end;

class function TDCP_cipher.SelfTest: boolean;
begin
   Result := false;
end;

procedure TDCP_cipher.Init(const Key; Size: longword; InitVector: pointer);
begin
   if fInitialized then
      Burn;
   if (Size <= 0) or ((Size and 3) <> 0) or (Size > longword(GetMaxKeySize))
   then
      raise EDCP_cipher.Create('Invalid key size')
   else
      fInitialized := true;
end;

procedure TDCP_cipher.Burn;
begin
   fInitialized := false;
end;

procedure TDCP_cipher.Reset;
begin
end;

procedure TDCP_cipher.Encrypt(const Indata; var Outdata; Size: longword);
begin
end;

procedure TDCP_cipher.Decrypt(const Indata; var Outdata; Size: longword);
begin
end;

constructor TDCP_cipher.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   Burn;
end;

destructor TDCP_cipher.Destroy;
begin
   if fInitialized then
      Burn;
   inherited Destroy;
end;

{ ** TDCP_blockcipher ********************************************************** }
procedure TDCP_blockcipher.InitKey(const Key; Size: longword);
begin
end;

function TDCP_blockcipher._GetBlockSize: integer;
begin
   Result := GetBlockSize;
end;

class function TDCP_blockcipher.GetBlockSize: integer;
begin
   Result := -1;
end;

procedure TDCP_blockcipher.SetIV(const Value);
begin
end;

procedure TDCP_blockcipher.GetIV(var Value);
begin
end;

procedure TDCP_blockcipher.Encrypt(const Indata; var Outdata; Size: longword);
begin
  EncryptCBC(Indata, Outdata, Size);
end;

procedure TDCP_blockcipher.Decrypt(const Indata; var Outdata; Size: longword);
begin
  DecryptCBC(Indata, Outdata, Size);
end;

procedure TDCP_blockcipher.EncryptECB(const Indata; var Outdata);
begin
end;

procedure TDCP_blockcipher.DecryptECB(const Indata; var Outdata);
begin
end;

procedure TDCP_blockcipher.EncryptCBC(const Indata; var Outdata; Size: longword);
begin
end;

procedure TDCP_blockcipher.DecryptCBC(const Indata; var Outdata; Size: longword);
begin
end;

constructor TDCP_blockcipher.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   fCipherMode := cmCBC;
end;

{ ** Helper functions ********************************************************* }
procedure XorBlock(var InData1, InData2; Size: longword);
var
   b1: PByteArray;
   b2: PByteArray;
   i: longword;
begin
   b1 := @InData1;
   b2 := @InData2;
   for i := 0 to Size - 1 do
      b1[i] := b1[i] xor b2[i];
end;

end.
