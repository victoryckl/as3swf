﻿package com.codeazur.as3swf.data.actions.swf4
{
	import com.codeazur.as3swf.data.actions.*;
	import com.codeazur.as3swf.data.SWFActionValue;
	import com.codeazur.as3swf.SWFData;
	
	public class ActionPush extends Action implements IAction
	{
		public var values:Vector.<SWFActionValue>;
		
		public function ActionPush(code:uint, length:uint) {
			super(code, length);
			values = new Vector.<SWFActionValue>();
		}
		
		override public function parse(data:SWFData):void {
			var endPosition:uint = data.position + _length;
			while (data.position != endPosition) {
				values.push(data.readACTIONVALUE());
			}
		}
		
		public function toString(indent:uint = 0):String {
			var str:String = "[ActionPush] "
			for (var i:uint = 0; i < values.length; i++) {
				str += ((i == 0) ? "" : ", ") + values[i];
			}
			return str;
		}
	}
}