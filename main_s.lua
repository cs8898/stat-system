addEventHandler ("onPlayerLogin",root,
	function()
		loadPedStats(  getPlayerAccount(source))
	end
)
addEventHandler ("onPlayerQuit",root,
	function()
		savePedStats(  getPlayerAccount(source))
	end
)
addEventHandler ("onPlayerLogout",root,
	function(thePreviousAccount)
		savePedStats( thePreviousAccount )
	end
)
function savePedStats( Acc)
	outputChatBox(getPlayerName(source).." saveing Stats now!", source)
	local pedposx,pedposy,pedposz = getElementPosition( source )
	local pedrotx,pedroty,pedrotz = getElementRotation( source )
	setAccountData(Acc, "pos.x", pedposx)
	setAccountData(Acc, "pos.y", pedposy)
	setAccountData(Acc, "pos.z", pedposz)
	setAccountData(Acc, "rot.x", pedrotx)
	setAccountData(Acc, "rot.y", pedroty)
	setAccountData(Acc, "rot.z", pedrotz)
	setAccountData(Acc, "skin", getPedSkin( source ))
	setAccountData(Acc, "armor", getPedArmor( source ))
	setAccountData(Acc, "health", getElementHealth( source ))
	setAccountData(Acc, "money",getPlayerMoney( source ))
	for i = 21 , 25 do
		setAccountData(Acc, "stat."..i , getPedStat(source,i))
	end
	for i = 69 , 79 do
		setAccountData(Acc, "stat."..i , getPedStat(source,i))
	end
	outputChatBox(getPlayerName(source).." saved Stats!", source)
end
function loadPedStats(Acc )
	outputChatBox(getPlayerName(source).." loading Stats now!", source)
	setElementPosition(source,getAccountData(Acc, "pos.x"),getAccountData(Acc, "pos.y"),getAccountData(Acc, "pos.z"))
	setElementRotation(source,getAccountData(Acc, "rot.x"),getAccountData(Acc, "rot.y"),getAccountData(Acc, "rot.z"))
	setPedSkin(source,getAccountData(Acc, "skin"))
	setPedArmor(source,getAccountData(Acc, "armor"))
	setElementHealth(source,getAccountData(Acc, "health"))
	setPlayerMoney(source,getAccountData(Acc, "money"))
	for i = 21 , 25 do
		setPedStat(source,i,getAccountData(Acc, "stat."..i))
	end
	for i = 69 , 79 do
		setPedStat(source,i,getAccountData(Acc, "stat."..i))
	end
	outputChatBox(getPlayerName(source).." loaded Stats!", source)
end
