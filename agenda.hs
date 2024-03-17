import Data.List

-- Definição de tipos
type Evento = String
type Agenda = [Evento]

-- Função para executar uma opção do menu
executarOpcao :: String -> Agenda -> IO ()
executarOpcao "1" agenda = adicionarEvento agenda
executarOpcao "2" agenda = removerEvento agenda
executarOpcao "3" agenda = visualizarAgenda agenda
executarOpcao "4" _      = putStrLn "Saindo do programa..."
executarOpcao _   agenda = do
    putStrLn "Opção inválida. Tente novamente."
    loop agenda

-- Função para adicionar um evento à agenda
adicionarEvento :: Agenda -> IO ()
adicionarEvento agenda = do
    putStrLn "Digite o evento a ser adicionado:"
    evento <- getLine
    let novaAgenda = agenda ++ [evento]
    loop novaAgenda

-- Função para remover um evento da agenda
removerEvento :: Agenda -> IO ()
removerEvento agenda = do
    putStrLn "Digite o índice do evento a ser removido:"
    indiceStr <- getLine
    let indice = read indiceStr :: Int
    if indice >= 0 && indice < length agenda
        then do
            let novaAgenda = delete (agenda !! indice) agenda
            loop novaAgenda
        else do
            putStrLn "Índice inválido. Tente novamente."
            loop agenda

-- Função para visualizar a agenda
visualizarAgenda :: Agenda -> IO ()
visualizarAgenda agenda = do
    putStrLn "Eventos na Agenda:"
    mapM_ putStrLn agenda
    loop agenda
    
-- Função principal
main :: IO ()
main = do
    putStrLn "Bem-vindo ao Gerenciador de Agenda!"
    loop []

-- Função de loop para interação com o usuário
loop :: Agenda -> IO ()
loop agenda = do
    putStrLn "\nSelecione uma opção:"
    putStrLn "1. Adicionar evento"
    putStrLn "2. Remover evento"
    putStrLn "3. Visualizar agenda"
    putStrLn "4. Sair"
    opcao <- getLine
    executarOpcao opcao agenda
