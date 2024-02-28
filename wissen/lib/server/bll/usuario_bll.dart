import 'package:appwrite/appwrite.dart';
import 'package:wissen/server/constantes.dart';

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
      // validar response
      if (response.documents.length == 0) {
        return false;
      }
      return true;
    } on Exception {
      return false;
    }
  }
}
