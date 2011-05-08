--[[
-- Name:					BigWigs_Chogall_WorshipIcons
-- Description: 	Sets raid icons on the worshipped players in the Cho'gall encounter
-- License:				Public Domain
-- Credits: 			Derived from Rabbit's BigWigs_SingragosaIcons
--]]

local mod = BigWigs:NewBoss("Cho'gall Worship Icons", 758)
if not mod then return end
mod:RegisterEnableMob(43324)

local current = 0

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Beacon", 91317, 93365, 93366, 93367)
	self:Log("SPELL_AURA_REMOVED", "Safe", 91317, 93365, 93366, 93367)
	-- self:Death("Disable", 43324)
end

function mod:Beacon(player)
	current = current + 1
	SetRaidTarget(player, current)

	local max = 2
	local d = GetInstanceDifficulty()
	if d == 4 then max = 6
	elseif d == 2 then max = 5
	end
	if current == max then current = 0 end
end

function mod:Safe(player)
	SetRaidTarget(player, 0)
end
