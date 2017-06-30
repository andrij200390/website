<?php

namespace common\components\helpers;

/**
 * PriceHelper provides a set of static methods for working with everything that is related to 'price' entity.
 *
 * @author [SC]Smash3r <scsmash3r@gmail.com>
 *
 * @since 1.0
 */
class PriceHelper
{
    /**
     * Currencies that are available to operate with on the website itself.
     *
     * @var array
     */
    const AVAILABLE_CURRENCIES = [
      'UAH' => 'Hryvnia',
      'RUB' => 'Ruble',
      'USD' => 'Dollar',
      'EUR' => 'Euro',
    ];

    /**
     * Visual classes names for CSS purposes.
     *
     * @var array
     */
    const AVAILABLE_VISUALCLASS = [
      '0' => '',
      '1' => 'event__price--special decoration_2',
      '2' => 'event__price--discount decoration_3',
    ];

    /**
     * Visual classes names in human-readable format
     * Mainly used for dropdowns.
     *
     * @see self::AVAILABLE_VISUALCLASS for corresponding classes
     *
     * @var array
     */
    const AVAILABLE_VISUALCLASS_NAMES = [
      '0' => 'No style',
      '1' => 'Special (black)',
      '2' => 'Discount (red)',
    ];

    /**
     * Returns all available currencies in ISO 4217 format.
     *
     * @return array
     */
    public static function getPriceCurrenciesISO()
    {
        return array_keys(self::AVAILABLE_CURRENCIES);
    }

    /**
     * Returns all available currencies that we're using.
     *
     * @return array
     */
    public static function getPriceCurrenciesList()
    {
        return self::AVAILABLE_CURRENCIES;
    }

    /**
     * Returns all available visual classes.
     * This is used for assigning a class to an element for CSS visual purposes.
     *
     * @param int $key self::AVAILABLE_VISUALCLASS key to choose class from
     *
     * @return string
     */
    public static function getPriceVisualClass($key = 0)
    {
        $key = is_int($key) ? $key : 0;

        return self::AVAILABLE_VISUALCLASS[$key];
    }

    /**
     * Returns list of names, assigned to visual entities
     * This is used mainly for dropdowns or for human-readable format.
     *
     * @return array
     */
    public static function getPriceVisualList()
    {
        return self::AVAILABLE_VISUALCLASS_NAMES;
    }

    /**
     * Returns list of keys, assigned to visual entities
     * This is used mainly for checking in rules() section.
     *
     * @return array
     */
    public static function getPriceVisualListKeys()
    {
        return array_keys(self::AVAILABLE_VISUALCLASS_NAMES);
    }
}
