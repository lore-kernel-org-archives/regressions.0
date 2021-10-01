Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F342FB3
	for <regressions@lists.linux.dev>; Fri,  1 Oct 2021 09:35:17 +0000 (UTC)
Received: from smtpclient.apple (62-134-92-74.business.static.de.bt.net [62.134.92.74])
	by mail.holtmann.org (Postfix) with ESMTPSA id D0BFBCED29;
	Fri,  1 Oct 2021 11:35:16 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCHv2] Bluetooth: quirk disabling LE Read Transmit Power
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211001083412.3078-1-redecorating@protonmail.com>
Date: Fri, 1 Oct 2021 11:35:16 +0200
Cc: danielwinkler@google.com,
 Johan Hedberg <johan.hedberg@intel.com>,
 linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev,
 sonnysasaka@chromium.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D2217A9-EA73-4D93-8D0B-5BC2718D4788@holtmann.org>
References: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
 <20210930063106.19881-1-redecorating@protonmail.com>
 <20210930141256.19943-1-redecorating@protonmail.com>
 <FA02CDD7-CFEC-4481-9940-BA95D81FD3F3@holtmann.org>
 <275acce4-9eab-9cba-7145-5a75a69ca530@protonmail.com>
 <20211001083412.3078-1-redecorating@protonmail.com>
To: Orlando Chamberlain <redecorating@protonmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)

Hi Orlando,

> The LE Read Transmit Power command is Advertised on some Broadcom
> controlers, but not supported. Using this command breaks Bluetooth
> on the MacBookPro16,1 and iMac20,1. Added a quirk disabling LE Read
> Transmit Power for these devices, based off their common chip id 150.
>=20
> Link: =
https://lore.kernel.org/r/4970a940-211b-25d6-edab-21a815313954@protonmail.=
com
> Signed-off-by: Orlando Chamberlain <redecorating@protonmail.com>
> ---
> v1->v2: Clarified quirk description
>=20
> drivers/bluetooth/btbcm.c   |  4 ++++
> include/net/bluetooth/hci.h | 11 +++++++++++
> net/bluetooth/hci_core.c    |  3 ++-
> 3 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index e4182acee488..4ecc50d93107 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -353,6 +353,10 @@ static int btbcm_read_info(struct hci_dev *hdev)
> 		return PTR_ERR(skb);
>=20
> 	bt_dev_info(hdev, "BCM: chip id %u", skb->data[1]);
> +
> +	if (skb->data[1] =3D=3D 150)
> +		set_bit(HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER, =
&hdev->quirks);
> +
> 	kfree_skb(skb);

I would really prefer to do that via the ACPI table matching in =
hci_bcm.c and not via some magic chip id check. We actually don=E2=80=99t =
know how Broadcom assigns their chip ids.

Regards

Marcel

