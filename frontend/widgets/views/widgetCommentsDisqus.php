<?php
use yii\helpers\Html;
echo Html::beginTag('div',[
    'id' => 'disqus_thread'
]);
echo Html::endTag('div');
?>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = '<?php echo $disqus_shortname; ?>'; // required: replace example with your forum shortname
    // The following are highly recommended additional parameters. Remove the slashes in front to use.
    // var disqus_identifier = 'unique_dynamic_id_1234';
    var disqus_url = '<?php echo $disqus_url ?>';
    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '<?php echo $scheme ?>://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>

