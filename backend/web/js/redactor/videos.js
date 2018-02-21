if (!RedactorPlugins) var RedactorPlugins = {};
RedactorPlugins.videos = function()
{
	return {
			reUrlYoutube: /https?:\/\/(?:[0-9A-Z-]+\.)?(?:youtu\.be\/|youtube\.com\S*[^\w\-\s])([\w\-]{11})(?=[^\w\-]|$)(?![?=&+%\w.-]*(?:['"][^<>]*>|<\/a>))[?=&+%\w.-]*/ig,
			reUrlVimeo: /https?:\/\/(www\.)?vimeo.com\/(\d+)($|\/)/,
			getTemplate: function()
			{
				return String() + '<section id="redactor-modal-video-insert"><label>' + this.lang.get('video_html_code') + '</label><textarea id="redactor-insert-video-area" style="height: 160px;"></textarea></section>';
			},
			init: function()
			{
				var button = this.button.addAfter('image', 'video', this.lang.get('video'));
				this.button.addCallback(button, this.videos.show);
			},
			show: function()
			{
				this.modal.addTemplate('video', this.videos.getTemplate());

				this.modal.load('video', this.lang.get('video'), 700);
				this.modal.createCancelButton();

				var button = this.modal.createActionButton(this.lang.get('insert'));
				button.on('click', this.videos.insert);

				this.selection.save();
				this.modal.show();

				$('#redactor-insert-video-area').focus();

			},
			insert: function()
			{
				var data = $('#redactor-insert-video-area').val();

				if (!data.match(/<iframe|<video/gi))
				{
					data = this.clean.stripTags(data);

					// parse if it is link on youtube & vimeo
					var iframeStart = '<iframe style="width: 100%; height: 510px;" src="',
						iframeEnd = '" frameborder="0" allowfullscreen></iframe>';

					if (data.match(this.videos.reUrlYoutube))
					{
						data = data.replace(this.videos.reUrlYoutube, iframeStart + '//www.youtube.com/embed/$1' + iframeEnd);
					}
					else if (data.match(this.videos.reUrlVimeo))
					{
						data = data.replace(this.videos.reUrlVimeo, iframeStart + '//player.vimeo.com/video/$2' + iframeEnd);
					}
				}

				this.selection.restore();
				this.modal.close();

				var current = this.selection.getBlock() || this.selection.getCurrent();

				if (current) $(current).after(data);
				else
				{
					this.insert.html(data);
				}

				this.code.sync();
			}

		};
	}
