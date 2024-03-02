import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:wissen/server/constantes.dart';
import 'package:wissen/server/models/usuario.dart';

class UsuarioBLL {
  Future<bool> validarLogin(String login, String senha) async {
    final client = Client().setEndpoint(urlEndpoint).setProject(projectId);
    final databases = Databases(client);

    try {
      var response = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionIdUsuario,
        queries: [
          Query.equal('login', login),
          Query.equal('senha', senha),
        ],
      );
      if (response.documents.isEmpty) {
        return false;
      }
      return true;
    } on Exception {
      return false;
    }
  }

  void SalvarUsuario(Usuario usuario) async {
    final client = Client().setEndpoint(urlEndpoint).setProject(projectId);
    final databases = Databases(client);

    try {
      await databases.createDocument(
        databaseId: databaseId,
        collectionId: collectionIdUsuario,
        data: usuario.toJson(),
        documentId: ID.unique(),
      );
    } catch (e) {
      // Handle any errors that occur during the save process
      print('Error saving user: $e');
    }
  }
}
