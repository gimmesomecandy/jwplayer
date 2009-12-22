/**
* This is a simple plugin that accepts specific flashvars.
**/
package {


import com.jeroenwijering.events.*;

import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.net.navigateToURL;
import flash.net.URLRequest;

public class Gimme extends MovieClip implements PluginInterface {


	/** Reference to the plugin flashvars. **/
	public var config:Object = {
		url: null,
		caption: null,
		icon: '0'
	};

	/** This code embeds the dock image. **/
	[Embed(source="./button-0.png")]
	private const Button0:Class;

	[Embed(source="./button-1.png")]
	private const Button1:Class;

	[Embed(source="./button-2.png")]
	private const Button2:Class;


	/** Reference to the button in the dock flashvars. **/
	private var button:MovieClip;
	/** Reference to the View of the player. **/
	private var view:AbstractView;
	private var icon:Class;

	/** Constructor **/
	public function Gimme():void {
	};

	/** 
	* This function is called when the dock button is clicked.
	**/
	private function clickHandler(evt:MouseEvent):void {
		var request:URLRequest = new URLRequest(config.url);
		navigateToURL(request);
	};


	/**
	* The initialize call is invoked by the player on startup.
	*
	* With player 4.5+, A 'dock' plugin is available. We check for this.
	* If available, the button is created.
	**/
	public function initializePlugin(vie:AbstractView):void {
		view = vie;
		if(view.getPlugin('dock')) {
			if (config.url != null) { /** only add to dock if we have a url **/

				if (config.caption == null) { /** set default caption when none provided **/
					if (config.icon == 0) config.caption = "donate";
					else config.caption = "gimme";
				}

				if (config.icon == 2) {
					button = view.getPlugin('dock').addButton(new Button2(), config.caption, clickHandler);
				} 
				else if (config.icon == 1) {
					button = view.getPlugin('dock').addButton(new Button1(), config.caption, clickHandler);
				}
				else {
					button = view.getPlugin('dock').addButton(new Button0(), config.caption, clickHandler);
				}

			}
		}
	};

};


}