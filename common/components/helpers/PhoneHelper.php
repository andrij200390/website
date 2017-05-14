<?php

namespace common\components\helpers;

/**
 * PhoneHelper provides a set of static methods for working with everything that is related to 'phone' entity.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class PhoneHelper
{
    /**
     * Regex for international phone format (validation)
     * @see: https://en.wikipedia.org/wiki/Telephone_number
     * 
     * @var string
     */
    const PHONE_INTERNATIONAL_REGEX = '/^\+([0-9]{1})\(?([0-9]{3})\)([0-9]{3})([-])([0-9]{2})([-])([0-9]{2,5})$/';

}
