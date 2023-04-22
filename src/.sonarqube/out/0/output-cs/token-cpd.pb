Ú
jC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Bootstrappers\Bootstrapper.cs
	namespace 	
Catalog
 
. 
API 
. 
Bootstrappers #
{ 
public		 

static		 
class		 
Bootstrapper		 $
{

 
public 
static 
void  
RegisterDependencies /
(/ 0
this0 4
IServiceCollection5 G
servicesH P
)P Q
{ 	
RegisterClients 
( 
services $
)$ %
;% &
RegisterServices 
( 
services %
)% &
;& '
} 	
private 
static 
void 
RegisterClients +
(+ ,
IServiceCollection, >
services? G
)G H
{ 	
services 
. 
	AddScoped 
< 
IMongoClient +
,+ ,
MongoClient- 8
>8 9
(9 :
(: ;
x; <
)< =
=>> @
{ 
IOptions 
<  
MongoDbConfiguration -
>- .
mongoDb/ 6
=7 8
x9 :
.: ;
GetRequiredService; M
<M N
IOptionsN V
<V W 
MongoDbConfigurationW k
>k l
>l m
(m n
)n o
;o p
return 
new 
MongoClient &
(& '
mongoDb' .
.. /
Value/ 4
.4 5
ConnectionString5 E
)E F
;F G
} 
) 
; 
} 	
private 
static 
void 
RegisterServices ,
(, -
IServiceCollection- ?
services@ H
)H I
{ 	
services 
. 
	AddScoped 
< 
IContext '
,' (
Context) 0
>0 1
(1 2
)2 3
;3 4
services 
. 
	AddScoped 
< #
IProductQueryRepository 6
,6 7"
ProductQueryRepository8 N
>N O
(O P
)P Q
;Q R
services 
. 
	AddScoped 
< %
IProductCommandRepository 8
,8 9$
ProductCommandRepository: R
>R S
(S T
)T U
;U V
} 	
}   
}!! œ
rC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Configuration\MongoDbConfiguration.cs
	namespace 	
Catalog
 
. 
API 
. 
Configuration #
{ 
public 

class  
MongoDbConfiguration %
{ 
public 
const 
string 
MongoDb #
=$ %
$str& /
;/ 0
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
string		 
CollectionName		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
}

 
} ‘+
zC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Controllers\Queries\CatalogQueryController.cs
	namespace 	
Catalog
 
. 
API 
. 
Controllers !
.! "
Queries" )
{ 
[ 
ApiController 
] 
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
[

 
Route

 

(


 
$str

 .
)

. /
]

/ 0
public 

class "
CatalogQueryController '
:( )
ControllerBase* 8
{ 
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	 
ProducesResponseType	 
( 
typeof $
($ %
List% )
<) *
Product* 1
>1 2
)2 3
,3 4
(5 6
int6 9
)9 :
HttpStatusCode: H
.H I
OKI K
)K L
]L M
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
Product, 3
>3 4
>4 5
>5 6
GetAllAsync7 B
(B C
[C D
FromServicesD P
]P Q#
IProductQueryRepositoryR i#
productQueryRepository	j Ä
,
Ä Å
CancellationToken
Ç ì
cancellationToken
î •
)
• ¶
{ 	
return 
Ok 
( 
await "
productQueryRepository 2
.2 3
GetAllAsync3 >
(> ?
cancellationToken? P
)P Q
)Q R
;R S
} 	
[!! 	
HttpGet!!	 
(!! 
$str!! 
)!!  
]!!  !
["" 	 
ProducesResponseType""	 
("" 
typeof"" $
(""$ %
Product""% ,
)"", -
,""- .
(""/ 0
int""0 3
)""3 4
HttpStatusCode""4 B
.""B C
OK""C E
)""E F
]""F G
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
Product##' .
>##. /
>##/ 0
GetByIdAsync##1 =
(##= >
[##> ?
	FromRoute##? H
]##H I
Guid##J N
id##O Q
,##Q R
[##S T
FromServices##T `
]##` a#
IProductQueryRepository##b y#
productQueryRepository	##z ê
,
##ê ë
CancellationToken
##í £
cancellationToken
##§ µ
)
##µ ∂
{$$ 	
return%% 
Ok%% 
(%% 
await%% "
productQueryRepository%% 2
.%%2 3
GetByIdAsync%%3 ?
(%%? @
id%%@ B
,%%B C
cancellationToken%%D U
)%%U V
)%%V W
;%%W X
}&& 	
[// 	
HttpGet//	 
(// 
$str// &
)//& '
]//' (
[00 	 
ProducesResponseType00	 
(00 
typeof00 $
(00$ %
Product00% ,
)00, -
,00- .
(00/ 0
int000 3
)003 4
HttpStatusCode004 B
.00B C
OK00C E
)00E F
]00F G
public11 
async11 
Task11 
<11 
ActionResult11 &
<11& '
Product11' .
>11. /
>11/ 0
GetByNameAsync111 ?
(11? @
[11@ A
	FromRoute11A J
]11J K
string11L R
name11S W
,11W X
[11Y Z
FromServices11Z f
]11f g#
IProductQueryRepository11h $
productQueryRepository
11Ä ñ
,
11ñ ó
CancellationToken
11ò ©
cancellationToken
11™ ª
)
11ª º
{22 	
return33 
Ok33 
(33 
await33 "
productQueryRepository33 2
.332 3
GetByNameAsync333 A
(33A B
name33B F
,33F G
cancellationToken33H Y
)33Y Z
)33Z [
;33[ \
}44 	
[== 	
HttpGet==	 
(== 
$str== .
)==. /
]==/ 0
[>> 	 
ProducesResponseType>>	 
(>> 
typeof>> $
(>>$ %
Product>>% ,
)>>, -
,>>- .
(>>/ 0
int>>0 3
)>>3 4
HttpStatusCode>>4 B
.>>B C
OK>>C E
)>>E F
]>>F G
public?? 
async?? 
Task?? 
<?? 
ActionResult?? &
<??& '
Product??' .
>??. /
>??/ 0
GetByCategoryAsync??1 C
(??C D
[??D E
	FromRoute??E N
]??N O
string??P V
category??W _
,??_ `
[??a b
FromServices??b n
]??n o$
IProductQueryRepository	??p á$
productQueryRepository
??à û
,
??û ü
CancellationToken
??† ±
cancellationToken
??≤ √
)
??√ ƒ
{@@ 	
returnAA 
OkAA 
(AA 
awaitAA "
productQueryRepositoryAA 2
.AA2 3
GetByCategoryAsyncAA3 E
(AAE F
categoryAAF N
,AAN O
cancellationTokenAAP a
)AAa b
)AAb c
;AAc d
}BB 	
}CC 
}DD Î

\C:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Data\Context.cs
	namespace 	
Catalog
 
. 
API 
. 
Data 
{ 
public 

class 
Context 
: 
IContext #
{		 
public

 
IMongoCollection

 
<

  
Product

  '
>

' (
Products

) 1
{

2 3
get

4 7
;

7 8
}

9 :
public 
Context 
( 
IMongoClient #
client$ *
,* +
IOptions, 4
<4 5 
MongoDbConfiguration5 I
>I J
configurationK X
)X Y
{ 	
IMongoDatabase 
database #
=$ %
client& ,
., -
GetDatabase- 8
(8 9
configuration9 F
.F G
ValueG L
.L M
DatabaseNameM Y
)Y Z
;Z [
Products 
= 
database 
.  
GetCollection  -
<- .
Product. 5
>5 6
(6 7
configuration7 D
.D E
ValueE J
.J K
CollectionNameK Y
)Y Z
;Z [
} 	
} 
} Ë
]C:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Data\IContext.cs
	namespace 	
Catalog
 
. 
API 
. 
Data 
{ 
public 

	interface 
IContext 
{ 
IMongoCollection 
< 
Product  
>  !
Products" *
{+ ,
get- 0
;0 1
}2 3
}		 
}

 ˛

`C:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Entities\Product.cs
	namespace 	
Catalog
 
. 
API 
. 
Entities 
{ 
public 

class 
Product 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
string

 
	ImageFile

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ê
rC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Exceptions\EntityNotFoundException.cs
	namespace 	
Catalog
 
. 
API 
. 

Exceptions  
{ 
[ 
Serializable 
] 
public 

class #
EntityNotFoundException (
:) *
	Exception+ 4
{ 
public #
EntityNotFoundException &
(& '
string' -
message. 5
)5 6
:7 8
base9 =
(= >
message> E
)E F
{		 	
}

 	
public #
EntityNotFoundException &
(& '
Type' +
type, 0
,0 1
object2 8
id9 ;
); <
:= >
this? C
(C D
$"D F
{F G
typeG K
.K L
NameL P
}P Q
$strQ Z
{Z [
id[ ]
}] ^
$str^ h
"h i
)i j
{ 	
} 	
	protected #
EntityNotFoundException )
() *
SerializationInfo* ;
info< @
,@ A
StreamingContextB R
contextS Z
)Z [
:\ ]
base^ b
(b c
infoc g
,g h
contexti p
)p q
{ 	
} 	
} 
} ∑
rC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Extensions\ConfigurationExtensions.cs
	namespace 	
Catalog
 
. 
API 
. 

Extensions  
{ 
public 

static 
class #
ConfigurationExtensions /
{ 
public 
static 
IServiceCollection (
SetupConfiguration) ;
(; <
this 
IServiceCollection $
services% -
,- .
IConfiguration/ =
configuration> K
)K L
{		 	
services

 
.

 
	Configure

 
<

  
MongoDbConfiguration

 3
>

3 4
(

4 5
configuration

5 B
.

B C

GetSection

C M
(

M N 
MongoDbConfiguration

N b
.

b c
MongoDb

c j
)

j k
)

k l
;

l m
return 
services 
; 
} 	
} 
} Ã
lC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Extensions\SwaggerExtensions.cs
	namespace 	
Catalog
 
. 
API 
. 

Extensions  
{ 
public 

static 
class 
SwaggerExtensions )
{ 
public 
static 
void  
AddConfiguredSwagger /
(/ 0
this0 4
IServiceCollection5 G
servicesH P
)P Q
{		 	
services

 
.

 
AddSwaggerGen

 "
(

" #
c

# $
=>

% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{3 4
Title5 :
=; <
$str= O
,O P
VersionQ X
=Y Z
$str[ _
}` a
)a b
;b c
} 
) 
; 
services 
. 
ConfigureSwaggerGen (
(( )
c) *
=>+ -
{ 
c 
. 
OperationFilter !
<! ""
RemoveApiVersionFilter" 8
>8 9
(9 :
): ;
;; <
c 
. 
DocumentFilter  
<  !
SetApiVersionFilter! 4
>4 5
(5 6
)6 7
;7 8
} 
) 
; 
} 	
public 
static 
void  
UseConfiguredSwagger /
(/ 0
this0 4
IApplicationBuilder5 H
appI L
)L M
{ 	
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
options $
=>% '
{ 
options 
. 
SwaggerEndpoint '
(' (
$str( B
,B C
$strD H
)H I
;I J
} 
) 
; 
} 	
} 
} Å
nC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Filters\RemoveApiVersionFilter.cs
	namespace 	
Catalog
 
. 
API 
. 
Filters 
{ 
public 

class "
RemoveApiVersionFilter '
:( )
IOperationFilter* :
{ 
public 
void 
Apply 
( 
OpenApiOperation *
	operation+ 4
,4 5"
OperationFilterContext6 L
contextM T
)T U
{		 	
IList

 
<

 
OpenApiParameter

 "
>

" #

parameters

$ .
=

/ 0
	operation

1 :
.

: ;

Parameters

; E
;

E F
OpenApiParameter 
versionParameter -
=. /

parameters0 :
.: ;
FirstOrDefault; I
(I J
xJ K
=>L N
xO P
.P Q
NameQ U
==V X
$strY b
)b c
;c d
if 
( 
versionParameter  
!=! #
null$ (
)( )
{ 

parameters 
. 
Remove !
(! "
versionParameter" 2
)2 3
;3 4
} 
} 	
} 
} ·
kC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Filters\SetApiVersionFilter.cs
	namespace 	
Catalog
 
. 
API 
. 
Filters 
{ 
public 

class 
SetApiVersionFilter $
:% &
IDocumentFilter' 6
{ 
public 
void 
Apply 
( 
OpenApiDocument )

swaggerDoc* 4
,4 5!
DocumentFilterContext6 K
contextL S
)S T
{		 	
OpenApiPaths

 
paths

 
=

  

swaggerDoc

! +
.

+ ,
Paths

, 1
;

1 2
OpenApiPaths 
	openPaths "
=# $
new% (
(( )
)) *
;* +
foreach 
( 
KeyValuePair !
<! "
string" (
,( )
OpenApiPathItem* 9
>9 :
pathPair; C
inD F
pathsG L
)L M
{ 
string 
key 
= 
pathPair %
.% &
Key& )
.) *
Replace* 1
(1 2
$str2 >
,> ?

swaggerDoc@ J
.J K
InfoK O
.O P
VersionP W
)W X
;X Y
	openPaths 
. 
Add 
( 
key !
,! "
pathPair# +
.+ ,
Value, 1
)1 2
;2 3
} 

swaggerDoc 
. 
Paths 
= 
	openPaths (
;( )
} 	
} 
} Ω
gC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Mappings\ProductMapping.cs
	namespace 	
Catalog
 
. 
API 
. 
Mappings 
{ 
public 

static 
class 
ProductMapping &
{ 
public		 
static		 
void		 
Map		 
(		 
)		  
{

 	
BsonClassMap 
. 
RegisterClassMap )
<) *
Product* 1
>1 2
(2 3
cm3 5
=>6 8
{ 
cm 
. 
SetIdMember 
( 
cm !
.! "
GetMemberMap" .
(. /
x/ 0
=>1 3
x4 5
.5 6
Id6 8
)8 9
)9 :
;: ;
cm 
. 
AutoMap 
( 
) 
; 
} 
) 
; 
} 	
} 
} ™!
sC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Middlewares\ErrorHandlingMiddleware.cs
	namespace 	
Catalog
 
. 
API 
. 
Middlewares !
{ 
public 

class #
ErrorHandlingMiddleware (
{ 
private		 
readonly		 
RequestDelegate		 (
_next		) .
;		. /
private

 
readonly

 
ILogger

  
<

  !#
ErrorHandlingMiddleware

! 8
>

8 9
_log

: >
;

> ?
public #
ErrorHandlingMiddleware &
(& '
RequestDelegate' 6
next7 ;
,; <
ILogger= D
<D E#
ErrorHandlingMiddlewareE \
>\ ]
log^ a
)a b
{ 	
_next 
= 
next 
; 
_log 
= 
log 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
try 
{ 
await 
_next 
( 
context #
)# $
;$ %
} 
catch 
( 
ArgumentException #
ex$ &
)& '
{ 
_log 
. 
LogInformation #
(# $
ex$ &
,& '
$str( 3
,3 4
ex5 7
.7 8
Message8 ?
)? @
;@ A
await 
WriteAsJsonAsync &
(& '
context' .
,. /
ex0 2
,2 3
HttpStatusCode4 B
.B C

BadRequestC M
)M N
;N O
} 
catch 
( #
EntityNotFoundException )
ex* ,
), -
{ 
_log 
. 
LogInformation #
(# $
ex$ &
,& '
$str( 3
,3 4
ex5 7
.7 8
Message8 ?
)? @
;@ A
await   
WriteAsJsonAsync   &
(  & '
context  ' .
,  . /
ex  0 2
,  2 3
HttpStatusCode  4 B
.  B C
NotFound  C K
)  K L
;  L M
}!! 
catch"" 
("" 
	Exception"" 
ex"" 
)"" 
{## 
_log$$ 
.$$ 
LogError$$ 
($$ 
ex$$  
,$$  !
$str$$" -
,$$- .
ex$$/ 1
.$$1 2
Message$$2 9
)$$9 :
;$$: ;
await%% 
WriteAsJsonAsync%% &
(%%& '
context%%' .
,%%. /
ex%%0 2
,%%2 3
HttpStatusCode%%4 B
.%%B C
InternalServerError%%C V
)%%V W
;%%W X
}&& 
}'' 	
private)) 
static)) 
async)) 
Task)) !
WriteAsJsonAsync))" 2
())2 3
HttpContext))3 >
context))? F
,))F G
	Exception))H Q
ex))R T
,))T U
HttpStatusCode))V d

statusCode))e o
,))o p
CancellationToken	))q Ç
cancellationToken
))É î
=
))ï ñ
default
))ó û
)
))û ü
{** 	
context++ 
.++ 
Response++ 
.++ 

StatusCode++ '
=++( )
(++* +
int+++ .
)++. /

statusCode++/ 9
;++9 :
context,, 
.,, 
Response,, 
.,, 
ContentType,, (
=,,) *
$str,,+ =
;,,= >
await-- 
context-- 
.-- 
Response-- "
.--" #

WriteAsync--# -
(--- .
JsonSerializer--. <
.--< =
	Serialize--= F
(--F G
ex--G I
.--I J
Message--J Q
)--Q R
,--R S
cancellationToken--T e
)--e f
;--f g
}.. 	
}// 
}00 ä
WC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder		 
.		 
Services		 
.		 #
AddEndpointsApiExplorer		 (
(		( )
)		) *
;		* +
builder

 
.

 
Services

 
.

 
AddApiVersioning

 !
(

! "
config

" (
=>

) +
{ 
config 

.
 
DefaultApiVersion 
= 
new "

ApiVersion# -
(- .
$num. /
,/ 0
$num1 2
)2 3
;3 4
config 

.
 /
#AssumeDefaultVersionWhenUnspecified .
=/ 0
true1 5
;5 6
config 

.
 
ReportApiVersions 
= 
true #
;# $
config 

.
 
UseApiBehavior 
= 
false !
;! "
} 
) 
; 
builder 
. 
Services 
.  
AddConfiguredSwagger %
(% &
)& '
;' (
builder 
. 
Services 
. 
SetupConfiguration #
(# $
builder$ +
.+ ,
Configuration, 9
)9 :
;: ;
builder 
. 
Services 
.  
RegisterDependencies %
(% &
)& '
;' (
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
app 
.  
UseConfiguredSwagger 
( 
) 
; 
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseAuthorization 
( 
) 
; 
app 
. 
MapControllers 
( 
) 
; 
app 
. 
UseMiddleware 
< #
ErrorHandlingMiddleware )
>) *
(* +
)+ ,
;, -
app!! 
.!! 
Run!! 
(!! 
)!! 	
;!!	 
¶	
vC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Repositories\IProductCommandRepository.cs
	namespace 	
Catalog
 
. 
API 
. 
Repositories "
{ 
public 

	interface %
IProductCommandRepository .
{ 
Task 
CreateAsync 
( 
Product  
product! (
,( )
CancellationToken* ;
cancellationToken< M
=N O
defaultP W
)W X
;X Y
Task 
< 
bool 
> 
DeleteAsync 
( 
Guid #
id$ &
,& '
CancellationToken( 9
cancellationToken: K
=L M
defaultN U
)U V
;V W
Task		 
<		 
bool		 
>		 
UpdateAsync		 
(		 
Product		 &
product		' .
,		. /
CancellationToken		0 A
cancellationToken		B S
=		T U
default		V ]
)		] ^
;		^ _
}

 
} ﬂ
tC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Repositories\IProductQueryRepository.cs
	namespace 	
Catalog
 
. 
API 
. 
Repositories "
{ 
public 

	interface #
IProductQueryRepository ,
{ 
Task 
< 
List 
< 
Product 
> 
> 
GetAllAsync '
(' (
CancellationToken( 9
cancellationToken: K
=L M
defaultN U
)U V
;V W
Task 
< 
Product 
> 
GetByIdAsync "
(" #
Guid# '
id( *
,* +
CancellationToken, =
cancellationToken> O
=P Q
defaultR Y
)Y Z
;Z [
Task		 
<		 
List		 
<		 
Product		 
>		 
>		 
GetByNameAsync		 *
(		* +
string		+ 1
name		2 6
,		6 7
CancellationToken		8 I
cancellationToken		J [
=		\ ]
default		^ e
)		e f
;		f g
Task

 
<

 
List

 
<

 
Product

 
>

 
>

 
GetByCategoryAsync

 .
(

. /
string

/ 5
category

6 >
,

> ?
CancellationToken

@ Q
cancellationToken

R c
=

d e
default

f m
)

m n
;

n o
} 
} º
uC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Repositories\ProductCommandRepository.cs
	namespace 	
Catalog
 
. 
API 
. 
Repositories "
{ 
public 

class $
ProductCommandRepository )
:* +%
IProductCommandRepository, E
{ 
private		 
readonly		 
IContext		 !
_context		" *
;		* +
public $
ProductCommandRepository '
(' (
IContext( 0
context1 8
)8 9
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
async 
Task 
CreateAsync %
(% &
Product& -
product. 5
,5 6
CancellationToken7 H
cancellationTokenI Z
=[ \
default] d
)d e
{ 	
await 
_context 
. 
Products #
.# $
InsertOneAsync$ 2
(2 3
product3 :
,: ;
cancellationToken< M
:M N
cancellationTokenO `
)` a
;a b
} 	
public 
async 
Task 
< 
bool 
> 
DeleteAsync  +
(+ ,
Guid, 0
id1 3
,3 4
CancellationToken5 F
cancellationTokenG X
=Y Z
default[ b
)b c
{ 	
DeleteResult 
result 
=  !
await" '
_context( 0
.0 1
Products1 9
.9 :
DeleteOneAsync: H
(H I
xI J
=>K M
xN O
.O P
IdP R
==S U
idV X
,X Y
cancellationTokenZ k
)k l
;l m
return 
result 
. 
IsAcknowledged (
&&) +
result, 2
.2 3
DeletedCount3 ?
>@ A
$numB C
;C D
} 	
public 
async 
Task 
< 
bool 
> 
UpdateAsync  +
(+ ,
Product, 3
product4 ;
,; <
CancellationToken= N
cancellationTokenO `
=a b
defaultc j
)j k
{ 	
ReplaceOneResult 
result #
=$ %
await& +
_context, 4
.4 5
Products5 =
.= >
ReplaceOneAsync> M
(M N
xN O
=>P R
xS T
.T U
IdU W
==X Z
product[ b
.b c
Idc e
,e f
productg n
,n o
cancellationToken	p Å
:
Å Ç
cancellationToken
É î
)
î ï
;
ï ñ
return   
result   
.   
IsAcknowledged   (
&&  ) +
result  , 2
.  2 3
ModifiedCount  3 @
>  A B
$num  C D
;  D E
}!! 	
}"" 
}## ﬁ)
sC:\Users\Kamq\source\repos\MicroserviceShop\src\Services\Catalog\Catalog.API\Repositories\ProductQueryRepository.cs
	namespace 	
Catalog
 
. 
API 
. 
Repositories "
{ 
public 

class "
ProductQueryRepository '
:( )#
IProductQueryRepository* A
{		 
private

 
readonly

 
IContext

 !
_context

" *
;

* +
public "
ProductQueryRepository %
(% &
IContext& .
context/ 6
)6 7
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
async 
Task 
< 
List 
< 
Product &
>& '
>' (
GetAllAsync) 4
(4 5
CancellationToken5 F
cancellationTokenG X
=Y Z
default[ b
)b c
{ 	
return 
await 
_context !
.! "
Products" *
.* +
Find+ /
(/ 0
x0 1
=>2 4
true5 9
)9 :
.: ;
ToListAsync; F
(F G
cancellationTokenG X
)X Y
;Y Z
} 	
public 
async 
Task 
< 
Product !
>! "
GetByIdAsync# /
(/ 0
Guid0 4
id5 7
,7 8
CancellationToken9 J
cancellationTokenK \
=] ^
default_ f
)f g
{ 	
if 
( 
id 
== 
Guid 
. 
Empty  
)  !
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
id7 9
)9 :
): ;
;; <
} 
return 
await 
_context !
.! "
Products" *
.* +
Find+ /
(/ 0
x0 1
=>2 4
x5 6
.6 7
Id7 9
==: <
id= ?
)? @
.@ A
FirstOrDefaultAsyncA T
(T U
cancellationTokenU f
)f g
??h j
throw 
new #
EntityNotFoundException 1
(1 2
typeof2 8
(8 9
Product9 @
)@ A
,A B
idC E
)E F
;F G
} 	
public!! 
async!! 
Task!! 
<!! 
List!! 
<!! 
Product!! &
>!!& '
>!!' (
GetByNameAsync!!) 7
(!!7 8
string!!8 >
name!!? C
,!!C D
CancellationToken!!E V
cancellationToken!!W h
=!!i j
default!!k r
)!!r s
{"" 	
if## 
(## 
string## 
.## 
IsNullOrWhiteSpace## )
(##) *
name##* .
)##. /
)##/ 0
{$$ 
throw%% 
new%% !
ArgumentNullException%% /
(%%/ 0
nameof%%0 6
(%%6 7
name%%7 ;
)%%; <
)%%< =
;%%= >
}&& 
return(( 
await(( 
_context(( !
.((! "
Products((" *
.((* +
Find((+ /
(((/ 0
x((0 1
=>((2 4
x((5 6
.((6 7
Name((7 ;
.((; <
Equals((< B
(((B C
name((C G
)((G H
)((H I
.((I J
ToListAsync((J U
(((U V
cancellationToken((V g
)((g h
;((h i
})) 	
public++ 
async++ 
Task++ 
<++ 
List++ 
<++ 
Product++ &
>++& '
>++' (
GetByCategoryAsync++) ;
(++; <
string++< B
category++C K
,++K L
CancellationToken++M ^
cancellationToken++_ p
=++q r
default++s z
)++z {
{,, 	
if-- 
(-- 
string-- 
.-- 
IsNullOrWhiteSpace-- )
(--) *
category--* 2
)--2 3
)--3 4
{.. 
throw// 
new// !
ArgumentNullException// /
(/// 0
nameof//0 6
(//6 7
category//7 ?
)//? @
)//@ A
;//A B
}00 
return22 
await22 
_context22 !
.22! "
Products22" *
.22* +
Find22+ /
(22/ 0
x220 1
=>222 4
x225 6
.226 7
Category227 ?
.22? @
Equals22@ F
(22F G
category22G O
)22O P
)22P Q
.22Q R
ToListAsync22R ]
(22] ^
cancellationToken22^ o
)22o p
;22p q
}33 	
}44 
}55 