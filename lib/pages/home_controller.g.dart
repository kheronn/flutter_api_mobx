// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$mundoAtom = Atom(name: '_HomeControllerBase.mundo');

  @override
  Mundo get mundo {
    _$mundoAtom.context.enforceReadPolicy(_$mundoAtom);
    _$mundoAtom.reportObserved();
    return super.mundo;
  }

  @override
  set mundo(Mundo value) {
    _$mundoAtom.context.conditionallyRunInAction(() {
      super.mundo = value;
      _$mundoAtom.reportChanged();
    }, _$mundoAtom, name: '${_$mundoAtom.name}_set');
  }

  final _$paisAtom = Atom(name: '_HomeControllerBase.pais');

  @override
  Pais get pais {
    _$paisAtom.context.enforceReadPolicy(_$paisAtom);
    _$paisAtom.reportObserved();
    return super.pais;
  }

  @override
  set pais(Pais value) {
    _$paisAtom.context.conditionallyRunInAction(() {
      super.pais = value;
      _$paisAtom.reportChanged();
    }, _$paisAtom, name: '${_$paisAtom.name}_set');
  }

  final _$getInfoMundoAsyncAction = AsyncAction('getInfoMundo');

  @override
  Future getInfoMundo() {
    return _$getInfoMundoAsyncAction.run(() => super.getInfoMundo());
  }

  final _$getInfoPaisAsyncAction = AsyncAction('getInfoPais');

  @override
  Future getInfoPais({String nomePais = 'brazil'}) {
    return _$getInfoPaisAsyncAction
        .run(() => super.getInfoPais(nomePais: nomePais));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changePage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentIndex: ${currentIndex.toString()},mundo: ${mundo.toString()},pais: ${pais.toString()}';
    return '{$string}';
  }
}
