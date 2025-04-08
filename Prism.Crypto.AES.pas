unit Prism.Crypto.AES;

interface

uses
  SysUtils;

type
  TChainingMode = (cmCBC, cmCFB8bit, cmCFBblock, cmOFB, cmCTR, cmECB);
  TPaddingMode = (pmZeroPadding, pmANSIX923, pmISO10126, pmISO7816, pmPKCS7, pmRandomPadding);

  TAES = class
  private
    class procedure BytePadding(var Data: TBytes; BlockSize: integer; PaddingMode: TPaddingMode);
  public
    class function Encrypt(const Data: TBytes; const Key: TBytes; KeySize: integer; const InitVector: TBytes): TBytes;
    class function Decrypt(const Crypt: TBytes; const Key: TBytes; KeySize: integer; const InitVector: TBytes): TBytes;
  end;

implementation

uses
  DCPrijndael;

class function TAES.Encrypt(const Data: TBytes; const Key: TBytes; KeySize: integer; const InitVector: TBytes): TBytes;
var
  Cipher: TDCP_rijndael;
begin
  Cipher := TDCP_rijndael.Create(nil);
  try
    Cipher.Init(Key[0], KeySize, @InitVector[0]);
    // Copy Data => Crypt
    Result := Copy(Data, 0, Length(Data));
    // Padd Crypt to required length (for Block based algorithms)
    BytePadding(Result, Cipher.BlockSize, pmPKCS7);
    // Encrypt Crypt using the algorithm specified in ChainingMode
    Cipher.EncryptCBC(Result[0], Result[0], Length(Result));
  finally
    Cipher.Free;
  end;
end;

class function TAES.Decrypt(const Crypt: TBytes; const Key: TBytes; KeySize: integer; const InitVector: TBytes): TBytes;
var
  Cipher: TDCP_rijndael;
  I: integer;
begin
  Cipher := TDCP_rijndael.Create(nil);
  try
    Cipher.Init(Key[0], KeySize, @InitVector[0]);
    // Copy Crypt => Data
    Result := Copy(Crypt, 0, Length(Crypt));
    // Decrypt Data using the algorithm specified in ChainingMode
    Cipher.DecryptCBC(Result[0], Result[0], Length(Result));
    // Correct the length of Data, based on the used PaddingMode (only for Block based algorithms)
    SetLength(Result, Length(Result) - Result[Length(Result)-1]);
  finally
    Cipher.Free;
  end;
end;

class procedure TAES.BytePadding(var Data: TBytes; BlockSize: integer; PaddingMode: TPaddingMode);
// Supports: ANSI X.923, ISO 10126, ISO 7816, PKCS7, zero padding and random padding
var
  I, DataBlocks, DataLength, PaddingStart, PaddingCount: integer;
begin
  BlockSize := BlockSize div 8; // convert bits to bytes
  // Zero and Random padding do not use end-markers, so if Length(Data) is a multiple of BlockSize, no padding is needed
  if PaddingMode in [pmZeroPadding, pmRandomPadding] then
    if Length(Data) mod BlockSize = 0 then
      Exit;
  DataBlocks := (Length(Data) div BlockSize) + 1;
  DataLength := DataBlocks * BlockSize;
  PaddingCount := DataLength - Length(Data);
  // ANSIX923, ISO10126 and PKCS7 store the padding length in a 1 byte end-marker, so any padding length > $FF is not supported
  if PaddingMode in [pmANSIX923, pmISO10126, pmPKCS7] then
    if PaddingCount > $FF then
      Exit;
  PaddingStart := Length(Data);
  SetLength(Data, DataLength);
  case PaddingMode of
    pmZeroPadding, pmANSIX923, pmISO7816: // fill with $00 bytes
      FillChar(Data[PaddingStart], PaddingCount, 0);
    pmPKCS7: // fill with PaddingCount bytes
      FillChar(Data[PaddingStart], PaddingCount, PaddingCount);
    pmRandomPadding, pmISO10126: // fill with random bytes
      for I := PaddingStart to DataLength - 1 do
        Data[I] := Random($FF);
  end;
  case PaddingMode of
    pmANSIX923, pmISO10126:
      Data[DataLength - 1] := PaddingCount;
      // set end-marker with number of bytes added
    pmISO7816:
      Data[PaddingStart] := $80; // set fixed end-markder $80
  end;
end;

end.
