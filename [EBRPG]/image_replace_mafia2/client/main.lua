local car = {
	"vehiclegrunge256",
}

function replaceTexture(textureName, imgPath)
	local textureReplaceShader = dxCreateShader("client/shaders/texture_replace.fx", 0, 0, false, "world")
	local texture = dxCreateTexture(imgPath .. textureName .. ".png")
	dxSetShaderValue(textureReplaceShader, "gTexture", texture)
	engineApplyShaderToWorldTexture(textureReplaceShader, textureName)
end

function replaceTexture2(textureName, imgPath)
	local textureReplaceShader = dxCreateShader("client/shaders/texture_replace.fx", 0, 0, false, "vehicle")
	local texture = dxCreateTexture(imgPath .. textureName .. ".png")
	dxSetShaderValue(textureReplaceShader, "gTexture", texture)
	engineApplyShaderToWorldTexture(textureReplaceShader, textureName)
end

function replaceTextures()
	for i, textureName in ipairs(car) do
		replaceTexture2(textureName, "client/img/")
	end
end

addEventHandler("onClientResourceStart", resourceRoot, replaceTextures)