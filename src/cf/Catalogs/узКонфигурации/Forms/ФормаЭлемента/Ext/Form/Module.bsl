﻿
&НаКлиенте
Процедура ЭтоРасширениеПриИзменении(Элемент)
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//{[+] #198 milanse 31.05.2020
	УстановитьОтборСпискаРасширений(Объект.Ссылка);
	//}[+] #198 milanse 31.05.2020
	УстановитьВидимостьДоступность();
КонецПроцедуры

//{[+] #198 milanse 31.05.2020
&НаСервере
Процедура УстановитьОтборСпискаРасширений(СсылкаНаОсновнуюКонфигурацию)
	
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(Расширения,"РасширениеДляКонфигурации",СсылкаНаОсновнуюКонфигурацию);
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбораДинамическогоСписка(Расширения,"ЭтоРасширение",Истина);	
	
КонецПроцедуры
//}[+] #198 milanse 31.05.2020

&НаСервере
Процедура УстановитьВидимостьДоступность()
	Элементы.ГруппаНастройкиДляПолученияИзмененийИзХранилища.Видимость = Ложь;
	Элементы.ГруппаТиповаяВыгрузкаИзХранилища.Видимость = Ложь;
	Элементы.КаталогХранилищаАльтернатива.Видимость = Ложь;
	Элементы.ИспользоватьАльтернативнуюЗагрузкуДанныхИзХранилища.Видимость = Ложь;
	Элементы.КаталогДляВыгрузкиФайлаЛистаЗадач.Видимость = Ложь;
	// +++ 79Vlad  10.10.2018
	Элементы.ГруппаТиповаяВыгрузкаИзХранилища.Видимость = Ложь;
	Элементы.РазрешеныКомментарииБезЗадач.Видимость = Ложь;
	// --- 79Vlad  10.10.2018
	// +++ #124 79Vlad  10.10.2018
	Элементы.узФормироватьФайлСОтборомПоКонфигурации.Видимость = Ложь;
	// --- #124 79Vlad  10.10.2018 
	//+ #198 Иванов А.Б. 2020-05-23 
	Элементы.ИмяРасширения.Видимость = Ложь;	                              
	Элементы.ОсновнаяКонфигурация.Видимость = Ложь;
	Элементы.Расширения.Видимость = Ложь;
	//- #198 Иванов А.Б. 2020-05-23 
	
	
	Если Объект.ПолучатьИзмененияИзХранилища Тогда
		Элементы.ГруппаНастройкиДляПолученияИзмененийИзХранилища.Видимость = Истина;
		Элементы.ИспользоватьАльтернативнуюЗагрузкуДанныхИзХранилища.Видимость = Истина;	
		// +++ 79Vlad  19.12.2018
		Элементы.РазрешеныКомментарииБезЗадач.Видимость = Истина;
		// --- 79Vlad  19.12.2018		
		Если НЕ Объект.ИспользоватьАльтернативнуюЗагрузкуДанныхИзХранилища Тогда
			Элементы.ГруппаТиповаяВыгрузкаИзХранилища.Видимость = Истина;			
		Иначе		
			Элементы.КаталогХранилищаАльтернатива.Видимость = Истина;			
		Конецесли;
	Конецесли;
	
	//+ #198 Иванов А.Б. 2020-05-23 
	Если Объект.ЭтоРасширение Тогда
		Элементы.ИмяРасширения.Видимость = Истина;	                              
		Элементы.ОсновнаяКонфигурация.Видимость = Истина;		
	Иначе
		Элементы.Расширения.Видимость = Истина;
	Конецесли;
	//- #198 Иванов А.Б. 2020-05-23 
	
	//+ #206 Иванов А.Б. 2020-06-06 @milanse 
	Элементы.Расширения.ТолькоПросмотр = Ложь;
	Если НЕ ЗначениеЗаполнено(Объект.РасширениеДляКонфигурации) Тогда
		Элементы.Расширения.ТолькоПросмотр = Истина;
	Конецесли;
	//- #206 Иванов А.Б. 2020-06-06 @milanse 
	
	
	Если Объект.ФормироватьФайлЛистЗадачВКаталогеЛокальногоРепозитория Тогда
		Элементы.КаталогДляВыгрузкиФайлаЛистаЗадач.Видимость = Истина;		
		// +++ #124 79Vlad  10.10.2018
		Элементы.узФормироватьФайлСОтборомПоКонфигурации.Видимость = Истина;
		// --- #124 79Vlad  10.10.2018 		
	// +++ 79Vlad  18.12.2018
	//Исправлено: Не корректно отрабатывает видимость
		Элементы.ГруппаВыгрузкиФайлаЛистаЗадач.Видимость = Истина;
	Иначе
		Элементы.ГруппаВыгрузкиФайлаЛистаЗадач.Видимость = Ложь;		
	// --- 79Vlad  18.12.2018		
	Конецесли;
	
КонецПроцедуры 

&НаКлиенте
Процедура ПолучатьИзмененияИзХранилищаПриИзменении(Элемент)
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаКлиенте
Процедура Приложения1сНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	Оповещение = Новый ОписаниеОповещения("ОбработатьВыборПриложение1с",ЭтаФорма);
	
	НачатьПомещениеФайла(Оповещение,,, Истина, Новый УникальныйИдентификатор);
КонецПроцедуры

&НаКлиенте
Процедура ОбработатьВыборПриложение1с(РезультаВыбора, Адрес, ВыбранноеИмяФайла,ДополнительныеПараметры) Экспорт
	Если РезультаВыбора = Неопределено Тогда
		Возврат;
	Конецесли;
	
	Объект.Приложение1с = ВыбранноеИмяФайла;
КонецПроцедуры 

&НаКлиенте
Процедура КаталогТранзитнойБазыНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	
	ДиалогВыбораФайла.Заголовок = НСтр("ru = 'Выберите каталог транзитной базы'");
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	
	Оповещение = Новый ОписаниеОповещения("ОбработатьВыборКаталогаТранзитнойБазы",ЭтотОбъект);
	ДиалогВыбораФайла.Показать (Оповещение);

КонецПроцедуры

&НаКлиенте 
Процедура ОбработатьВыборКаталогаТранзитнойБазы(ВыбранныйКаталог, ДополнительныеПараметры) Экспорт 
	Если ВыбранныйКаталог = Неопределено Тогда
		Возврат;
	Конецесли;
	Объект.КаталогТранзитнойБазы = ВыбранныйКаталог[0];
КонецПроцедуры

&НаКлиенте
Процедура КаталогХранилищаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	
	ДиалогВыбораФайла.Заголовок = НСтр("ru = 'Выберите каталог хранилища'");
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	
	Оповещение = Новый ОписаниеОповещения("ОбработатьВыборКаталогаХранилища",ЭтотОбъект);
	ДиалогВыбораФайла.Показать (Оповещение);

КонецПроцедуры

&НаКлиенте 
Процедура ОбработатьВыборКаталогаХранилища(ВыбранныйКаталог, ДополнительныеПараметры) Экспорт 
	Если ВыбранныйКаталог = Неопределено Тогда
		Возврат;
	Конецесли;
	Объект.КаталогХранилища = ВыбранныйКаталог[0];
КонецПроцедуры

&НаКлиенте
Процедура КаталогДляЗагрузкиИзмененийИзХранилщаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	
	ДиалогВыбораФайла.Заголовок = НСтр("ru = 'Выберите каталог для загрузки изменений из хранилища'");
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	
	Оповещение = Новый ОписаниеОповещения("ОбработатьВыборКаталогДляЗагрузкиИзмененийИзХранилща",ЭтотОбъект);
	ДиалогВыбораФайла.Показать (Оповещение);
КонецПроцедуры

&НаКлиенте
Процедура КомандаСоздатьVBSФайлДляПланировщикаЗаданий(Команда)
	//Если НЕ ЗначениеЗаполнено(Объект.КаталогДляЗагрузкиИзмененийИзХранилща) Тогда
	//	Сообщение = Новый СообщениеПользователю;
	//	Сообщение.Текст = "Ошибка! Необходимо заполнить реквизит КаталогДляЗагрузкиИзмененийИзХранилща";
	//	Сообщение.Поле = "Объект.КаталогДляЗагрузкиИзмененийИзХранилща";
	//	Сообщение.Сообщить();
	//	Возврат;
	//Конецесли;
	//Если Объект.Ссылка.Пустая() Тогда
	//	Сообщение = Новый СообщениеПользователю;
	//	Сообщение.Текст = "Ошибка! необходиом сначала записать элемент";
	//	Сообщение.Сообщить();
	//	Возврат;
	//Конецесли;
	//
	//ТекстКоманды = ПолучитьТекстКомандыНаСервере();
	//VBSФайл = Новый ТекстовыйДокумент();
	//VBSФайл.УстановитьТекст(
	//"
	//|Set WshShell = CreateObject(""WScript.Shell"")
	//|
	//|TekDate = date
	//|TekTime = Time
	//|FileName = ""StorageHistory_"" & Replace(TekDate,""."","""") & ""_"" & Replace(TekTime,"":"","""") & "".mxl""
	// |
	//|WshShell.Run """ + ТекстКоманды + ",0,0 
	//|");
	//ИмяСкриптФайла = Объект.КаталогДляЗагрузкиИзмененийИзХранилща + "DumpStorage.vbs";
	//VBSФайл.Записать(ИмяСкриптФайла,КодировкаТекста.ANSI);
КонецПроцедуры

&НаСервере
Функция ПолучитьТекстКомандыНаСервере() 
	//ОбрОбъект = Обработки.узЗагрузкаИзмененийИзХранилища.Создать();
	//ОбрОбъект.Конфигурация =  Объект.Ссылка;
	//ФайлВыгрузкиИзменений = ""+Объект.КаталогДляЗагрузкиИзмененийИзХранилща + "\"" & FileName &";
	//РезультатФункции = ОбрОбъект.ПолучитьНастройкиЗапускаКонфигуратора(ФайлВыгрузкиИзменений);	
	//Возврат РезультатФункции.ТекстКоманды;
КонецФункции 

&НаКлиенте
Процедура ИспользоватьАльтернативнуюЗагрузкуДанныхИзХранилищаПриИзменении(Элемент)
	УстановитьВидимостьДоступность();
КонецПроцедуры

&НаКлиенте
Процедура КаталогДляВыгрузкиФайлаЛистаЗадачНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	
	ДиалогВыбораФайла.Заголовок = НСтр("ru = 'Выберите каталог для выгрузки файла листа задач'");
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	
	Оповещение = Новый ОписаниеОповещения("ОбработатьВыборКаталогаДляВыгрузкиФайлаЛистаЗадач",ЭтотОбъект);
	ДиалогВыбораФайла.Показать (Оповещение);
КонецПроцедуры

&НаКлиенте 
Процедура ОбработатьВыборКаталогаДляВыгрузкиФайлаЛистаЗадач(ВыбранныйКаталог, ДополнительныеПараметры) Экспорт 
	Если ВыбранныйКаталог = Неопределено Тогда
		Возврат;
	Конецесли;
	Объект.КаталогДляВыгрузкиФайлаЛистаЗадач = ВыбранныйКаталог[0];
КонецПроцедуры

&НаКлиенте
Процедура ФормироватьФайлЛистЗадачВКаталогеЛокальногоРепозиторияПриИзменении(Элемент)
	УстановитьВидимостьДоступность();
КонецПроцедуры

//{[+] #198 milanse 31.05.2020
&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	УстановитьОтборСпискаРасширений(ТекущийОбъект.Ссылка);
КонецПроцедуры
//}[+] #198 milanse 31.05.2020

