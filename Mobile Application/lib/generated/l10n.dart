// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `DreamCushion`
  String get app_name {
    return Intl.message(
      'DreamCushion',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Label{name}`
  String label_params(Object name) {
    return Intl.message(
      'Label$name',
      name: 'label_params',
      desc: '',
      args: [name],
    );
  }

  /// `-----------------------------`
  String get action_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'action_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get action_save {
    return Intl.message(
      'Save',
      name: 'action_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get action_edit {
    return Intl.message(
      'Edit',
      name: 'action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get action_add {
    return Intl.message(
      'Add',
      name: 'action_add',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get action_next_step {
    return Intl.message(
      'Next step',
      name: 'action_next_step',
      desc: '',
      args: [],
    );
  }

  /// `Previous step`
  String get action_pre_step {
    return Intl.message(
      'Previous step',
      name: 'action_pre_step',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get action_delete {
    return Intl.message(
      'Delete',
      name: 'action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get action_remove {
    return Intl.message(
      'Remove',
      name: 'action_remove',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get action_reset {
    return Intl.message(
      'Reset',
      name: 'action_reset',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get action_search {
    return Intl.message(
      'Search',
      name: 'action_search',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get action_ok {
    return Intl.message(
      'Ok',
      name: 'action_ok',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get action_confirm {
    return Intl.message(
      'Confirm',
      name: 'action_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get action_close {
    return Intl.message(
      'Close',
      name: 'action_close',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get action_exit {
    return Intl.message(
      'Exit',
      name: 'action_exit',
      desc: '',
      args: [],
    );
  }

  /// `Exit, without save`
  String get action_exit_without_save {
    return Intl.message(
      'Exit, without save',
      name: 'action_exit_without_save',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get action_send {
    return Intl.message(
      'Send',
      name: 'action_send',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get action_setting {
    return Intl.message(
      'Setting',
      name: 'action_setting',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get action_cancel {
    return Intl.message(
      'Cancel',
      name: 'action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Not remind again`
  String get action_do_not_remind_again {
    return Intl.message(
      'Not remind again',
      name: 'action_do_not_remind_again',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get action_complete {
    return Intl.message(
      'Complete',
      name: 'action_complete',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get action_submit {
    return Intl.message(
      'Submit',
      name: 'action_submit',
      desc: '',
      args: [],
    );
  }

  /// `I know`
  String get action_i_know {
    return Intl.message(
      'I know',
      name: 'action_i_know',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get action_continue {
    return Intl.message(
      'Continue',
      name: 'action_continue',
      desc: '',
      args: [],
    );
  }

  /// `Look`
  String get action_look {
    return Intl.message(
      'Look',
      name: 'action_look',
      desc: '',
      args: [],
    );
  }

  /// `Deny`
  String get action_deny {
    return Intl.message(
      'Deny',
      name: 'action_deny',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get action_filter {
    return Intl.message(
      'Filter',
      name: 'action_filter',
      desc: '',
      args: [],
    );
  }

  /// `Entire`
  String get action_entire {
    return Intl.message(
      'Entire',
      name: 'action_entire',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get action_import {
    return Intl.message(
      'Import',
      name: 'action_import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get action_export {
    return Intl.message(
      'Export',
      name: 'action_export',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_common_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_common_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get label_prompt {
    return Intl.message(
      'Prompt',
      name: 'label_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get label_def {
    return Intl.message(
      'Default',
      name: 'label_def',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get label_running {
    return Intl.message(
      'Running',
      name: 'label_running',
      desc: '',
      args: [],
    );
  }

  /// `We need to get read and write memory permissions to perform file selection operations!`
  String get label_permission_file_picker_hint {
    return Intl.message(
      'We need to get read and write memory permissions to perform file selection operations!',
      name: 'label_permission_file_picker_hint',
      desc: '',
      args: [],
    );
  }

  /// `This is the most basic permission we need, please grant permission!`
  String get label_permission_base_hint {
    return Intl.message(
      'This is the most basic permission we need, please grant permission!',
      name: 'label_permission_base_hint',
      desc: '',
      args: [],
    );
  }

  /// `This is the most basic permission we need, please grant permission in the settings screen!`
  String get label_permission_base_setting_hint {
    return Intl.message(
      'This is the most basic permission we need, please grant permission in the settings screen!',
      name: 'label_permission_base_setting_hint',
      desc: '',
      args: [],
    );
  }

  /// `You have not granted the most basic permissions and some of the features will not be available!`
  String get label_permission_base_hint_denied {
    return Intl.message(
      'You have not granted the most basic permissions and some of the features will not be available!',
      name: 'label_permission_base_hint_denied',
      desc: '',
      args: [],
    );
  }

  /// `The content cannot be empty or have spaces`
  String get label_content_cannot_be_empty_blank {
    return Intl.message(
      'The content cannot be empty or have spaces',
      name: 'label_content_cannot_be_empty_blank',
      desc: '',
      args: [],
    );
  }

  /// `Parameter loss`
  String get label_select_parameter_is_missing {
    return Intl.message(
      'Parameter loss',
      name: 'label_select_parameter_is_missing',
      desc: '',
      args: [],
    );
  }

  /// `Login timeout, please login again!`
  String get label_token_failure_prompt {
    return Intl.message(
      'Login timeout, please login again!',
      name: 'label_token_failure_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get label_loading {
    return Intl.message(
      'Loading...',
      name: 'label_loading',
      desc: '',
      args: [],
    );
  }

  /// `Loaded successfully`
  String get label_loading_success {
    return Intl.message(
      'Loaded successfully',
      name: 'label_loading_success',
      desc: '',
      args: [],
    );
  }

  /// `Loading Failure`
  String get label_loading_failure {
    return Intl.message(
      'Loading Failure',
      name: 'label_loading_failure',
      desc: '',
      args: [],
    );
  }

  /// `Deleting...`
  String get label_delete_ing {
    return Intl.message(
      'Deleting...',
      name: 'label_delete_ing',
      desc: '',
      args: [],
    );
  }

  /// `Confirm deletion?`
  String get label_delete_really {
    return Intl.message(
      'Confirm deletion?',
      name: 'label_delete_really',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get label_delete_success {
    return Intl.message(
      'Deleted successfully',
      name: 'label_delete_success',
      desc: '',
      args: [],
    );
  }

  /// `Deletion failure`
  String get label_delete_failed {
    return Intl.message(
      'Deletion failure',
      name: 'label_delete_failed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload files`
  String get label_file_upload_by_file_failed {
    return Intl.message(
      'Failed to upload files',
      name: 'label_file_upload_by_file_failed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to download file`
  String get label_file_download_failed {
    return Intl.message(
      'Failed to download file',
      name: 'label_file_download_failed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to download file. Please try again.`
  String get label_file_download_failed_download_file_failed {
    return Intl.message(
      'Failed to download file. Please try again.',
      name: 'label_file_download_failed_download_file_failed',
      desc: '',
      args: [],
    );
  }

  /// `Uploading now`
  String get label_file_are_uploading {
    return Intl.message(
      'Uploading now',
      name: 'label_file_are_uploading',
      desc: '',
      args: [],
    );
  }

  /// `Upload Failed`
  String get label_file_upload_failed {
    return Intl.message(
      'Upload Failed',
      name: 'label_file_upload_failed',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded successfully`
  String get label_file_uploaded_success {
    return Intl.message(
      'Uploaded successfully',
      name: 'label_file_uploaded_success',
      desc: '',
      args: [],
    );
  }

  /// `Being submitted...`
  String get label_submit_ing {
    return Intl.message(
      'Being submitted...',
      name: 'label_submit_ing',
      desc: '',
      args: [],
    );
  }

  /// `Submitted successfully`
  String get label_submitted_success {
    return Intl.message(
      'Submitted successfully',
      name: 'label_submitted_success',
      desc: '',
      args: [],
    );
  }

  /// `Submission failed`
  String get label_submitted_failure {
    return Intl.message(
      'Submission failed',
      name: 'label_submitted_failure',
      desc: '',
      args: [],
    );
  }

  /// `Modified successfully`
  String get toast_edit_success {
    return Intl.message(
      'Modified successfully',
      name: 'toast_edit_success',
      desc: '',
      args: [],
    );
  }

  /// `Modification Failure`
  String get toast_edit_failure {
    return Intl.message(
      'Modification Failure',
      name: 'toast_edit_failure',
      desc: '',
      args: [],
    );
  }

  /// `Failure to operate`
  String get label_operation_failed {
    return Intl.message(
      'Failure to operate',
      name: 'label_operation_failed',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get label_save_ing {
    return Intl.message(
      'Saving...',
      name: 'label_save_ing',
      desc: '',
      args: [],
    );
  }

  /// `Save failure`
  String get label_save_failed {
    return Intl.message(
      'Save failure',
      name: 'label_save_failed',
      desc: '',
      args: [],
    );
  }

  /// `Save Successful`
  String get label_success_saved {
    return Intl.message(
      'Save Successful',
      name: 'label_success_saved',
      desc: '',
      args: [],
    );
  }

  /// `Exiting...`
  String get label_exiting {
    return Intl.message(
      'Exiting...',
      name: 'label_exiting',
      desc: '',
      args: [],
    );
  }

  /// `Restarting`
  String get label_restarting {
    return Intl.message(
      'Restarting',
      name: 'label_restarting',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_update_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_update_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `No update for now.`
  String get action_temporarily_not_update {
    return Intl.message(
      'No update for now.',
      name: 'action_temporarily_not_update',
      desc: '',
      args: [],
    );
  }

  /// `Immediate Updates`
  String get action_update_now {
    return Intl.message(
      'Immediate Updates',
      name: 'action_update_now',
      desc: '',
      args: [],
    );
  }

  /// `Getting the installation package`
  String get action_get_the_installation_package {
    return Intl.message(
      'Getting the installation package',
      name: 'action_get_the_installation_package',
      desc: '',
      args: [],
    );
  }

  /// `The latest version is available`
  String get title_the_latest_version {
    return Intl.message(
      'The latest version is available',
      name: 'title_the_latest_version',
      desc: '',
      args: [],
    );
  }

  /// `Already the latest version.`
  String get title_already_the_latest_version {
    return Intl.message(
      'Already the latest version.',
      name: 'title_already_the_latest_version',
      desc: '',
      args: [],
    );
  }

  /// `Updating`
  String get title_be_updating {
    return Intl.message(
      'Updating',
      name: 'title_be_updating',
      desc: '',
      args: [],
    );
  }

  /// `Downloaded%1$s`
  String get label_completed_size {
    return Intl.message(
      'Downloaded%1\$s',
      name: 'label_completed_size',
      desc: '',
      args: [],
    );
  }

  /// `Download complete`
  String get action_download_on_success {
    return Intl.message(
      'Download complete',
      name: 'action_download_on_success',
      desc: '',
      args: [],
    );
  }

  /// `Install now`
  String get action_install_now {
    return Intl.message(
      'Install now',
      name: 'action_install_now',
      desc: '',
      args: [],
    );
  }

  /// `Download Error`
  String get action_download_on_error {
    return Intl.message(
      'Download Error',
      name: 'action_download_on_error',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_list_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_list_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `No data available at this time`
  String get label_there_is_no_data_at_present {
    return Intl.message(
      'No data available at this time',
      name: 'label_there_is_no_data_at_present',
      desc: '',
      args: [],
    );
  }

  /// `Download error, click retry`
  String get action_download_on_error_click_retry {
    return Intl.message(
      'Download error, click retry',
      name: 'action_download_on_error_click_retry',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get data`
  String get label_data_acquisition_failed {
    return Intl.message(
      'Failed to get data',
      name: 'label_data_acquisition_failed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid data`
  String get label_invalid_data {
    return Intl.message(
      'Invalid data',
      name: 'label_invalid_data',
      desc: '',
      args: [],
    );
  }

  /// `Data is null`
  String get label_data_is_null {
    return Intl.message(
      'Data is null',
      name: 'label_data_is_null',
      desc: '',
      args: [],
    );
  }

  /// `Unknown exception`
  String get label_unknown_exception {
    return Intl.message(
      'Unknown exception',
      name: 'label_unknown_exception',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_select_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_select_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get label_state_complete {
    return Intl.message(
      'Complete',
      name: 'label_state_complete',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get label_state_completed {
    return Intl.message(
      'Completed',
      name: 'label_state_completed',
      desc: '',
      args: [],
    );
  }

  /// `Undone`
  String get label_state_undone {
    return Intl.message(
      'Undone',
      name: 'label_state_undone',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get label_state_selected {
    return Intl.message(
      'Selected',
      name: 'label_state_selected',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get label_state_not_selected {
    return Intl.message(
      'Not selected',
      name: 'label_state_not_selected',
      desc: '',
      args: [],
    );
  }

  /// `Your selection has not been confirmed, is the confirmation complete?`
  String get label_select_undone_prompt {
    return Intl.message(
      'Your selection has not been confirmed, is the confirmation complete?',
      name: 'label_select_undone_prompt',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_unit_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_unit_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Entries`
  String get label_unit_entries {
    return Intl.message(
      'Entries',
      name: 'label_unit_entries',
      desc: '',
      args: [],
    );
  }

  /// `%sEntries`
  String get label_unit_entries_x {
    return Intl.message(
      '%sEntries',
      name: 'label_unit_entries_x',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get label_unit_person {
    return Intl.message(
      'Person',
      name: 'label_unit_person',
      desc: '',
      args: [],
    );
  }

  /// `%sPerson`
  String get label_unit_person_x {
    return Intl.message(
      '%sPerson',
      name: 'label_unit_person_x',
      desc: '',
      args: [],
    );
  }

  /// `Strip`
  String get label_unit_strip {
    return Intl.message(
      'Strip',
      name: 'label_unit_strip',
      desc: '',
      args: [],
    );
  }

  /// `%sStrip`
  String get label_unit_strip_x {
    return Intl.message(
      '%sStrip',
      name: 'label_unit_strip_x',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get label_unit_car {
    return Intl.message(
      'Car',
      name: 'label_unit_car',
      desc: '',
      args: [],
    );
  }

  /// `%sCar`
  String get label_unit_car_x {
    return Intl.message(
      '%sCar',
      name: 'label_unit_car_x',
      desc: '',
      args: [],
    );
  }

  /// `Merely`
  String get label_unit_merely {
    return Intl.message(
      'Merely',
      name: 'label_unit_merely',
      desc: '',
      args: [],
    );
  }

  /// `%sMerely`
  String get label_unit_merely_x {
    return Intl.message(
      '%sMerely',
      name: 'label_unit_merely_x',
      desc: '',
      args: [],
    );
  }

  /// `Element`
  String get label_unit_element {
    return Intl.message(
      'Element',
      name: 'label_unit_element',
      desc: '',
      args: [],
    );
  }

  /// `%sElement`
  String get label_unit_element_x {
    return Intl.message(
      '%sElement',
      name: 'label_unit_element_x',
      desc: '',
      args: [],
    );
  }

  /// `Meter`
  String get label_unit_meter {
    return Intl.message(
      'Meter',
      name: 'label_unit_meter',
      desc: '',
      args: [],
    );
  }

  /// `%sMeter`
  String get label_unit_meter_x {
    return Intl.message(
      '%sMeter',
      name: 'label_unit_meter_x',
      desc: '',
      args: [],
    );
  }

  /// `Kilometer`
  String get label_unit_Kilometer {
    return Intl.message(
      'Kilometer',
      name: 'label_unit_Kilometer',
      desc: '',
      args: [],
    );
  }

  /// `%sKilometer`
  String get label_unit_Kilometer_x {
    return Intl.message(
      '%sKilometer',
      name: 'label_unit_Kilometer_x',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get label_unit_year {
    return Intl.message(
      'Year',
      name: 'label_unit_year',
      desc: '',
      args: [],
    );
  }

  /// `%sYear`
  String get label_unit_year_x {
    return Intl.message(
      '%sYear',
      name: 'label_unit_year_x',
      desc: '',
      args: [],
    );
  }

  /// `Mouth`
  String get label_unit_month {
    return Intl.message(
      'Mouth',
      name: 'label_unit_month',
      desc: '',
      args: [],
    );
  }

  /// `%sMouth`
  String get label_unit_month_x {
    return Intl.message(
      '%sMouth',
      name: 'label_unit_month_x',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get label_unit_day {
    return Intl.message(
      'Day',
      name: 'label_unit_day',
      desc: '',
      args: [],
    );
  }

  /// `%sDay`
  String get label_unit_day_x {
    return Intl.message(
      '%sDay',
      name: 'label_unit_day_x',
      desc: '',
      args: [],
    );
  }

  /// `%sYear%sMouth`
  String get label_unit_year_x_month_x {
    return Intl.message(
      '%sYear%sMouth',
      name: 'label_unit_year_x_month_x',
      desc: '',
      args: [],
    );
  }

  /// `%sYear%sMouth%sDay`
  String get label_unit_year_x_month_x_day_x {
    return Intl.message(
      '%sYear%sMouth%sDay',
      name: 'label_unit_year_x_month_x_day_x',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get label_unit_hour {
    return Intl.message(
      'Hour',
      name: 'label_unit_hour',
      desc: '',
      args: [],
    );
  }

  /// `%sHour`
  String get label_unit_hour_x {
    return Intl.message(
      '%sHour',
      name: 'label_unit_hour_x',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get label_unit_minute {
    return Intl.message(
      'Minute',
      name: 'label_unit_minute',
      desc: '',
      args: [],
    );
  }

  /// `%sMinute`
  String get label_unit_minute_x {
    return Intl.message(
      '%sMinute',
      name: 'label_unit_minute_x',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get label_unit_minute2 {
    return Intl.message(
      'Minute',
      name: 'label_unit_minute2',
      desc: '',
      args: [],
    );
  }

  /// `%sMinute`
  String get label_unit_minute2_x {
    return Intl.message(
      '%sMinute',
      name: 'label_unit_minute2_x',
      desc: '',
      args: [],
    );
  }

  /// `Second`
  String get label_unit_second {
    return Intl.message(
      'Second',
      name: 'label_unit_second',
      desc: '',
      args: [],
    );
  }

  /// `%sSecond`
  String get label_unit_second_x {
    return Intl.message(
      '%sSecond',
      name: 'label_unit_second_x',
      desc: '',
      args: [],
    );
  }

  /// `Millisecond`
  String get label_unit_millisecond {
    return Intl.message(
      'Millisecond',
      name: 'label_unit_millisecond',
      desc: '',
      args: [],
    );
  }

  /// `%sMillisecond`
  String get label_unit_millisecond_x {
    return Intl.message(
      '%sMillisecond',
      name: 'label_unit_millisecond_x',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get label_unit_day2 {
    return Intl.message(
      'Day',
      name: 'label_unit_day2',
      desc: '',
      args: [],
    );
  }

  /// `%sDay`
  String get label_unit_day2_x {
    return Intl.message(
      '%sDay',
      name: 'label_unit_day2_x',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get label_form_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'label_form_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get label_full_name {
    return Intl.message(
      'Name',
      name: 'label_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Name：%s`
  String get label_full_name_x {
    return Intl.message(
      'Name：%s',
      name: 'label_full_name_x',
      desc: '',
      args: [],
    );
  }

  /// `Telephone`
  String get label_tel {
    return Intl.message(
      'Telephone',
      name: 'label_tel',
      desc: '',
      args: [],
    );
  }

  /// `Telephone：%s`
  String get label_tel_x {
    return Intl.message(
      'Telephone：%s',
      name: 'label_tel_x',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get label_phone {
    return Intl.message(
      'Phone',
      name: 'label_phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone：%s`
  String get label_phone_x {
    return Intl.message(
      'Phone：%s',
      name: 'label_phone_x',
      desc: '',
      args: [],
    );
  }

  /// `Mailbox`
  String get label_mailbox {
    return Intl.message(
      'Mailbox',
      name: 'label_mailbox',
      desc: '',
      args: [],
    );
  }

  /// `Mailbox：%s`
  String get label_mailbox_x {
    return Intl.message(
      'Mailbox：%s',
      name: 'label_mailbox_x',
      desc: '',
      args: [],
    );
  }

  /// `Wechat`
  String get label_wechat {
    return Intl.message(
      'Wechat',
      name: 'label_wechat',
      desc: '',
      args: [],
    );
  }

  /// `Wechat：%s`
  String get label_wechat_x {
    return Intl.message(
      'Wechat：%s',
      name: 'label_wechat_x',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get label_address {
    return Intl.message(
      'Address',
      name: 'label_address',
      desc: '',
      args: [],
    );
  }

  /// `Address：%s`
  String get label_address_x {
    return Intl.message(
      'Address：%s',
      name: 'label_address_x',
      desc: '',
      args: [],
    );
  }

  /// `Job title`
  String get label_job_title {
    return Intl.message(
      'Job title',
      name: 'label_job_title',
      desc: '',
      args: [],
    );
  }

  /// `Job title：%s`
  String get label_job_title_x {
    return Intl.message(
      'Job title：%s',
      name: 'label_job_title_x',
      desc: '',
      args: [],
    );
  }

  /// `Id card`
  String get label_id_card {
    return Intl.message(
      'Id card',
      name: 'label_id_card',
      desc: '',
      args: [],
    );
  }

  /// `Id card：%s`
  String get label_id_card_x {
    return Intl.message(
      'Id card：%s',
      name: 'label_id_card_x',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get label_company {
    return Intl.message(
      'Company',
      name: 'label_company',
      desc: '',
      args: [],
    );
  }

  /// `Company：%s`
  String get label_company_x {
    return Intl.message(
      'Company：%s',
      name: 'label_company_x',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get app_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'app_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `We need to get location permissions to be able to access the location!`
  String get app_label_location_permission_hint {
    return Intl.message(
      'We need to get location permissions to be able to access the location!',
      name: 'app_label_location_permission_hint',
      desc: '',
      args: [],
    );
  }

  /// `Location permissions are required to use this feature, please grant permission!`
  String get app_label_location_permission_request_hint {
    return Intl.message(
      'Location permissions are required to use this feature, please grant permission!',
      name: 'app_label_location_permission_request_hint',
      desc: '',
      args: [],
    );
  }

  /// `You have not granted location permissions, this feature will not work!`
  String get app_label_location_permission_request_hint_denied {
    return Intl.message(
      'You have not granted location permissions, this feature will not work!',
      name: 'app_label_location_permission_request_hint_denied',
      desc: '',
      args: [],
    );
  }

  /// `Unknown file`
  String get app_label_unknown_file {
    return Intl.message(
      'Unknown file',
      name: 'app_label_unknown_file',
      desc: '',
      args: [],
    );
  }

  /// `Compressed file`
  String get app_label_compressed_file {
    return Intl.message(
      'Compressed file',
      name: 'app_label_compressed_file',
      desc: '',
      args: [],
    );
  }

  /// `Click preview`
  String get app_label_click_preview {
    return Intl.message(
      'Click preview',
      name: 'app_label_click_preview',
      desc: '',
      args: [],
    );
  }

  /// `Please wait for the download to complete`
  String get app_label_please_wait_for_the_download_to_complete {
    return Intl.message(
      'Please wait for the download to complete',
      name: 'app_label_please_wait_for_the_download_to_complete',
      desc: '',
      args: [],
    );
  }

  /// `The start time must be less than the end time`
  String get app_label_start_time_less_than_end_time {
    return Intl.message(
      'The start time must be less than the end time',
      name: 'app_label_start_time_less_than_end_time',
      desc: '',
      args: [],
    );
  }

  /// `The end time must be greater than the start time`
  String get app_label_end_time_more_than_the_start_time {
    return Intl.message(
      'The end time must be greater than the start time',
      name: 'app_label_end_time_more_than_the_start_time',
      desc: '',
      args: [],
    );
  }

  /// `Please choose`
  String get app_label_please_choose {
    return Intl.message(
      'Please choose',
      name: 'app_label_please_choose',
      desc: '',
      args: [],
    );
  }

  /// `Please input`
  String get app_label_please_input {
    return Intl.message(
      'Please input',
      name: 'app_label_please_input',
      desc: '',
      args: [],
    );
  }

  /// `Not completed`
  String get app_label_not_completed {
    return Intl.message(
      'Not completed',
      name: 'app_label_not_completed',
      desc: '',
      args: [],
    );
  }

  /// `Unfilled`
  String get app_label_unfilled {
    return Intl.message(
      'Unfilled',
      name: 'app_label_unfilled',
      desc: '',
      args: [],
    );
  }

  /// `Add attachments`
  String get app_label_add_attachments {
    return Intl.message(
      'Add attachments',
      name: 'app_label_add_attachments',
      desc: '',
      args: [],
    );
  }

  /// `Add details`
  String get app_label_add_add_details {
    return Intl.message(
      'Add details',
      name: 'app_label_add_add_details',
      desc: '',
      args: [],
    );
  }

  /// `No attachments`
  String get app_label_add_no_attachments {
    return Intl.message(
      'No attachments',
      name: 'app_label_add_no_attachments',
      desc: '',
      args: [],
    );
  }

  /// `Get attachments error`
  String get app_label_get_attachments_error {
    return Intl.message(
      'Get attachments error',
      name: 'app_label_get_attachments_error',
      desc: '',
      args: [],
    );
  }

  /// `Required information cannot be empty`
  String get app_label_required_information_cannot_be_empty {
    return Intl.message(
      'Required information cannot be empty',
      name: 'app_label_required_information_cannot_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get app_label_agree {
    return Intl.message(
      'Agree',
      name: 'app_label_agree',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get app_label_select_all {
    return Intl.message(
      'Select all',
      name: 'app_label_select_all',
      desc: '',
      args: [],
    );
  }

  /// `Unselect all`
  String get app_label_unselect_all {
    return Intl.message(
      'Unselect all',
      name: 'app_label_unselect_all',
      desc: '',
      args: [],
    );
  }

  /// `Pass`
  String get app_label_pass {
    return Intl.message(
      'Pass',
      name: 'app_label_pass',
      desc: '',
      args: [],
    );
  }

  /// `Refuse`
  String get app_label_refuse {
    return Intl.message(
      'Refuse',
      name: 'app_label_refuse',
      desc: '',
      args: [],
    );
  }

  /// `Remark`
  String get app_label_remark {
    return Intl.message(
      'Remark',
      name: 'app_label_remark',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get app_label_not {
    return Intl.message(
      'None',
      name: 'app_label_not',
      desc: '',
      args: [],
    );
  }

  /// `Yuan`
  String get app_label_yuan {
    return Intl.message(
      'Yuan',
      name: 'app_label_yuan',
      desc: '',
      args: [],
    );
  }

  /// `Department：%1$s`
  String get app_label_department_x {
    return Intl.message(
      'Department：%1\$s',
      name: 'app_label_department_x',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get app_label_department {
    return Intl.message(
      'Department',
      name: 'app_label_department',
      desc: '',
      args: [],
    );
  }

  /// `Post：%1$s`
  String get app_label_post_x {
    return Intl.message(
      'Post：%1\$s',
      name: 'app_label_post_x',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get app_label_post {
    return Intl.message(
      'Post',
      name: 'app_label_post',
      desc: '',
      args: [],
    );
  }

  /// `am`
  String get app_label_am {
    return Intl.message(
      'am',
      name: 'app_label_am',
      desc: '',
      args: [],
    );
  }

  /// `pm`
  String get app_label_pm {
    return Intl.message(
      'pm',
      name: 'app_label_pm',
      desc: '',
      args: [],
    );
  }

  /// `whole day`
  String get app_label_am_pm_full {
    return Intl.message(
      'whole day',
      name: 'app_label_am_pm_full',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get app_label_am_pm_error {
    return Intl.message(
      'error',
      name: 'app_label_am_pm_error',
      desc: '',
      args: [],
    );
  }

  /// `No location information obtained`
  String get app_label_no_location_information {
    return Intl.message(
      'No location information obtained',
      name: 'app_label_no_location_information',
      desc: '',
      args: [],
    );
  }

  /// `Please add attachments`
  String get app_label_please_add_attachments {
    return Intl.message(
      'Please add attachments',
      name: 'app_label_please_add_attachments',
      desc: '',
      args: [],
    );
  }

  /// `Unsubmitted`
  String get app_label_un_submitted {
    return Intl.message(
      'Unsubmitted',
      name: 'app_label_un_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Starting time`
  String get app_label_starting_time {
    return Intl.message(
      'Starting time',
      name: 'app_label_starting_time',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get app_label_end_time {
    return Intl.message(
      'End time',
      name: 'app_label_end_time',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get app_label_attachment {
    return Intl.message(
      'Attachment',
      name: 'app_label_attachment',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get app_label_personal_information {
    return Intl.message(
      'Personal information',
      name: 'app_label_personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Logging in`
  String get app_label_logging_in {
    return Intl.message(
      'Logging in',
      name: 'app_label_logging_in',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get app_toast_login_login_successful {
    return Intl.message(
      'Login successful',
      name: 'app_toast_login_login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Login Failure`
  String get app_toast_login_login_failed {
    return Intl.message(
      'Login Failure',
      name: 'app_toast_login_login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Photograph`
  String get app_label_photograph {
    return Intl.message(
      'Photograph',
      name: 'app_label_photograph',
      desc: '',
      args: [],
    );
  }

  /// `Photo album`
  String get app_label_photo_album {
    return Intl.message(
      'Photo album',
      name: 'app_label_photo_album',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get user_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'user_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get user_label_setting {
    return Intl.message(
      'Setting',
      name: 'user_label_setting',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get user_label_login {
    return Intl.message(
      'Login',
      name: 'user_label_login',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get user_label_account {
    return Intl.message(
      'Account',
      name: 'user_label_account',
      desc: '',
      args: [],
    );
  }

  /// `Input account`
  String get user_label_input_account {
    return Intl.message(
      'Input account',
      name: 'user_label_input_account',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get user_label_password {
    return Intl.message(
      'Password',
      name: 'user_label_password',
      desc: '',
      args: [],
    );
  }

  /// `Please input password`
  String get user_label_input_password {
    return Intl.message(
      'Please input password',
      name: 'user_label_input_password',
      desc: '',
      args: [],
    );
  }

  /// `Save password`
  String get user_label_save_password {
    return Intl.message(
      'Save password',
      name: 'user_label_save_password',
      desc: '',
      args: [],
    );
  }

  /// `Auto login`
  String get user_label_auto_login {
    return Intl.message(
      'Auto login',
      name: 'user_label_auto_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get user_label_sign_out {
    return Intl.message(
      'Sign out',
      name: 'user_label_sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Logging in`
  String get user_label_logging_in {
    return Intl.message(
      'Logging in',
      name: 'user_label_logging_in',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get user_toast_login_login_successful {
    return Intl.message(
      'Login successful',
      name: 'user_toast_login_login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get user_toast_login_login_failed {
    return Intl.message(
      'Login failed',
      name: 'user_toast_login_login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get user_label_pet_name {
    return Intl.message(
      'Nickname',
      name: 'user_label_pet_name',
      desc: '',
      args: [],
    );
  }

  /// `Edit password`
  String get user_label_edit_pass_word {
    return Intl.message(
      'Edit password',
      name: 'user_label_edit_pass_word',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get user_label_old_password {
    return Intl.message(
      'Old password',
      name: 'user_label_old_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get user_label_new_password {
    return Intl.message(
      'New password',
      name: 'user_label_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Verify new password`
  String get user_label_verify_new_password {
    return Intl.message(
      'Verify new password',
      name: 'user_label_verify_new_password',
      desc: '',
      args: [],
    );
  }

  /// `The two new passwords do not match, please re-enter them`
  String get user_label_verify_new_password_error {
    return Intl.message(
      'The two new passwords do not match, please re-enter them',
      name: 'user_label_verify_new_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Cellphone`
  String get user_label_cell_phone {
    return Intl.message(
      'Cellphone',
      name: 'user_label_cell_phone',
      desc: '',
      args: [],
    );
  }

  /// `Basic privileges are not enabled, please grant them!`
  String get user_toast_base_permission {
    return Intl.message(
      'Basic privileges are not enabled, please grant them!',
      name: 'user_toast_base_permission',
      desc: '',
      args: [],
    );
  }

  /// `Basic permissions are not enabled, please manually go to Settings to enable permissions.`
  String get user_toast_base_permission_go_setting {
    return Intl.message(
      'Basic permissions are not enabled, please manually go to Settings to enable permissions.',
      name: 'user_toast_base_permission_go_setting',
      desc: '',
      args: [],
    );
  }

  /// `Click again to return to the desktop`
  String get user_toast_click_again_to_return_to_the_desktop {
    return Intl.message(
      'Click again to return to the desktop',
      name: 'user_toast_click_again_to_return_to_the_desktop',
      desc: '',
      args: [],
    );
  }

  /// `Data initialisation failed, please uninstall and reinstall this APP.`
  String get user_toast_data_init_error {
    return Intl.message(
      'Data initialisation failed, please uninstall and reinstall this APP.',
      name: 'user_toast_data_init_error',
      desc: '',
      args: [],
    );
  }

  /// `Please look forward to`
  String get user_label_stay_tuned {
    return Intl.message(
      'Please look forward to',
      name: 'user_label_stay_tuned',
      desc: '',
      args: [],
    );
  }

  /// `My QR code`
  String get user_label_my_qr_code {
    return Intl.message(
      'My QR code',
      name: 'user_label_my_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Checking for Updates`
  String get user_label_check_for_updates {
    return Intl.message(
      'Checking for Updates',
      name: 'user_label_check_for_updates',
      desc: '',
      args: [],
    );
  }

  /// `Getting updates now`
  String get user_label_check_for_updates_ing {
    return Intl.message(
      'Getting updates now',
      name: 'user_label_check_for_updates_ing',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get update information`
  String get user_label_check_for_updates_error {
    return Intl.message(
      'Failed to get update information',
      name: 'user_label_check_for_updates_error',
      desc: '',
      args: [],
    );
  }

  /// `List of departments`
  String get user_label_dept_list {
    return Intl.message(
      'List of departments',
      name: 'user_label_dept_list',
      desc: '',
      args: [],
    );
  }

  /// `List of users`
  String get user_label_user_info_list {
    return Intl.message(
      'List of users',
      name: 'user_label_user_info_list',
      desc: '',
      args: [],
    );
  }

  /// `%sPeople`
  String get user_label_x_people {
    return Intl.message(
      '%sPeople',
      name: 'user_label_x_people',
      desc: '',
      args: [],
    );
  }

  /// `No departmental information was found`
  String get user_label_dept_not_found {
    return Intl.message(
      'No departmental information was found',
      name: 'user_label_dept_not_found',
      desc: '',
      args: [],
    );
  }

  /// `No user information was found`
  String get user_label_user_info_not_found {
    return Intl.message(
      'No user information was found',
      name: 'user_label_user_info_not_found',
      desc: '',
      args: [],
    );
  }

  /// `All Departments`
  String get user_label_all_dept {
    return Intl.message(
      'All Departments',
      name: 'user_label_all_dept',
      desc: '',
      args: [],
    );
  }

  /// `Select%s`
  String get user_label_select_x {
    return Intl.message(
      'Select%s',
      name: 'user_label_select_x',
      desc: '',
      args: [],
    );
  }

  /// `Account cannot be empty`
  String get user_label_account_not_empty_hint {
    return Intl.message(
      'Account cannot be empty',
      name: 'user_label_account_not_empty_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get user_label_password_bot_empty_hint {
    return Intl.message(
      'Password cannot be empty',
      name: 'user_label_password_bot_empty_hint',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get dict_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'dict_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Dictionary name`
  String get dict_label_ley {
    return Intl.message(
      'Dictionary name',
      name: 'dict_label_ley',
      desc: '',
      args: [],
    );
  }

  /// `Dictionary value`
  String get dict_label_name {
    return Intl.message(
      'Dictionary value',
      name: 'dict_label_name',
      desc: '',
      args: [],
    );
  }

  /// `Child Node`
  String get dict_label_child_node {
    return Intl.message(
      'Child Node',
      name: 'dict_label_child_node',
      desc: '',
      args: [],
    );
  }

  /// `Dictionary details`
  String get dict_label_details {
    return Intl.message(
      'Dictionary details',
      name: 'dict_label_details',
      desc: '',
      args: [],
    );
  }

  /// `System dictionaries are not allowed to be edited`
  String get dict_label_system_dict_edit_hint {
    return Intl.message(
      'System dictionaries are not allowed to be edited',
      name: 'dict_label_system_dict_edit_hint',
      desc: '',
      args: [],
    );
  }

  /// `System dictionaries are not allowed to be edited`
  String get dict_label_system_dict_remove_hint {
    return Intl.message(
      'System dictionaries are not allowed to be edited',
      name: 'dict_label_system_dict_remove_hint',
      desc: '',
      args: [],
    );
  }

  /// `-----------------------------`
  String get main_divide_text {
    return Intl.message(
      '-----------------------------',
      name: 'main_divide_text',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get main_label_report {
    return Intl.message(
      'Report',
      name: 'main_label_report',
      desc: '',
      args: [],
    );
  }

  /// `Alarm`
  String get main_label_alarm {
    return Intl.message(
      'Alarm',
      name: 'main_label_alarm',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get main_label_setting {
    return Intl.message(
      'Setting',
      name: 'main_label_setting',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get main_label_my {
    return Intl.message(
      'My',
      name: 'main_label_my',
      desc: '',
      args: [],
    );
  }

  /// `Accelerometer`
  String get main_label_accelerometer {
    return Intl.message(
      'Accelerometer',
      name: 'main_label_accelerometer',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get main_label_pressure {
    return Intl.message(
      'Pressure',
      name: 'main_label_pressure',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get main_label_temperature {
    return Intl.message(
      'Temperature',
      name: 'main_label_temperature',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get main_label_humidity {
    return Intl.message(
      'Humidity',
      name: 'main_label_humidity',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get main_label_sound {
    return Intl.message(
      'Sound',
      name: 'main_label_sound',
      desc: '',
      args: [],
    );
  }

  /// `x axis`
  String get main_label_x_axis {
    return Intl.message(
      'x axis',
      name: 'main_label_x_axis',
      desc: '',
      args: [],
    );
  }

  /// `y axis`
  String get main_label_y_axis {
    return Intl.message(
      'y axis',
      name: 'main_label_y_axis',
      desc: '',
      args: [],
    );
  }

  /// `z axis`
  String get main_label_z_axis {
    return Intl.message(
      'z axis',
      name: 'main_label_z_axis',
      desc: '',
      args: [],
    );
  }

  /// `p1`
  String get main_label_p_1 {
    return Intl.message(
      'p1',
      name: 'main_label_p_1',
      desc: '',
      args: [],
    );
  }

  /// `p2`
  String get main_label_p_2 {
    return Intl.message(
      'p2',
      name: 'main_label_p_2',
      desc: '',
      args: [],
    );
  }

  /// `p3`
  String get main_label_p_3 {
    return Intl.message(
      'p3',
      name: 'main_label_p_3',
      desc: '',
      args: [],
    );
  }

  /// `p4`
  String get main_label_p_4 {
    return Intl.message(
      'p4',
      name: 'main_label_p_4',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get main_label_alarm_open {
    return Intl.message(
      'Open',
      name: 'main_label_alarm_open',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get main_label_alarm_close {
    return Intl.message(
      'Close',
      name: 'main_label_alarm_close',
      desc: '',
      args: [],
    );
  }

  /// `Reboot`
  String get main_label_reboot_dev {
    return Intl.message(
      'Reboot',
      name: 'main_label_reboot_dev',
      desc: '',
      args: [],
    );
  }

  /// `Switch language`
  String get main_label_language_switching {
    return Intl.message(
      'Switch language',
      name: 'main_label_language_switching',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get main_label_language_chinese {
    return Intl.message(
      'Chinese',
      name: 'main_label_language_chinese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get main_label_language_english {
    return Intl.message(
      'English',
      name: 'main_label_language_english',
      desc: '',
      args: [],
    );
  }

  /// `No signature`
  String get main_label_signature_no_setting {
    return Intl.message(
      'No signature',
      name: 'main_label_signature_no_setting',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
