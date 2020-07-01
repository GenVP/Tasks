﻿
Процедура ПередЗаписью(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	ЗаполнитьТекстСодержанияСтарое(Отказ);

КонецПроцедуры

Процедура ЗаполнитьТекстСодержанияСтарое(Отказ)
	
	Если ЭтоНовый() Тогда
		Возврат;
	Конецесли;
	
	Если СокрЛП(Ссылка.ТекстСодержания) = СокрЛП(ТекстСодержания) Тогда
		Возврат;
	Конецесли;
	
	пТекстСодержанияСтарое =  
		"----------------------РАНЕЕ-----"+ТекущаяДатаСеанса()+"--------------------"
		+ Символы.ПС
		+ ТекстСодержания
		+ Символы.ПС
		+ ТекстСодержанияСтарое
		;
		
	ТекстСодержанияСтарое = пТекстСодержанияСтарое;
	
КонецПроцедуры 