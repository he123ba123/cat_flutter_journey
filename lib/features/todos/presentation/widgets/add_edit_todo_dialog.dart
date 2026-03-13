import 'package:cat_flutter_journey/core/utils/common_imports.dart';
import 'package:cat_flutter_journey/features/todos/logic/todos_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEditTodoDialog extends StatefulWidget {
  final String? id;
  final String? initialTitle;
  final String? initialSubtitle;

  const AddEditTodoDialog({
    super.key,
    this.id,
    this.initialTitle,
    this.initialSubtitle,
  });

  @override
  State<AddEditTodoDialog> createState() => _AddEditTodoDialogState();
}

class _AddEditTodoDialogState extends State<AddEditTodoDialog> {
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialTitle != null) {
      _titleController.text = widget.initialTitle!;
    }
    if (widget.initialSubtitle != null) {
      _subtitleController.text = widget.initialSubtitle!;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    final subtitle = _subtitleController.text.trim();

    if (title.isEmpty) return;

    if (widget.id == null) {
      // Add
      context.read<TodosCubit>().addTodo(
            title: title,
            subtitle: subtitle,
          );
    } else {
      // Edit
      context.read<TodosCubit>().updateTodo(
            widget.id!,
            title: title,
            subtitle: subtitle,
          );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: AppColors.background,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.id == null ? 'Add To Do' : 'Edit To Do',
              style: AppTextStyles.font20Bold.copyWith(color: AppColors.primary100),
              textAlign: TextAlign.center,
            ),
            20.ph,
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            10.ph,
            TextFormField(
              controller: _subtitleController,
              decoration: InputDecoration(
                hintText: 'Subtitle (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              maxLines: 3,
            ),
            20.ph,
            CustomButton(
              onPressed: _submit,
              title: widget.id == null ? 'Add' : 'Save',
              color: AppColors.primary100,
              textColor: AppColors.background,
            ),
          ],
        ),
      ),
    );
  }
}
