Maximap is a replacement resource for MTA's F11 map. The normal F11 map lacks functionality for scripters, and this resource is made to change that.

Set of features:

- Events on map show and hide
- Possibility to change the background image to another. You can for instance replace the normal map with a top-down view of your custom Deathmatch map, so people can actually see where they're going to.
- Ability to set movement speed, color, zoom, maximum zoom, minimum zoom and zoom factor with export functions
- Smoothened control, meaning pressing zoom will slowly zoom in, instead of a lot on 1 press
- Functions that can directly calculate positions between map and world, so you don't need to calculate it yourself
- It being a script, and therefore easier to edit (if necessary) than the MTA source

To see several of these features in action, you might also want to download "maximap_examples". This resource includes a small set of features to show what you can do with Maximap's export functions. For more info about this resource, visit the maximap_examples download page.

--------------------------------------------------------------------------------

Exported functions:

bool isPlayerMapVisible()

	Returns true if the map is visible to the local player, false otherwise.

int,int,int,int getPlayerMapBoundingBox()

	Returns the screen positions of the upper-left part of the map and the lower-right part of the map.

string getPlayerMapImage()

	Returns the image currently used in the maximap

bool setPlayerMapVisible(bool visible)

	Sets the visible when true provided, invisible when false is provided. Returns true if successful, false if wrong parameters have been passed.

int,int getMapFromWorldPosition(float worldX, float worldY)

	Returns the absolute screen position on the map of the given world position. Useful for drawing stuff on the map.

int,int getWorldFromMapPosition(float mapX, float mapY)

	Returns the world X and Y position of the given position on the screen.

bool setPlayerMapImage(string image, float minX, float minY, float maxX, float maxY)

	Sets the map image to the defined one. minX and minY must be defined to give the most north-west point of the map and maxX and maxY for the most south-east point. This is necessary for positioning of blips and radarareas, as well as all of the export functions which use these positions, to work correctly.

bool setPlayerMapColor(int red, int green, int blue, int alpha)

	Changes the map color. Can be useful to script a flashing map or to change the alpha of the map.

int,int,int,int getPlayerMapColor()

	Returns the map color in red, green, blue, alpha.

float getPlayerMapMovementSpeed()

	Returns the speed at which the player can move the map while zoomed in.

bool setPlayerMapMovementSpeed(float speed)

	Sets the speed at which the player can move the map while zoomed in.

float getPlayerZoomFactor()

	Returns how far the player has zoomed into the map.

bool setPlayerZoomFactor(float factor)

	Sets how far the player has zoomed into the map.

float getPlayerZoomRate()

	Returns how much the zoom factor changes per frame while either the zoom in or out buttons have been pressed.

bool setPlayerZoomRate(float rate)

	Sets how much the zoom factor changes per frame while either the zoom in or out buttons have been pressed.

float getPlayerMinZoomLimit()

	Returns how far the player can zoom out of the map.

bool setPlayerMinZoomLimit(float minLimit)

	Sets how far the player can zoom out of the map.

float getPlayerMaxZoomLimit()

	Returns how far the player can zoom into the map.

bool setPlayerMaxZoomLimit(float maxLimit)

	Sets how far the player can zoom into the map.

bool setBlipShowingOnMaximap(element blip, bool showing)

	Sets wether the blip should be visible on the maximap or not.

bool setBlipShowingOnMaximap(element blip, bool showing)

	Returns wether the blip is visible on the maximap or not.

Events:

onClientPlayerMapShow [bool toggledByScript]

	Triggers when the player map shows up. Canceling hides the map again, unless toggled by script, in which case toggledByScript returns true.

onClientPlayerMapHide [bool toggledByScript]

	Triggers when the player map is hidden. Canceling shows the map again, unless toggled by script, in which case toggledByScript returns true.