/**
 * ...
 * @author Ormael
 */
package classes.Scenes.Dungeons.RiverDungeon 
{

import classes.*;
import classes.internals.*;
import classes.CoC;
import classes.GlobalFlags.kFLAGS;
import classes.Scenes.SceneLib;

public class FireElemental extends Monster
	{
		public function baseElementalAttack():void {
			outputText("Fire elemental concentrate fire on it fist and send punch toward you.");
			var damage:Number = inte + wis;
			if (player.hasPerk(PerkLib.FromTheFrozenWaste) || player.hasPerk(PerkLib.ColdAffinity)) damage *= 3;
			if (player.hasPerk(PerkLib.FireAffinity)) damage *= 0.3;
			damage *= ((flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] + 1) * 2);
			damage = Math.round(damage);
			//Dodge
			if (damage <= 0 || (player.getEvasionRoll())) outputText(" You slide underneath the surprise punch!");
			else
			{
				if (hasStatusEffect(StatusEffects.Provoke)) damage = Math.round(damage * statusEffectv2(StatusEffects.Provoke));
				outputText(" It hit you square in the chest. ");
				damage = player.takeFireDamage(damage, true);
			}
		}
		
		public function fluffyOfPunches():void {
			outputText("Fire elemental concentrate fire on it fists and goes wild at you sending flurry of punches.");
			var damage:Number = inte + wis;
			if (player.hasPerk(PerkLib.FromTheFrozenWaste) || player.hasPerk(PerkLib.ColdAffinity)) damage *= 3;
			if (player.hasPerk(PerkLib.FireAffinity)) damage *= 0.3;
			damage *= ((flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] + 1) * 1.5);
			damage = Math.round(damage);
			//Dodge
			if (damage <= 0 || (player.getEvasionRoll())) outputText(" You slide underneath it avoiding all punches!");
			else
			{
				if (hasStatusEffect(StatusEffects.Provoke)) damage = Math.round(damage * statusEffectv2(StatusEffects.Provoke));
				outputText(" They hits you all over the body. ");
				damage = player.takeFireDamage(damage, true);
				damage = player.takeFireDamage(damage, true);
				damage = player.takeFireDamage(damage, true);
				damage = player.takeFireDamage(damage, true);
			}
		}
		
		override protected function performCombatAction():void
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) {
				
			}
			else {
				if (hasStatusEffect(StatusEffects.Provoke)) {
					var choiceP:Number = rand(6);
					if (choiceP < 5) fluffyOfPunches();
					if (choiceP == 5) baseElementalAttack();
				}
				else {
					var choice1:Number = rand(6);
					if (choice1 < 3) fluffyOfPunches();
					if (choice1 == 3 || choice1 == 4) baseElementalAttack();
					if (choice1 == 5) eAttack();
				}
			}
		}
		
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			SceneLib.dungeons.riverdungeon.defeatedByFireElemental();
		}
		
		public function FireElemental() 
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 0) {
				this.long = "You're currently fighting fire elemental. It's four feet tall, it body covered with fire and it's using bare fists to fight.";
				this.tallness = 48;
				initStrTouSpeInte(10, 20, 40, 50);
				initWisLibSensCor(50, 10, 20, 50);
				this.weaponAttack = 5;
				this.armorDef = 5;
				this.armorMDef = 30;
				this.level = 12;
				this.bonusHP = 400;
				this.additionalXP = 50;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 1) {
				this.long = "You're currently fighting fire elemental. It's four feet and three inches tall, it body covered with fire and it's using bare fists to fight.";
				this.tallness = 51;
				initStrTouSpeInte(12, 22, 42, 60);
				initWisLibSensCor(60, 10, 25, 50);
				this.weaponAttack = 6;
				this.armorDef = 6;
				this.armorMDef = 35;
				this.level = 15;
				this.bonusHP = 450;
				this.additionalXP = 75;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 2) {
				this.long = "You're currently fighting fire elemental. It's four and half feet tall, it body covered with fire and it's using bare fists to fight.";
				this.tallness = 54;
				initStrTouSpeInte(14, 24, 44, 70);
				initWisLibSensCor(70, 10, 30, 50);
				this.weaponAttack = 7;
				this.armorDef = 7;
				this.armorMDef = 40;
				this.level = 18;
				this.bonusHP = 500;
				this.additionalXP = 100;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 3) {
				this.long = "You're currently fighting fire elemental. It's four feet and nine iches tall, it body covered with fire and it's using bare fists to fight.";
				this.tallness = 57;
				initStrTouSpeInte(16, 26, 46, 80);
				initWisLibSensCor(80, 10, 35, 50);
				this.weaponAttack = 8;
				this.armorDef = 8;
				this.armorMDef = 45;
				this.level = 21;
				this.bonusHP = 550;
				this.additionalXP = 125;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) {//river dungeon floor 2 subboss
				this.long = "You're currently fighting fire elemental. It's nine feet tall, it body covered with fire and it's using bare fists to fight.";
				this.tallness = 108;
				initStrTouSpeInte(16, 26, 46, 80);
				initWisLibSensCor(80, 15, 55, 50);
				this.weaponAttack = 8;
				this.armorDef = 8;
				this.armorMDef = 45;
				this.level = 24;
				this.bonusHP = 600;
				this.additionalXP = 190;
			}
			this.a = "the ";
			this.short = "fire elemental";
			this.imageName = "fire elemental";
			this.plural = false;
			this.lustVuln = 0;
			this.drop = new ChainedDrop()
					.add(useables.ELSHARD, 1);
			this.createBreastRow(0, 1);
			initGenderless();
			this.weaponName = "fists";
			this.weaponVerb = "smash";
			this.armorName = "fire skin";
			this.createPerk(PerkLib.EnemyElementalType, 0, 0, 0, 0);
			this.createPerk(PerkLib.FireNature, 0, 0, 0, 0);
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) this.createPerk(PerkLib.EnemyHugeType, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}