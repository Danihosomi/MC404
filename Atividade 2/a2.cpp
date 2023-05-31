// Atividade 2 - MC404
// Daniel Yuji Hosomi
// Linha de comando para compilar o código: (utilizar C++14 ou mais)
// g++ a2.cpp -o a2
// 
// O código assume que a instrução será informada da seguinte forma
// Ex para cada if:
// addi a0, a0, 1
// mul a0, a0, a1
// ret
// lui a0, 123
// lw a0, 0(a1)
// call 1231

#include <bits/stdc++.h>
#define sz(x) (int)x.size()
#define f first
#define s second
#define all(x) x.begin(),x.end()
#define pb push_back
using namespace std;
typedef long long ll;

const ll POS_INI = (ll)1e3; // posição inicial constante

map<string,ll> reg, ins; 

pair<ll,string> arruma(string x){ // função usada para arrumar a leitura de input do lw/sw
    ll num = 0, i=0, neg=1; string c;
    for(i=0;i<sz(x);i++){
        if(x[i]=='(') break;
        else{ 
            if(x[i]=='-'){ 
                neg=-1; continue;
            }
            num*=10;
            num+=(x[i]-'0');
        }
    } num*=neg;
    for(int j=i+1;j<sz(x);j++){
        if(x[j]==')') break;
        else c+=x[j];
    }

    return {num,c};
}

// Função responsável por iniciar valores fixos no meu problema
void init(){ 
    // Inicio registradores
    reg["zero"] = 0; reg["ra"] = 1; reg["sp"] = 2; reg["gp"] = 3;
    reg["tp"] = 4; reg["t0"] = 5; reg["t1"] = 6; reg["t2"] = 7; reg["t3"] = 28; reg["t4"] = 29; reg["t5"] = 30; reg["t6"] = 31;
    reg["a0"] = 10;
    for(int i=1;i<8;i++){
        string a="a", ant="a"; a+=(char)(i+'0'); ant+=(char)((i-1)+'0'); reg[a]=1+reg[ant]; 
    }
    reg["s0"] = 8; reg["fp"] = 8; reg["s1"] = 9; reg["s2"] = 18;
    for(int i=3;i<10;i++){
        string a="s", ant="s"; a+=(char)(i+'0'); ant+=(char)((i-1)+'0'); reg[a]=1+reg[ant]; 
    } reg["s10"] = 26; reg["s11"] = 27;

    // Inicio instruções
    ins["addi"] = 19;
    ins["slli"] = 19+(1<<12);
    ins["xor"] = 51+(1<<14);
    ins["beq"] = 99;
    ins["lw"] = 3 + (1<<13);
    ins["sw"] = 35 + (1<<13);
    ins["mul"] = 51 + (1<<25);
    ins["lui"] = 55;
    ins["jalr"] = 103;
    ins["auipc"] = 23;
}

// Função responsável por pegar um número decimal (instrução codificada) e printá-lo na forma hexadecimal 
void printAnswer(ll num){ // Testada
    vector<char> ans; ll ini = 15;

    for(int i=0;i<=28;i+=4){
        ll fourBits = num&(ini); ini<<=4; fourBits>>=i;
        if(fourBits<=9) ans.pb((char)(fourBits+'0'));
        else ans.pb((char)((fourBits-10)+'A'));
    }

    ans.pb('x'); ans.pb('0'); reverse(all(ans));
    for(auto x : ans) cout<<x;
    cout<<'\n';
}

ll instructionR(string comando,string reg1,string reg2,string reg3){
    ll valorCodigo = 0;
    valorCodigo=ins[comando]|(reg[reg1]<<7)|(reg[reg2]<<15)|(reg[reg3]<<20);
    return valorCodigo;
}

ll instructionI(string comando,string reg1,string reg2,ll val){
    ll valorCodigo = 0;
    valorCodigo=ins[comando]|(reg[reg1]<<7)|(reg[reg2]<<15)|(val<<20);
    return valorCodigo;
}

ll instructionS(string comando,string reg1,string reg2,ll val){
    ll valorCodigo = 0, valorGrande=0;
    for(int i=5;i<=11;i++) valorGrande|=(val&(1<<i));
    valorCodigo=ins[comando]|((val&31)<<7)|(reg[reg2]<<15)|(reg[reg1]<<20)|((val&valorGrande)<<20);
    return valorCodigo;
}

ll instructionB(string comando,string reg1,string reg2,ll val){
    ll valorCodigo = 0;
    ll temporario = (val&(1<<11) ? 1 : 0);
    temporario|=(val&(30)); temporario<<=7;
    valorCodigo=ins[comando]|(reg[reg1]<<15)|(reg[reg2]<<20)|temporario;
    ll num = 0;
    for(int i=5;i<=10;i++) num|=(val&(1<<i));
    temporario = (val&num); temporario>>=5; temporario|=((val&(1<<12)) ? (1<<6) : 0); temporario<<=25;
    valorCodigo|=temporario;
    
    return valorCodigo;
}

ll instructionU(string comando,string reg1,ll val){ // val já é apenas a parte superior do valor (12-31)
    ll valorCodigo = 0;
    valorCodigo = ins[comando]|(reg[reg1]<<7)|(val<<12);
    return valorCodigo;
}

int main(){
    string comando; init();

    while(cin>>comando){ int check = 0;
        ll valorComando = 0;
        if(comando=="addi" || comando=="slli" || comando=="beq"){ // Testado 
            string reg1, reg2; ll val; cin>>reg1>>reg2>>val; reg1.pop_back(); reg2.pop_back();
            if(comando=="addi" || comando=="slli") valorComando=instructionI(comando,reg1,reg2,val); 
            else valorComando = instructionB(comando,reg1,reg2,val-POS_INI);
        }
        else if(comando=="mul" || comando=="xor"){ // Testado
            string reg1, reg2, reg3; cin>>reg1>>reg2>>reg3; reg1.pop_back(); reg2.pop_back();
            valorComando = instructionR(comando,reg1,reg2,reg3); 
        }
        else if(comando=="ret"){ // Testado
            valorComando = instructionI("jalr","zero","ra",0);
        }
        else if(comando=="lui" || comando=="li"){ // Testado
            string reg1; ll val; cin>>reg1>>val; reg1.pop_back();
            if(comando=="lui") valorComando = instructionU(comando,reg1,val); 
            else{
                ll valorGrande = 0, valorPequeno = 0;
                for(int i=0;i<12;i++) valorPequeno|=(val&(1<<i));
                for(int i=12;i<=31;i++) valorGrande|=(val&(1<<i));
                valorGrande>>=12; valorGrande+=(val&(1<<11) ? 1 : 0);
                if(valorGrande){
                    valorComando = instructionU("lui",reg1,valorGrande);
                    printAnswer(valorComando);
                    valorComando = instructionI("addi",reg1,reg1,valorPequeno);
                }
                else valorComando = instructionI("addi",reg1,"zero",valorPequeno);
            }
        }
        else if(comando=="lw" || comando=="sw"){ // Testado
            string reg1, reg2; ll val; cin>>reg1>>reg2; reg1.pop_back(); auto arrumado = arruma(reg2);
            val=arrumado.f; reg2=arrumado.s;
            if(comando=="lw") valorComando = instructionI(comando,reg1,reg2,val);
            else valorComando = instructionS(comando,reg1,reg2,val);
        }
        else if(comando=="call"){ // Testado
            ll val; cin>>val; val = val - 1000;
            ll valorGrande = 0, valorPequeno = 0;
            for(int i=0;i<12;i++) valorPequeno|=(val&(1<<i));
            for(int i=12;i<=31;i++) valorGrande|=(val&(1<<i));
            valorGrande>>=12; valorGrande+=(val&(1<<11) ? 1 : 0);
            valorComando = instructionU("auipc","ra",valorGrande);
            printAnswer(valorComando);
            valorComando = instructionI("jalr","ra","ra",valorPequeno);
        }
        else cout<<"Comando Inválido !"<<'\n', check=1;

        if(!check) printAnswer(valorComando);
    }

    return 0;
}
