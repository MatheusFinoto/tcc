class ImoveisData{
    var endereco;
    var avaliacao;
    var foto;
    var fotos;
    var lat;
    var long;
    var tipo;
    var comodos;
    var tipoVenda;

    ImoveisData(this.endereco, this.avaliacao, this.foto, this.fotos, this.lat, this.long,
        this.tipo, this.comodos, this.tipoVenda);

    Map<String, dynamic> toMap(){
        return {
            "endereco":this.endereco,
            "avaliacao":this.avaliacao,
            "foto":this.foto,
            "fotos":this.fotos,
            "lat":this.lat,
            "long":this.long,
            "tipo":this.tipo,
            "comodos":this.comodos,
            "tipoVenda":this.tipoVenda,
        };
    }
}