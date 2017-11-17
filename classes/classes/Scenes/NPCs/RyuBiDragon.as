/**
 * ...
 * @author Ormael
 */
package classes.Scenes.NPCs 
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;
	import classes.internals.ChainedDrop;
	
	public class RyuBiDragon extends Monster
	{
		override public function defeated(hpVictory:Boolean):void
			{
			clearOutput();
			cleanupAfterCombat();
			if (flags[kFLAGS.RYUBI_LVL_UP] == 1) {
				outputText("Placeholder");
				flags[kFLAGS.RYUBI_LVL_UP]++;
				return;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 2) {
				outputText("Placeholder");
				flags[kFLAGS.RYUBI_LVL_UP]++;
				return;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 3) {
				outputText("Placeholder");
				flags[kFLAGS.RYUBI_LVL_UP]++;
				return;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 4) {
				outputText("Placeholder");
				flags[kFLAGS.RYUBI_LVL_UP]++;
				return;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 5) {
				outputText("Placeholder");
				flags[kFLAGS.RYUBI_LVL_UP]++;
				return;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 6) {
				outputText("Placeholder");
				return;
			}
		}
		
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			clearOutput();
			outputText("Placeholder");
			cleanupAfterCombat();
			return;
		}
		
		public function RyuBiDragon() 
		{
			if (flags[kFLAGS.RYUBI_LVL_UP] == 1) {
				initStrTouSpeInte(100, 100, 20, 10);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 4 + (1 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 4 + (1 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .95;
				this.bonusHP = 50;
				this.bonusLust = 10;
				this.level = 3;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 2) {
				initStrTouSpeInte(110, 120, 30, 25);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 7 + (2 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 7 + (1 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .95;
				this.bonusHP = 100;
				this.bonusLust = 20;
				this.level = 6;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 3) {
				initStrTouSpeInte(120, 140, 40, 40);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 10 + (3 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 10 + (2 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .9;
				this.bonusHP = 150;
				this.bonusLust = 30;
				this.level = 9;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 4) {
				initStrTouSpeInte(130, 160, 50, 60);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 15 + (4 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 15 + (2 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .9;
				this.bonusHP = 200;
				this.bonusLust = 40;
				this.level = 12;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 5) {
				initStrTouSpeInte(140, 180, 60, 80);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 20 + (5 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 20 + (3 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .85;
				this.bonusHP = 250;
				this.bonusLust = 50;
				this.level = 15;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 6) {
				initStrTouSpeInte(150, 200, 70, 100);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 25 + (6 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 25 + (3 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .85;
				this.bonusHP = 300;
				this.bonusLust = 60;
				this.level = 18;
			}
			if (flags[kFLAGS.RYUBI_LVL_UP] == 7) {
				initStrTouSpeInte(150, 200, 70, 100);
				initLibSensCor(50, 35, 50);
				this.weaponAttack = 36 + (8 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.armorDef = 54 + (6 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
				this.lustVuln = .85;
				this.bonusHP = 300;
				this.bonusLust = 60;
				this.level = 21;
			}
			this.a = "the ";
			this.short = "dragon";//może na początku po prostu a (mighty) dragon
			this.imageName = "ryubidragon";
			this.long = "You are currently battling a mighty dragon.";
			//this.long = "You are currently 'battling' RyuBi in dragon from, in a playfight.  At least, that was the intention.  The way she lashes her tail along the ground, with claws spread and teeth bared ferociously, makes you wonder.";
			createVagina(true,VAGINA_WETNESS_NORMAL,VAGINA_LOOSENESS_NORMAL);
			createStatusEffect(StatusEffects.BonusVCapacity,10,0,0,0);
			createBreastRow(Appearance.breastCupInverse("A"));
			this.ass.analLooseness = ANAL_LOOSENESS_TIGHT;
			this.ass.analWetness = ANAL_WETNESS_DRY;
			this.createStatusEffect(StatusEffects.BonusACapacity,10,0,0,0);
			this.tallness = 340;
			this.hipRating = HIP_RATING_SLENDER;
			this.buttRating = BUTT_RATING_TIGHT;
			this.skin.base.color = "white";
			this.hairColor = "black";
			this.hairLength = 1;
		//	initStrTouSpeInte(400, 400, 20, 10);
			this.weaponName = "claws";
			this.weaponVerb="claw";
			this.armorName = "scales";
			this.lust = 20;
			this.temperment = TEMPERMENT_LOVE_GRAPPLES;
			this.gems = 5 + rand(3);
			this.drop = new ChainedDrop().add(useables.D_SCALE, 0.2);
			this.faceType = FACE_DRAGON;
			this.tongueType = TONGUE_DRACONIC;
			this.earType = EARS_DRAGON;
			this.hornType = HORNS_DRACONIC_X4_12_INCH_LONG;
			this.horns = 4;
			this.wingType = WING_TYPE_DRACONIC_HUGE;
			this.lowerBody = LOWER_BODY_TYPE_DRAGON;
			this.tailType = TAIL_TYPE_DRACONIC;
			this.createPerk(PerkLib.EnemyBossType, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyGigantType, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyGodType, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}