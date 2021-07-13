# Instalando pacotes no R

install.packages('tesseract')
install.packages('pdftools')
install.packages('stringr')

# Carregando pacotes no R
library(tesseract)
library(pdftools)
library(stringr)

# Não esqueça de setar o diretório de trabalho! Vá em session > set working directory > choose directory e escolha a pasta onde vc colocou o PDF da LAI

pdf <- "C:/.../Cloroquina.pdf" #coloca o endereço do seu diretório


# Função pra transformar a página do PDF em imagem
img <- pdf_render_page(
  pdf = pdf,    # caminho do arquivo
  page = 14,     # número da página
  dpi = 300     # resolução (pontos por polegada)
)

# salvando imagem num arquivo png
png::writePNG(img, 'C:/.../Cloroquina_dig.png') #o caminho do arquivo e o nome que vc quer salvar. Coloquei Cloroquina_dig.png

# Transformando o PNG em txt
txt <- ocr('C:/.../Cloroquina_dig.png') #o caminho do arquivo png


#200000 é a quantidade de caracteres. Coloca mais pra ter certeza que vai pegar tudo da página. O resultado vai aparecer no console (caixinha de baixo). Copia e cola no bloco de notas
cat(str_trunc(txt, 20000))