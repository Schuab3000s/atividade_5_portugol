programa
{
	const inteiro diaria=100, academia=20, salao_festa=50, restaurante=35
	inteiro opcao=0, cpf[10], dias[10],valor[10], i=0, k=0, posicao, num_quarto=0, num_hospede=0,x=0
	cadeia hospede[10], nome_pesquisa, quarto[10]
	caracter resposta=' ', area_lazer
			
	funcao inicio()
	{
		para(inteiro y=0;y<10;y++){
			quarto[y]="L"
			hospede[y]="." 
		}
		menu()
		faca{
			escolha(opcao){		
				caso 1:
					cadastrar_hospede()
					menu()
				pare
				caso 2:
					exibir_hospede()
					menu()
				pare
				caso 3:
					exibir_quarto()
					menu()
				pare
				caso 4:
					atribuir_hospede_quarto()
					menu()
				pare
				caso 5:
					reservar_area_lazer()
					menu()
				pare
				caso 6:
					check_out()
					liberacao_quarto()
					menu()
				pare
				caso 0:
				pare
				caso contrario:	
					escreva("Opção inválida")
					menu()
				pare
			}
		}enquanto(opcao!=0)
		escreva("Obrigado por escolher nosso hotel. Volte Sempre!!\n")
				
	}
	funcao inteiro menu()
	{
		escreva("\n--------------------MENU--------------------\n")
		escreva("\nEscolha uma das opções abaixo:\n")
		escreva("\n1-Cadastrar hospedes;")
		escreva("\n2-Exibir hospedes cadastrados;")
		escreva("\n3-Exibir quartos;")
		escreva("\n4-Atribuir hospede a um quarto;")
		escreva("\n5-Reservar área de lazer;")
		escreva("\n6-Calcular total a pagar(CHECK-OUT);")
		escreva("\n0-Sair.\n")
		leia(opcao)
		limpa()
		retorne opcao
	}
	funcao inteiro cadastrar_hospede()
	{ 
		faca{
			i=0
			enquanto(i<10 e hospede[i]!="."){
				i++
			}
			
			se(i<10){
				escreva("Você poderá cadastrar até 10 hospedes.\n")
				escreva("\n(Já cadastrou ", k, " e faltam ", 10-k," hospedes)\n")
				escreva("Digite o nome do hospede:\n")
				leia(hospede[i])
				escreva("Digite o CPF do hospede:\n")
				escreva("(Digite os numeros sem espaço e sem caracteres. Ex.: 123456789)\n")
				leia(cpf[i])
				escreva("\nDigite o números de dias que ficará hospedado:\n")
				leia(dias[i])
				valor[i]=dias[i]*diaria
			}senao{
				escreva("Máximo de cadastros atingido\n")
			}
			
			limpa()		
			escreva("\n-----------------------------------------------\n")
			escreva("Nome: ", hospede[i],"\n")
			escreva("CPF: ", cpf[i],"\n")
			escreva("Quantidade de dias de hospedagem: ", dias[i])
			escreva("\n-----------------------------------------------\n")
			faca{
			escreva("Os dados estão corretos?(S/N)\n")
			leia(resposta)
			se(resposta!='N' e resposta!='S'){
				escreva("\nOpção inválida\n")
			}
			}enquanto(resposta!='N' e resposta!='S')
		}enquanto(resposta=='N')
		limpa()
		escreva("Cadastro realizado com sucesso!\n")
		k++
		retorne valor[i]
	}
	funcao exibir_hospede()
	{
				posicao=0
				enquanto((posicao<k)){					
					escreva("Hospede: ", hospede[posicao], "\n")
					escreva("Índice: ", posicao, "\n")
					escreva("CPF: ", cpf[posicao], "\n")
					escreva("Quantidade de dias: ", dias[posicao], "\n\n")
					posicao++				
				}		
	}
	funcao exibir_quarto()
	{
		para(x=0;x<10;x++){
			se(quarto[x]!="L"){
				escreva("\nQuarto ",x+1,": ", quarto[x],".\n")
			}senao{
				escreva("\nQuarto ", x+1, " está livre\n")
			}
		}
	}
	funcao atribuir_hospede_quarto()
	{
		para(inteiro j=0;j<10;j++){
			escreva("Indice: ", j, " | Hospede: ", hospede[j], "\n")
		}
		faca{
			escreva("Digite o indice do hospede (entre 0 e 9): ")
			leia(num_hospede)
			se(num_hospede<0 ou num_hospede>i){
				escreva("Hospede não existe\n")
			}senao{
				escreva("Hospede: ", hospede[num_hospede],"\n")
			}
		}enquanto(num_hospede<0 ou num_hospede>i)
		faca{	
			escreva("Digite o número do quarto (entre 1 e 10): ")
			leia(num_quarto)
			num_quarto=num_quarto-1
			se(num_quarto<0 ou num_quarto>=10){
				escreva("Número inválido.\n")		
			}senao se (quarto[num_quarto]=="L"){
				quarto[num_quarto]=hospede[num_hospede]
				
			}senao{
				limpa()
				escreva("\nQuarto ocupado!\n")
			}
		}enquanto(num_quarto<0 ou num_quarto>=10)
		exibir_quarto()
	}
	funcao reservar_area_lazer()
	{
		escreva("Digite o nome do hospede: ")
		leia(nome_pesquisa)
		posicao=0
		enquanto((posicao<10) e (hospede[posicao]!=nome_pesquisa)){
					posicao++
		}
		
		escreva("Qual área de lazer deseja utilizar?")
		escreva("\n-----------------------------------\n")
		escreva("(A)Academia - R$20\n")
		escreva("(S)Salão de festas - R$50\n")
		escreva("(R)Restaurante - R$35")
		escreva("\n-----------------------------------\n")
		leia(area_lazer)
		faca{
			escolha(area_lazer){
				caso 'A':
					escreva("Foi adicionado R$20 a sua conta")
					valor[posicao]=valor[posicao]+academia
				pare
				caso 'S':
					escreva("Foi adicionado R$50 a sua conta")
					valor[posicao]=valor[posicao]+salao_festa
				pare
				caso 'R':
					escreva("Foi adicionado R$35 a sua conta")
					valor[posicao]=valor[posicao]+restaurante
					pare
				caso contrario:
					escreva("Opção inválida")
					escreva("Digite outra opção: ")
					leia(area_lazer)
				pare
			}
		}enquanto(area_lazer!='A' e area_lazer!='S' e area_lazer!='R')	
	}
	funcao cadeia check_out()
	{	
		para(inteiro j=0;j<10;j++){
			escreva("Indice: ", j, " | Hospede: ", hospede[j], "\n")
		}
		escreva("Digite o indice do Hospede: ")
		leia(posicao)
		escreva("Hospede: ", hospede[posicao], "\n")
		escreva("O total a pagar é: R$", valor[posicao])
		retorne hospede[posicao]
	}
	funcao liberacao_quarto()
	{
		quarto[num_quarto]=hospede[posicao]
		quarto[num_quarto]="L"
		valor[posicao]=0
		hospede[posicao]="."
		k--
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3815; 
 * @DOBRAMENTO-CODIGO = [7, 52, 67, 109, 120, 160, 198, 209];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {valor, 4, 36, 5}-{i, 4, 47, 1}-{k, 4, 52, 1}-{posicao, 4, 57, 7}-{hospede, 5, 8, 7}-{quarto, 5, 36, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */