import strutils,unicode
import private/sphmacros

{.compile: "vendor/sphlib/c/sha0.c".}
defineSphHash(SHA0, 20, "sha0", "", "", ""):
  type SHA0* = object
    buf: array[64, cuchar]
    val: array[5, uint32]
    count: uint64

{.compile: "vendor/sphlib/c/sha1.c".}
defineSphHash(SHA1, 20, "sha1", "", "", ""):
  type SHA1* = distinct SHA0

{.compile: "vendor/sphlib/c/sha2.c".}
defineSphHash(SHA224, 28, "sha224", "", "", ""):
  type SHA224* = object
    buf: array[64, cuchar]
    val: array[8, uint32]
    count: uint64
    
defineSphHash(SHA256, 32, "sha256", "", "sph_sha224", ""):
  type SHA256* = distinct SHA224
  
{.compile: "vendor/sphlib/c/sha2big.c".}
defineSphHash(SHA384, 48, "sha384", "", "", ""):
  type SHA384* = object
    buf: array[128, cuchar]
    val: array[8, uint64]
    count: uint64
  
defineSphHash(SHA512, 64, "sha512", "", "sph_sha384", ""):
  type SHA512* = distinct SHA384

{.compile: "vendor/sphlib/c/tiger.c".}
defineSphHash(Tiger, 24, "tiger", "", "", ""):
  type Tiger* = object
    buf: array[64, cuchar]
    val: array[3, uint64]
    count: uint64

defineSphHash(Tiger2, 24, "tiger2", "sph_tiger_init", "sph_tiger", ""):  
  type Tiger2* = distinct Tiger

{.compile: "vendor/sphlib/c/md2.c".}  
defineSphHash(MD2, 16, "md2", "", "", ""):
  type MD2* = object
    buf: array[16, cuchar]
    x: array[48, cuchar]
    c: array[16, cuchar]
    l: uint64
    count: uint64  
   
{.compile: "vendor/sphlib/c/md4.c".}    
defineSphHash(MD4, 16, "md4", "", "", ""):
  type MD4* = object
    buf: array[64, cuchar]
    val: array[4, uint32]
    count: uint64
 
{.compile: "vendor/sphlib/c/md5.c".}    
defineSphHash(MD5, 16, "md5", "", "", ""):
  type MD5* = object
    buf: array[64, cuchar]
    val: array[4, uint32]
    count: uint64

{.compile: "vendor/sphlib/c/ripemd.c".}
defineSphHash(RIPEMD, 16, "ripemd", "", "", ""):
  type RIPEMD* = object
    buf: array[64, cuchar]
    val: array[4, uint32]
    count: uint64
    
defineSphHash(RIPEMD128, 16, "ripemd128", "", "", ""):
  type RIPEMD128* = distinct RIPEMD
  
defineSphHash(RIPEMD160, 20, "ripemd160", "", "", ""):
  type RIPEMD160* = object
    buf: array[64, cuchar]
    val: array[5, uint32]
    count: uint64
   
{.compile: "vendor/sphlib/c/whirlpool.c".}
defineSphHash(Whirlpool, 64, "whirlpool", "", "", ""):
  type Whirlpool* = object
    buf: array[64, cuchar]
    state: array[8, uint64]
    count: uint64
    
defineSphHash(Whirlpool0, 64, "whirlpool0", "sph_whirlpool_init", "", ""):
  type Whirlpool0* = distinct Whirlpool
    
defineSphHash(Whirlpool1, 64, "whirlpool1", "sph_whirlpool_init", "", ""):
  type Whirlpool1* = distinct Whirlpool

{.compile: "vendor/sphlib/c/panama.c".}  
defineSphHash(Panama, 32, "panama", "", "", ""):
  type Panama* = object
    data: array[32, cuchar]
    dataPtr: uint64
    buf: array[256, uint32]
    bufPtr: uint64
    state: array[17, uint32]
  
{.compile: "vendor/sphlib/c/radiogatun.c".}
defineSphHash(RadioGatun32, 32, "radiogatun32", "", "", ""):
  type RadioGatun32* = object
    data: array[156, cuchar]
    dataPtr: uint64
    a: array[19, uint32]
    b: array[39, uint32]
  
defineSphHash(RadioGatun64, 32, "radiogatun64", "", "", ""):
  type RadioGatun64* = object
    data: array[312, cuchar]
    dataPtr: uint64
    a: array[19, uint64]
    b: array[39, uint64]

type HAVAL = object
  buf: array[128, cuchar]
  s: array[8, uint32]
  olen: uint64
  passes: uint64
  count: uint64
    
{.compile: "vendor/sphlib/c/haval.c".}    
defineSphHash(HAVAL128_3, 16, "haval128_3", "", "", ""):
  type HAVAL128_3* = distinct HAVAL
    
defineSphHash(HAVAL128_4, 16, "haval128_4", "", "", ""):
  type HAVAL128_4* = distinct HAVAL
    
defineSphHash(HAVAL128_5, 16, "haval128_5", "", "", ""):
  type HAVAL128_5* = distinct HAVAL
    
defineSphHash(HAVAL160_3, 20, "haval160_3", "", "", ""):
  type HAVAL160_3* = distinct HAVAL
    
defineSphHash(HAVAL160_4, 20, "haval160_4", "", "", ""):
  type HAVAL160_4* = distinct HAVAL
    
defineSphHash(HAVAL160_5, 20, "haval160_5", "", "", ""):
  type HAVAL160_5* = distinct HAVAL
    
defineSphHash(HAVAL192_3, 24, "haval192_3", "", "", ""):
  type HAVAL192_3* = distinct HAVAL
    
defineSphHash(HAVAL192_4, 24, "haval192_4", "", "", ""):
  type HAVAL192_4* = distinct HAVAL
    
defineSphHash(HAVAL192_5, 24, "haval192_5", "", "", ""):
  type HAVAL192_5* = distinct HAVAL
    
defineSphHash(HAVAL224_3, 28, "haval224_3", "", "", ""):
  type HAVAL224_3* = distinct HAVAL
    
defineSphHash(HAVAL224_4, 28, "haval224_4", "", "", ""):
  type HAVAL224_4* = distinct HAVAL
    
defineSphHash(HAVAL224_5, 28, "haval224_5", "", "", ""):
  type HAVAL224_5* = distinct HAVAL
    
defineSphHash(HAVAL256_3, 32, "haval256_3", "", "", ""):
  type HAVAL256_3* = distinct HAVAL
    
defineSphHash(HAVAL256_4, 32, "haval256_4", "", "", ""):
  type HAVAL256_4* = distinct HAVAL
    
defineSphHash(HAVAL256_5, 32, "haval256_5", "", "", ""):
  type HAVAL256_5* = distinct HAVAL
    
proc sphInit*[T](): T =
  var ctx: T
  sphInit(ctx)
  result = ctx

proc sphHash*[T](data: string): string =
  var ctx = sphInit[T]()
  sphUpdate(ctx, data)
  result = sphFinalize(ctx)
  
proc sphHmac*(key: string, data: string, hashFn: proc(inp: string): string, blockSize: int = 64): string =
  var k = key
  
  if len(k) > block_size:
    k = hashFn(k)
  while len(k) < block_size:
    k = k & "\x00"
  
  const opad = 0x5c
  const ipad = 0x36
  var o_key_pad = newString(block_size) #seq[uint8] = @[]
  var i_key_pad = newString(block_size)
  
  for i in 0..block_size-1:
    o_key_pad[i] = char(k[i].ord xor opad)
    i_key_pad[i] = char(k[i].ord xor ipad)
    
  let inner = hashFn(i_key_pad & data)
  result = hashFn(o_key_pad & inner)

proc sphHmac*[T](key: string, data: string): string =
  result = sphHmac(key, data) do (inp: string) -> string:
    sphHash[T](inp)

proc hexify*(inp: string): string =
  var outp = newStringOfCap(len(inp) * 2)
  for c in inp:
    let hex = toLower(toHex(ord(c), 2))
    add(outp, hex)
  result = outp
  
when defined(sphtesting):
  import unittest
  
  var ctx = sphInit[SHA256]()
  sphUpdate(ctx, "hello world")
  let outp = sphFinalize(ctx)
  check(hexify(outp) == "b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9")
  
  let body = "hello world"
  let key = "key"

  template hh(typ: typed): string =
    hexify(sphHash[typ](body))
  
  check:
    hh(SHA0)         == "9fce82c34887c1953b40b3a2883e18850c4fa8a6"
    hh(SHA1)         == "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed"
    hh(SHA224)       == "2f05477fc24bb4faefd86517156dafdecec45b8ad3cf2522a563582b"
    hh(SHA384)       == "fdbd8e75a67f29f701a4e040385e2e23986303ea10239211af907fcbb83578b3e417cb71ce646efd0819dd8c088de1bd"
    hh(SHA512)       == "309ecc489c12d6eb4cc40f50c902f2b4d0ed77ee511a7c7a9bcd3ca86d4cd86f989dd35bc5ff499670da34255b45b0cfd830e81f605dcf7dc5542e93ae9cd76f"
    hh(Tiger)        == "4c8fbddae0b6f25832af45e7c62811bb64ec3e43691e9cc3"
    hh(Tiger2)       == "d88ca069f106339a428590493258da26fbddb833157bb5f3"
    hh(MD2)          == "d9cce882ee690a5c1ce70beff3a78c77"
    hh(MD4)          == "aa010fbc1d14c795d86ef98c95479d17"
    hh(MD5)          == "5eb63bbbe01eeed093cb22bb8f5acdc3"
    hh(RIPEMD)       == "7e6abe209b85f61c8e955fe0c895e97f"
    hh(RIPEMD128)    == "c52ac4d06245286b33953957be6c6f81"
    hh(RIPEMD160)    == "98c615784ccb5fe5936fbc0cbe9dfdb408d92f0f"
    hh(Whirlpool)    == "8d8309ca6af848095bcabaf9a53b1b6ce7f594c1434fd6e5177e7e5c20e76cd30936d8606e7f36acbef8978fea008e6400a975d51abe6ba4923178c7cf90c802"
    hh(Whirlpool0)   == "8ab3f6e169c9d0d6176be38005099f5ad534a2c2986c084af6aa841d8535dbcf99d3186f30b853c6a90b95f47e2aa551de8df7360253280ce097fe4e0897677a"
    hh(Whirlpool1)   == "6acb0f8614091b16187853927167576de1e3bae9b1302d607197f4e026ff4498d91296a398350faae2a612b6069d38af6cc5fcf73fd006adbeddf4cb5b84f904"
    hh(Panama)       == "4bc764c738ae9a4d276628d9ef0deab9f0970f3d6dd608b2ff8c4dcacaca67b7"
    hh(RadioGatun32) == "c6a4f853829938b0e654f60103e915d1b46de8ea20d758533fd4f806d8072a8c"
    hh(RadioGatun64) == "059370cf874ab7183fe94b842759ef141df113c7760ca9983719801a0fb0876b"
    hh(HAVAL128_3)   == "906c1df7cbe6d318f36ab172f95e89c0"
    hh(HAVAL128_4)   == "c97d46956b8e3e60acd2bb090c482c5e"
    hh(HAVAL128_5)   == "8332ad9f32e385d9acd421b63ee04cfc"
    hh(HAVAL160_3)   == "6e733b21876e47c2168a122e23d86bdd69e50f95"
    hh(HAVAL160_4)   == "2cb8b12eb5a2561022010c2a2af8795e602fdef2"
    hh(HAVAL160_5)   == "d33cf9052d55da9b0f506cb8849097939363e361"
    hh(HAVAL192_3)   == "ec67a6a417953fdbf3496502004b6c21b270d5890dedd931"
    hh(HAVAL192_4)   == "39a281e4e492533b6dfea0af294149ccac771ab87204c9ec"
    hh(HAVAL192_5)   == "67c3492878c8fc4819c8589231fcfe69b15b015c1ca48ac5"
    hh(HAVAL224_3)   == "766879d9ba1dc9e24a6040908a7ae813a47b08af5c5f3beebcacda48"
    hh(HAVAL224_4)   == "3d64d34aea48f5e649ed6147da5d29d31c762a937e9e21f4da1f3106"
    hh(HAVAL224_5)   == "6bedeb6a8676e46413c020c8813c022486ca93353b8a0673fb577ba1"
    hh(HAVAL256_3)   == "45492c6c8adab277759f4381420799431a037daf6d829b8b5c21104c10f61a92"
    hh(HAVAL256_4)   == "0359a526d77e271707c44d9b270e68a394f8486a459f0137ad5e1d02e44c5889"
    hh(HAVAL256_5)   == "f5f6ffcfe39a65ac2c3989430340420341762a6624ebd69b9d08ec1dc4b9f167"

    hexify(sphHmac[SHA256](key, body)) == "0ba06f1f9a6300461e43454535dc3c4223e47b1d357073d7536eae90ec095be1"
    hexify(sphHmac[MD5](key, body)) == "ae92cf51adf91130130aefc2b39a7595"

    
