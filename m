Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0912F80
	for <regressions@lists.linux.dev>; Wed, 29 Sep 2021 05:09:42 +0000 (UTC)
Date: Wed, 29 Sep 2021 05:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail; t=1632892166;
	bh=4/h3hHhx8+ST7KvURyRE3yY/JnALcxX0E3zpkWI8jvg=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=XuQHetD+L6k3gd44OMGH7fMo2iDvLzhlMNdCvnYpktQdOhSfZOR17JOHqbRfQDZSk
	 O96JOytkGsWrPR+r0wu0LGxmHmehafr7DhpS8OxdQJK8uUVmmvNuVm+Idd3BxCku2Y
	 rJimkNqLcdFUg9UssX12p5v5grZ5HlmTw81dijIg=
To: linux-bluetooth@vger.kernel.org
From: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, sonnysasaka@chromium.org, danielwinkler@google.com, marcel@holtmann.org, johan.hedberg@intel.com
Reply-To: Orlando Chamberlain <redecorating@protonmail.com>
Subject: [regression] Bluetooth: Query LE tx power on startup broke Bluetooth on MacBookPro16,1
Message-ID: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Commit 7c395ea521e6 made Bluetooth stop working on the MacBookPro16,1. I

believe this also affected the iMac20,1. The patch below introduces a quirk

disabling Read LE Min/Max Tx Power for affected computers, based off the br=
cm
chip
 id 150.



I think there are a couple of issues with this patch that I don't have the

knowledge to resolve:

1. I don't know how accurate the description of the quirk is, I based it of=
f

   the commit message of 7c395ea521e6m, however I don't understand much abo=
ut

   how Bluetooth works. Other Bluetooth quirks also have explanations as to

   why they are needed, I don't know why this quirk is needed (is it that

   these chips incorrectly say they support read le minmax tx power? I just

   don't know).

2. It may be a bug in the min max le tx power code that could be fixed inst=
ead

   of disabling it for the affected devices.



I haven't had much success in figuring out exactly why reading le minmax tx

power stops Bluetooth from working. I have noticed that these lines are not

present in dmesg when Bluetooth is not working due to this issue:



Bluetooth: RFCOMM TTY layer initialized

Bluetooth: RFCOMM socket layer initialized

Bluetooth: RFCOMM ver 1.11



I have also added some logging around the changes in 7c395ea521e6, the two

patches (one with bt working one without) I tried and their associated dmes=
gs

are here https://gist.github.com/Redecorating/8330bb58a7cb8730be3956058ba45=
99f



Regards,

Orlando Chamberlain



---

 drivers/bluetooth/btbcm.c   | 4 ++++

 include/net/bluetooth/hci.h | 9 +++++++++

 net/bluetooth/hci_core.c    | 3 ++-

 3 files changed, 15 insertions(+), 1 deletion(-)



diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c

index e4182acee488..4ecc50d93107 100644

--- a/drivers/bluetooth/btbcm.c

+++ b/drivers/bluetooth/btbcm.c

@@ -353,6 +353,10 @@ static int btbcm_read_info(struct hci_dev *hdev)

 =09=09return PTR_ERR(skb);



 =09bt_dev_info(hdev, "BCM: chip id %u", skb->data[1]);

+

+=09if (skb->data[1] =3D=3D 150)

+=09=09set_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, &hdev->quirks);

+

 =09kfree_skb(skb);



 =09/* Read Controller Features */

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h

index b80415011dcd..9ce46cb8564d 100644

--- a/include/net/bluetooth/hci.h

+++ b/include/net/bluetooth/hci.h

@@ -246,6 +246,15 @@ enum {

 =09 * HCI after resume.

 =09 */

 =09HCI_QUIRK_NO_SUSPEND_NOTIFIER,

+

+=09/*

+=09 * When this quirk is set, LE tx power is not queried on startup

+=09 * and the min/max tx power values default to HCI_TX_POWER_INVALID.

+=09 *

+=09 * This quirk can be set before hci_register_dev is called or

+=09 * during the hdev->setup vendor callback.

+=09 */

+=09HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER,

 };



 /* HCI device flags */

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c

index 8a47a3017d61..9a23fe7c8d67 100644

--- a/net/bluetooth/hci_core.c

+++ b/net/bluetooth/hci_core.c

@@ -742,7 +742,8 @@ static int hci_init3_req(struct hci_request *req, unsig=
ned long opt)

 =09=09=09hci_req_add(req, HCI_OP_LE_READ_ADV_TX_POWER, 0, NULL);

 =09=09}



-=09=09if (hdev->commands[38] & 0x80) {

+=09=09if (hdev->commands[38] & 0x80 &&

+=09    =09!test_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, &hdev->quirks)) =
{

 =09=09=09/* Read LE Min/Max Tx Power*/

 =09=09=09hci_req_add(req, HCI_OP_LE_READ_TRANSMIT_POWER,

 =09=09=09=09    0, NULL);

--

2.33.0

