/**
 * ...
 * @author Liadri
 */
package classes.Items.Armors 
{
import classes.Items.Armor;
import classes.PerkLib;
import classes.Player;
import classes.StatusEffects;
	
	public class TamamoNoMaeCursedKimono extends ArmorWithPerk
	{

		public function TamamoNoMaeCursedKimono()
		{
			super("T.C.Kimono","T.C.Kimono","Tamamo no Mae Cursed Kimono","a Tamamo no Mae Cursed Kimono",0,30,12000,"It is said that this beautiful Kimono decorated with flower motifs was worn by lady Tamamoe, last leader of the kitsunes, before she fell from grace into a Kumiho. Increase the potency of spells and soulskill by up to 50% based on corruption and empower all Kitsunes ability. Like most kitsune outfit this Kimono is made to improve ones charms and thus leaves you as agile as if naked.","Light",
					PerkLib.WizardsAndDaoistsEndurance,60,0,0,0);
		}

		override public function playerEquip():Armor {
			while (game.player.hasPerk(PerkLib.TamamoNoMaeCursedKimono)) game.player.removePerk(PerkLib.TamamoNoMaeCursedKimono);
			game.player.createPerk(PerkLib.TamamoNoMaeCursedKimono,0,0,0,0);
			while (game.player.hasPerk(PerkLib.SluttySeduction)) game.player.removePerk(PerkLib.SluttySeduction);
			game.player.createPerk(PerkLib.SluttySeduction,15,0,0,0);
			return super.playerEquip();
		}

		override public function playerRemove():Armor {
			while (game.player.hasPerk(PerkLib.TamamoNoMaeCursedKimono)) game.player.removePerk(PerkLib.TamamoNoMaeCursedKimono);
			while (game.player.hasPerk(PerkLib.SluttySeduction)) game.player.removePerk(PerkLib.SluttySeduction);
			return super.playerRemove();
		}

	}
}