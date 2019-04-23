;(function($, window){
	/**
	 * Cookie plugin
	 *
	 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
	 * Dual licensed under the MIT and GPL licenses:
	 * http://www.opensource.org/licenses/mit-license.php
	 * http://www.gnu.org/licenses/gpl.html
	 *
	 */
	/**
	 * Create a cookie with the given name and value and other optional parameters.
	 *
	 * @example $.cookie('the_cookie', 'the_value');
	 * @desc Set the value of a cookie.
	 * @example $.cookie('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
	 * @desc Create a cookie with all available options.
	 * @example $.cookie('the_cookie', 'the_value');
	 * @desc Create a session cookie.
	 * @example $.cookie('the_cookie', null);
	 * @desc Delete a cookie by passing null as value. Keep in mind that you have to use the same path and domain
	 *       used when the cookie was set.
	 *
	 * @param String name The name of the cookie.
	 * @param String value The value of the cookie.
	 * @param Object options An object literal containing key/value pairs to provide optional cookie attributes.
	 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object.
	 *                             If a negative value is specified (e.g. a date in the past), the cookie will be deleted.
	 *                             If set to null or omitted, the cookie will be a session cookie and will not be retained
	 *                             when the the browser exits.
	 * @option String path The value of the path atribute of the cookie (default: path of page that created the cookie).
	 * @option String domain The value of the domain attribute of the cookie (default: domain of page that created the cookie).
	 * @option Boolean secure If true, the secure attribute of the cookie will be set and the cookie transmission will
	 *                        require a secure protocol (like HTTPS).
	 * @type undefined
	 *
	 * @name $.cookie
	 * @cat Plugins/Cookie
	 * @author Klaus Hartl/klaus.hartl@stilbuero.de
	 */

	/**
	 * Get the value of a cookie with the given name.
	 *
	 * @example $.cookie('the_cookie');
	 * @desc Get the value of a cookie.
	 *
	 * @param String name The name of the cookie.
	 * @return The value of the cookie.
	 * @type String
	 *
	 * @name $.cookie
	 * @cat Plugins/Cookie
	 * @author Klaus Hartl/klaus.hartl@stilbuero.de
	 */
	$.cookie = function(name, value, options) {
		if (typeof value != 'undefined') { // name and value given, set cookie
			options = options || {};
			if (value === null) {
				value = '';
				options = $.extend({}, options); // clone object since it's unexpected behavior if the expired property were changed
				options.expires = -1;
			}
			var expires = '';
			if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
				var date;
				if (typeof options.expires == 'number') {
					date = new Date();
					date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
				} else {
					date = options.expires;
				}
				expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
			}
			// NOTE Needed to parenthesize options.path and options.domain
			// in the following expressions, otherwise they evaluate to undefined
			// in the packed version for some reason...
			var path = options.path ? '; path=' + (options.path) : '';
			var domain = options.domain ? '; domain=' + (options.domain) : '';
			var secure = options.secure ? '; secure' : '';
			document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
		} else { // only name given, get cookie
			var cookieValue = null;
			if (document.cookie && document.cookie != '') {
				var cookies = document.cookie.split(';');
				for (var i = 0; i < cookies.length; i++) {
					var cookie = jQuery.trim(cookies[i]);
					// Does this cookie string begin with the name we want?
					if (cookie.substring(0, name.length + 1) == (name + '=')) {
						cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
						break;
					}
				}
			}
			return cookieValue;
		}
	};


	/**
	 * 鍏ㄩ€夊弽閫夌粍浠�
	 * @param {Object} options 閰嶇疆
	 * @returns {selectCheckBox}
	 * @example
	 * new selectCheckBox({
	 * 		control : '.checkbox-all', 	// 鍏ㄩ€夋垨鑰呭弽閫夌殑checkbox
	 * 		queue	: '.checkbox-list', // 琚€夋嫨鐨刢heckbox鍒楅槦
	 * 		singleSelection : function (element) {},  // 鍗曚釜琚€変腑鍥炶皟
	 * 		singleCancelled : function (element) {},  // 鍗曚釜琚彇娑堝洖璋�
	 * 		allSelected 	: function () {}, // 鍏ㄩ儴閫変腑鍥炶皟
	 * 		allCancelled 	: function () {}, // 鍏ㄩ儴鍙栨秷鍥炶皟
	 * });
	 */
	var selectCheckBox = function(options) {
		var me = this,
			options  = options || {},
			defaults = {
				// selector 鍏ㄩ€夌殑鍏冪礌
				control : null

				// selector 琚€夋嫨鐨勫垪闃�
				,queue : null

				// 浠ヤ笅鏄洖璋冩柟娉曪紝鍏朵腑鍐呭瀵硅薄 this 鎸囧悜 {selectCheckBox}
				// 鍒楅槦涓崟涓猧tem琚€夋嫨鍥炶皟锛宔lement 褰撳墠琚搷浣滅殑item
				,singleSelection	: function(element) {}

				// 鍒楅槦涓崟涓猧tem琚彇娑堥€変腑鍥炶皟锛宔lement 褰撳墠琚搷浣滅殑item
				,singleCancelled	: function(element) {}

				// 鎵€鏈夊垪闃熻閫変腑鍥炶皟
				,allSelected		: function() {}

				// 鎵€鏈夊垪闃熻鍙栨秷閫夋嫨鍥炶皟
				,allCancelled	: function() {}
			};

		// 閰嶇疆
		me.settings = $.extend({}, defaults, options);

		// 瀵硅薄
		me.settings.control = typeof me.settings.control === "string" ? $(me.settings.control) : me.settings.control;
		me.settings.queue	= typeof me.settings.queue === "string" ? $(me.settings.queue) : me.settings.queue;

		// 褰撳墠宸查€変腑鏁�
		me.checkedTotal = 0;

		// 鍒濆鍖�
		me.init();
		return me;
	};

	selectCheckBox.prototype = {

		/**
		 * 鍒濆鍖�
		 * @returns {selectCheckBox}
		 */
		init: function() {
			var me = this;

			// 缁戝畾鎺у埗閫夋嫨浜嬩欢
			me.settings.control.data('checkbox_control', true).each(function(){
				var $this = $(this);
				$this.on('click', function(){
					if ($this.prop('checked')) {
						me.settings.queue.prop('checked', true);
						me.checkedTotal		= me.settings.queue.length;
					} else {
						me.settings.queue.prop('checked', false);
						me.checkedTotal		= 0;
					}
					me.indeterminate();
				});
			});

			// 缁戝畾鍒楅槦閫夋嫨浜嬩欢
			me.settings.queue.each(function() {
				var $this = $(this);

				// 榛樿閫変腑椤�
				if (this.checked) {
					me.checkedTotal++;
					me.indeterminate();
				}

				// 閫夋嫨浜嬩欢
				$this.on('click', function(){
					if ($this.prop('checked')) {
						if (typeof me.settings.singleSelection === "function") {
							me.settings.singleSelection.call(me, this);
						}
						me.checkedTotal++;
					} else {
						if (typeof me.settings.singleCancelled === "function") {
							me.settings.singleCancelled.call(me, this);
						}
						me.checkedTotal--;
					}
					me.indeterminate();
				});
			});
			return me;
		},


		/**
		 * 鎺у埗鍣ㄧ殑鐘舵€佽缃�
		 * @returns {selectCheckBox}
		 */
		indeterminate: function() {
			var me = this;
			if (me.checkedTotal === me.settings.queue.length) {
				me.settings.control.prop('checked', true);
				me.settings.control.each(function(){
					this.indeterminate = false;
				});
				if (typeof me.settings.allSelected === "function") {
					me.settings.allSelected.call(me);
				}
			} else if (me.checkedTotal) {
				me.settings.control.prop('checked', false);
				me.settings.control.each(function(){
					this.indeterminate = true;
				});
			} else {
				me.settings.control.prop('checked', false);
				me.settings.control.each(function(){
					this.indeterminate = false;
				});
				if (typeof me.settings.allCancelled === "function") {
					me.settings.allCancelled.call(me);
				}
			}
			return me;
		},

		/**
		 * 鑾峰彇褰撳墠鍒楅槦閫変腑鐘舵€侊紝濡傛灉鏈夐€変腑鍒欒繑鍥瀟rue锛屽惁鍒欒繑鍥瀎alse
		 * @param {Boolean} entirely 鍒楅槦鍙湁鍦ㄥ叏閮ㄩ€変腑鏃舵墠浼氳繑鍥瀎alse
		 * @returns {boolean}
		 */
		getStatus: function(entirely) {
			entirely = typeof entirely === "boolean" ? entirely : false;
			if (entirely && this.checkedTotal === this.settings.queue.length) {
				return true;
			} else if (false === entirely && this.checkedTotal) {
				return true;
			}
			return false;
		},


		/**
		 * 鑾峰彇褰撳墠鍒楅槦閫変腑椤圭殑灞炴€�
		 * @param {String} type 瑕佽幏寰楃殑閫変腑椤圭殑灞炴€э紝榛樿value灞炴€э紝elements涓鸿幏鍙栧璞℃湰韬紝鍏跺畠涓鸿幏鍙栧畾涔夊睘鎬�
		 * @returns {Array}
		 */
		getChecked: function(type) {
			var type = type || 'value',
				value = [],
				me = this;

			me.settings.queue.each(function(){
				if (false === this.checked) {
					return true;
				}
				switch (type) {
					// 鍊�
					case 'value' :
						value.push(this.value);
						break;
					// 瀵硅薄
					case 'elements' :
						value.push(this);
						break;
					// 鑷畾涔夊睘鎬�
					default : value.push(this.getAttribute(type));
				}
			});
			return value;
		}
	};

	/**
	 * 鍏ㄩ€夊弽閫塲Query鎵╁睍
	 * @param {Object} options 閰嶇疆锛岃鍙傝€� selectCheckBox 璇存槑
	 * @returns {selectCheckBox}
	 */
	$.fn.selectCheckBox = function(options) {
		options.control = $(this);
		return new selectCheckBox(options);
	};


	/**
	 * 鑾峰彇鍔熻兘灞炴€у€�
	 * @param {String} role 鍚嶇О
	 * @returns {String}
	 */
	$.fn.getRoleValue = function(name) {
		return $(this).attr('role-' + name) || '';
	};


	/**
	 * 鑾峰彇DATA灞炴€у€�
	 * @param {String} role 鍚嶇О
	 * @returns {String}
	 */
	$.fn.getDataValue = function(name) {
		return $(this).attr('data-' + name) || '';
	};

	/**
	 * 鑾峰彇Role瀵硅薄
	 * @param {String} role 鍚嶇О
	 * @returns {$.fn}
	 */
	$.fn.getRole = function(name) {
		return $(this).find("[role='"+ name +"']");
	};

	/**
	 * 鑾峰彇NAME瀵硅薄
	 */
	$.fn.getName = function(name) {
		return $(this).find("[name='"+ name +"']");
	};

	/**
	 * 鑾峰彇鏈嶅姟鍣ㄨ繑鍥炵殑閿欒瀛楁
	 * @param {String} string 瑕佽В鏋愮殑瀛楃涓层€傚锛歠ield:name锛屽垯杩斿洖name
	 * @returns {String}
	 */
	$.getField = function(string) {
		if (!string) return '';
		if (string.indexOf('field:') === -1) return '';
		return string.replace('field:', '');
	};

	/**
	 * 閾炬帴璺宠浆
	 * @param {String} string 闇€瑕佽烦杞殑閾炬帴
	 * @returns {Void}
	 */
	$.gotoURL = function(url) {
		self.location.href = url;
	};

	/**
	 * 澶勭悊鏈嶅姟鍣ㄨ繑鍥炵殑閿欒娑堟伅骞舵墽琛屽搴斿嚭閿欏瓧娈电劍鐐�
	 * @param {Object} data 鏈嶅姟鍣ㄨ繑鍥炵殑閿欒鏁版嵁
	 * @return {$.fn}
	 */
	$.fn.parseFormError = function(data) {
		var $this = $(this), field = $.getField(data.code);
		if (field.length) {
			var $field = $this.getName(field);
			if ($field.length) $field[0].focus();
			return this;
		}
		return this;
	};

	/**
	 * 澶勭悊杩斿洖锛屾槸鎸囬€氳繃AJAX杩斿洖鐨凧SON淇℃伅
	 * @param {json} json AJAX杩斿洖鐨凧SON鏁版嵁
	 * @param {function} 澶勭悊瀹屾垚鍏叡閿欒鍚庣殑鍥炶皟鍑芥暟锛屽弬鏁�1浠ｈ〃杩斿洖鐨凧SON鏁版嵁
	 */
	$.parseCode = function(json, callback) {
		if (JSON.stringify(json) === '{}') {
			$.dialog.alert('鏈煡閿欒锛�');
			return false;
		}

		// 闇€瑕佽烦杞�
		switch (parseInt(json.code)) {
			// 鐩存帴璺宠浆
			case 9999 :
				top.location.href = json.url;
				return false;

			// 寮瑰嚭鎴愬姛鐨勮鍛婃鍚庤烦杞�
			case 9998 :
				$.dialog.alert(json.info, function(){
					top.location.href = json.url;
				}, 'succeed');
				return false;

			// 寮瑰嚭澶辫触鐨勮鍛婃鍚庤烦杞�
			case 9997 :
				$.dialog.alert(json.info, function(){
					top.location.href = json.url;
				});
				return false;
		}

		// 鍏朵粬閿欒鐩存帴鍥炶皟
		if (typeof callback === 'function') {
			callback.call(this, json);
		}
	};

	/**
	 * POST鎻愪氦
	 * @param {String} actionURL AJAX璇锋眰鍦板潃
	 * @param {Object} options 璇锋眰鍙傛暟
	 * @param {Function} success 鎴愬姛鍥炶皟鍑芥暟
	 * @param {Function} error 澶辫触鍥炶皟鍑芥暟
	 */
	$.postInfo = function(actionURL, options, success, error, complete) {
		var actionURL 	= actionURL || document.URL,
			options		= options || {},
			success		= success || function() {},
			error		= error || function() {},
			complete	= complete || function() {};

		$.post(actionURL, options, function(data) {
			data = typeof data !== "object" ?  {} : data;
			if (data.status) {
				if (typeof success === "function") success(data);
			} else {
				$.parseCode(data, function(){
					if (typeof error === "function") error(data);
				});
			}
			if (typeof complete === "function") complete(data);
		})
	};

	/**
	 * GET鎻愪氦
	 * @param {String} actionURL AJAX璇锋眰鍦板潃
	 * @param {Function} success 鎴愬姛鍥炶皟鍑芥暟
	 * @param {Function} error 澶辫触鍥炶皟鍑芥暟
	 * @param {Function} complete 鎵ц瀹屾垚鍥炶皟
	 */
	$.getInfo = function(actionURL, success, error, complete) {
		var actionURL	= actionURL || document.URL,
			success		= success || function() {},
			error		= error || function() {},
			complete	= complete || function() {};

		if (actionURL.indexOf('?') === -1) {
			actionURL += '?___t=' + Math.random();
		} else {
			actionURL += '&___t=' + Math.random();
		}

		$.get(actionURL, function(data) {
			data = typeof data !== "object" ?  {} : data;
			if (data.status) {
				if (typeof success === "function") success(data);
			} else {
				$.parseCode(data, function(){
					if (typeof error === "function") error(data);
				});
			}
			if (typeof complete === "function") complete(data);
		});
	};


	/**
	 * AJAX鎻愪氦琛ㄥ崟
	 * @param {Object} element 琛ㄥ崟瀵硅薄
	 * @param {Object} options
	 * 		@object {Function} before 鎻愪氦鍓嶇殑鍥炶皟鏂规硶锛岃繑鍥濬ALSE涓轰笉鎻愪氦
	 * 		@object {Function} success 鎻愪氦鎴愬姛鐨勫洖璋冩柟娉曪紝
	 * 		@object {Function} error 鎻愪氦澶辫触鐨勫洖璋冩柟娉�
	 * 		@object {Function} after 鎻愪氦瀹屾垚鐨勫洖璋冩柟娉�
	 * @returns {submitForm}
	 */
	var submitForm = function (element, options) {
		var defaults = {
			before 	: function() {},
			success	: function() {},
			error	: function() {},
			after	: function() {}
		};

		this.element	= element.removeAttr('onsubmit');
		this.settings	= $.extend({}, defaults, options || {});
		this.params		= {};
		this.init();
		return this;
	};
	submitForm.prototype = {
		// 鍒濆鍖�
		init: function() {
			var me = this;

			// 鎻愪氦鎸夐挳
			me.submitBtn = me.element.find("[type='submit']").prop('disabled', false);

			// 缁戝畾鎻愪氦浜嬩欢
			me.element.data('state', false).on('submit', function() {
				// 鍙傛暟搴忓垪鍖�
				me.params = me.element.serializeArray();

				// 鎻愪氦鍓嶅洖璋�
				if (typeof me.settings.before === "function" && false === me.settings.before.call(me)) {
					return false;
				}

				// 鎻愪氦鐘舵€�
				if (me.element.data('state') === true) return false;
				me.element.data('state', true);

				// 鎻愪氦
				var actionURL = me.element.attr('action') || document.URL;
				$.postInfo(actionURL, me.params, function(data) {
					if (typeof me.settings.success === "function") me.settings.success.call(me, data);
				}, function(data) {
					if (typeof me.settings.error === "function") me.settings.error.call(me, data);
				}, function(data) {
					me.element.data('state', false);
					me.submitBtn.prop('disabled', false);
					if (typeof me.settings.after === "function") me.settings.after.call(me, data);
				});

				return false;
			});
		}
	};

	/**
	 * AJAX鎻愪氦琛ㄥ崟
	 * @param options
	 * @returns {submitForm}
	 */
	$.fn.submitForm = function(options) {
		return new submitForm($(this), options);
	};

	/**
	 * 鍒囨崲楠岃瘉鐮�
	 */
	$.fn.changeVerify = function() {
		$(this).each(function(){
			var $this = $(this);
			$this.data('src', $this.attr('src'));
		});
		$(this).on('click', function(){
			var $this	= $(this),
				src		= $this.data('src');
			if (src.indexOf('?') !== -1) {
				src += '&___t=' + Math.random();
			} else {
				src += '?___t=' + Math.random();
			}
			$this.attr('src', src);
		});
		return this;
	};
})(jQuery, window);