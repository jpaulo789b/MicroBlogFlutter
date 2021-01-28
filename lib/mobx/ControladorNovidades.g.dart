// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorNovidades.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorNovidades on _ControladorNovidadesBase, Store {
  final _$statusConsultaNovidadeAtom =
      Atom(name: '_ControladorNovidadesBase.statusConsultaNovidade');

  @override
  ServiceStatus get statusConsultaNovidade {
    _$statusConsultaNovidadeAtom.reportRead();
    return super.statusConsultaNovidade;
  }

  @override
  set statusConsultaNovidade(ServiceStatus value) {
    _$statusConsultaNovidadeAtom
        .reportWrite(value, super.statusConsultaNovidade, () {
      super.statusConsultaNovidade = value;
    });
  }

  final _$statusConsultaPostAtom =
      Atom(name: '_ControladorNovidadesBase.statusConsultaPost');

  @override
  ServiceStatus get statusConsultaPost {
    _$statusConsultaPostAtom.reportRead();
    return super.statusConsultaPost;
  }

  @override
  set statusConsultaPost(ServiceStatus value) {
    _$statusConsultaPostAtom.reportWrite(value, super.statusConsultaPost, () {
      super.statusConsultaPost = value;
    });
  }

  final _$novoPostAtom = Atom(name: '_ControladorNovidadesBase.novoPost');

  @override
  String get novoPost {
    _$novoPostAtom.reportRead();
    return super.novoPost;
  }

  @override
  set novoPost(String value) {
    _$novoPostAtom.reportWrite(value, super.novoPost, () {
      super.novoPost = value;
    });
  }

  final _$editandoPostAtom =
      Atom(name: '_ControladorNovidadesBase.editandoPost');

  @override
  String get editandoPost {
    _$editandoPostAtom.reportRead();
    return super.editandoPost;
  }

  @override
  set editandoPost(String value) {
    _$editandoPostAtom.reportWrite(value, super.editandoPost, () {
      super.editandoPost = value;
    });
  }

  @override
  String toString() {
    return '''
statusConsultaNovidade: ${statusConsultaNovidade},
statusConsultaPost: ${statusConsultaPost},
novoPost: ${novoPost},
editandoPost: ${editandoPost}
    ''';
  }
}
