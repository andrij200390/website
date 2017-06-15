<?php
/**
 * Google forms article add modal
 * Modal related stuff: /js/jquery.easyModal.js
 */

use yii\widgets\ActiveForm;
use yii\helpers\Html;

$modal_id = 'googleforms_add_school';

echo Html::beginTag('div', [
		'id' => $modal_id,
		'class' => 'modal',
		'role' => 'dialog',
		'data-modal-width' => 760,
		'data-modal-height' => 500,
	]
);

echo Html::tag('div',

	// modal header
	Html::tag('div',
		Html::tag('span',
			Yii::t('app', 'Добавить школу'),
			['class' => 'modal__caption c-text--shadow']
		).
		// modal button close
		Html::button('<i class="zmdi zmdi-close"></i>',
			[
				'class' => 'c-button c-button--close modal-close',
				'title' => Yii::t('app', 'Close')
			]
		),
		['class' => 'modal__header modal__header--branded u-window-box--medium']
	).

	// modal body
	Html::tag('div',
		Html::tag('div',

			Html::tag('div', '', ['class' => 'clearfix']).

			// modal main body text
			'<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeARK9dHAvdHsaNT--kDeeBGohz6ueqSlsqx99DCg_YuGo-IQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Загрузка...</iframe>'.

			Html::tag('div', '', ['class' => 'clearfix']),

			['class' => 'modal__iframe']
		),
		['class' => 'modal__body']
	),

	['class' => 'modal__content']
);

echo Html::endTag('div');
?>
<script>
jQuery(document).ready(function () {
	modalInit();
});
</script>
