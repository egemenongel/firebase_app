import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/base/viewmodel/base_viewmodel.dart';

class BaseView<T extends BaseViewmodel> extends StatefulWidget {
  const BaseView(
      {Key? key,
      required this.builder,
      required this.viewmodelBuilder,
      this.onModelReady})
      : super(key: key);

  final Widget Function(BuildContext context, T viewmodel, Widget? child)
      builder;
  final Function(T model)? onModelReady;
  final T Function() viewmodelBuilder;

  @override
  State<BaseView<T>> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseViewmodel> extends State<BaseView<T>> {
  T? _viewmodel;

  @override
  void initState() {
    super.initState();
    _createViewModel();
  }

  void _createViewModel() {
    _viewmodel ??= widget.viewmodelBuilder();
    if (widget.onModelReady != null) {
      widget.onModelReady!(_viewmodel!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => _viewmodel!,
      child: Consumer<T>(builder: viewBuilder),
    );
  }

  Widget viewBuilder(BuildContext context, T model, Widget? child) {
    return Stack(
      children: [
        widget.builder(context, model, child),
      ],
    );
  }

  Visibility visibleProgress(model) {
    return Visibility(
      visible: model.isBusy,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.4),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
