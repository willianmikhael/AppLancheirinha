import 'package:flutter/material.dart';
import 'package:gymapp/modelos/exercicio_modelo.dart';
import 'package:gymapp/modelos/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      name: "Supino Reto",
      treino: "costas",
      comoFazer: "comoFazer");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(id: "SE001", sentido: "Feliz", data: "2021-10-01"),
    SentimentoModelo(id: "SE002", sentido: "Triste", data: "2021-10-02"),
    SentimentoModelo(id: "SE003", sentido: "Neutro", data: "2021-10-03"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              exercicioModelo.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              exercicioModelo.treino,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0A6D92),
        elevation: 0.0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Adicionar Exercício');
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Enviar Foto"),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Tirar foto")),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              exercicioModelo.comoFazer,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(color: Colors.black),
            ),
            const Text(
              "Como estou me sentindo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoAgora.sentido),
                  subtitle: Text(sentimentoAgora.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print('Deletar sentimento');
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
