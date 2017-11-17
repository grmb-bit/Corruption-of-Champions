package classes.Scenes.Dungeons.HelDungeon
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;

	public class Brigid extends Monster
	{

		//Attack One: Hot Poker, Right Up Your Ass!
		private function brigidPoke():void {
			outputText("Brigid stalks forward with confidence, her shield absorbing your defensive blows until she's right on top of you. She bats your [weapon] aside and thrashes you with her hot poker, scalding your [skin] and sending you reeling. ");
			//(Effect: Heavy Damage)
			var damage:Number = Math.round((str + weaponAttack) - rand(player.tou) - player.armorDef);
			if (damage < 30) damage = 30;
			if (player.findPerk(PerkLib.FromTheFrozenWaste) >= 0 || player.findPerk(PerkLib.ColdAffinity) >= 0) damage *= 3;
			if (player.findPerk(PerkLib.FireAffinity) >= 0) damage *= 0.3;
			damage = Math.round(damage);
			damage = player.takeMagicDamage(damage, true);
			game.combatRoundOver();
		}

		//Attack Two: SHIELD BOP! OOM BOP!
		private function brigidBop():void {
			outputText("The harpy feints at you with her poker; you dodge the blow, but you leave yourself vulnerable as she spins around and slams her heavy shield into you, knocking you off balance. ");
			//(Effect: Stagger/Stun)
			var damage:Number = 5;
			damage = player.takeDamage(damage, true);
			if(player.findPerk(PerkLib.Resolute) >= 0) outputText("  Of course, your resolute posture prevents her from accomplishing much.");
			else player.createStatusEffect(StatusEffects.Stunned,0,0,0,0);
			game.combatRoundOver();
		}

		//Attack Three: Harpy Ass Grind GO!
		private function BrigidAssGrind():void {
			outputText("Brigid grins as she approaches you.  She handily deflects a few defensive blows and grabs you by the shoulders.  She forces you onto your knees and before you can blink, has turned around and smashed your face into her ass!  \"<i>Mmm, you like that, don'tcha?</i>\" she growls, grinding her huge, soft ass across your face, giving you an up-close and personal feel of her egg-laying hips.");
			player.dynStats("lus", 30);
			game.combatRoundOver();
		}
		override protected function performCombatAction():void
		{
			if(player.hasStatusEffect(StatusEffects.Stunned)) {
				player.removeStatusEffect(StatusEffects.Stunned);
				if(rand(2) == 0) BrigidAssGrind();
				else brigidPoke();
				return;
			}
			if(rand(3) == 0) BrigidAssGrind();
			else if(rand(2) == 0) brigidBop();
			else brigidPoke();
		}


		override public function defeated(hpVictory:Boolean):void
		{
			game.brigidScene.pcDefeatsBrigid();
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			game.brigidScene.pcDefeatedByBrigid();
		}

		public function Brigid()
		{
			this.a = "";
			this.short = "Brigid the Jailer";
			this.imageName = "brigid";
			this.long = "Brigid is a monster of a harpy, standing a foot taller than any other you've seen. She's covered in piercings, and her pink-dyed hair is shaved down to a long mohawk. She's nude, save for the hot poker in her right hand and the shield in her left, which jingles with every step she takes thanks to the cell keys beneath it.";
			// this.plural = false;
			this.createVagina(false, VAGINA_WETNESS_SLAVERING, VAGINA_LOOSENESS_LOOSE);
			if (LOWER_BODY_TYPE_HARPY > 0) {
				this.createStatusEffect(StatusEffects.BonusVCapacity, LOWER_BODY_TYPE_HARPY, 0, 0, 0);
			}
			createBreastRow(Appearance.breastCupInverse("D"));
			this.ass.analLooseness = ANAL_LOOSENESS_STRETCHED;
			this.ass.analWetness = ANAL_WETNESS_DRY;
			this.tallness = rand(8) + 70;
			this.hipRating = HIP_RATING_AMPLE+2;
			this.buttRating = BUTT_RATING_LARGE;
			this.skinTone = "red";
			this.hairColor = "black";
			this.hairLength = 15;
			initStrTouSpeInte(140, 110, 140, 50);
			initLibSensCor(70, 45, 50);
			this.weaponName = "poker";
			this.weaponVerb="burning stab";
			this.weaponAttack = 34 + (7 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
			this.armorName = "armor";
			this.armorDef = 24 + (3 * flags[kFLAGS.NEW_GAME_PLUS_LEVEL]);
			this.bonusHP = 1000;
			this.bonusLust = 30;
			this.lust = 20;
			this.lustVuln = .25;
			this.temperment = TEMPERMENT_LOVE_GRAPPLES;
			this.level = 29;
			this.gems = rand(37)+210;
			this.additionalXP = 150;
			this.wingType = WING_TYPE_FEATHERED_LARGE;
			this.tailType = TAIL_TYPE_DEMONIC;
			this.hornType = HORNS_DEMON;
			this.horns = 2;
			this.drop = NO_DROP;
			this.createPerk(PerkLib.ShieldWielder, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}
