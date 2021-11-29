Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E5C2C81
	for <regressions@lists.linux.dev>; Mon, 29 Nov 2021 08:22:07 +0000 (UTC)
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
	by mail.holtmann.org (Postfix) with ESMTPSA id CD473CED1F;
	Mon, 29 Nov 2021 09:22:06 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH 2/6] btbcm: disable read tx power for MacBook Pro 16,1 (16
 inch, 2019)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <47A8DBEC-322F-4C42-AF69-5FDB828B8680@live.com>
Date: Mon, 29 Nov 2021 09:22:06 +0100
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Orlando Chamberlain <redecorating@protonmail.com>,
 Daniel Winkler <danielwinkler@google.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Johan Hedberg <johan.hedberg@intel.com>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "sonnysasaka@chromium.org" <sonnysasaka@chromium.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <056FB976-25A3-466C-8C6D-DD5E11FDACCD@holtmann.org>
References: <20211001083412.3078-1-redecorating@protonmail.com>
 <YYePw07y2DzEPSBR@kroah.com>
 <70a875d0-7162-d149-dbc1-c2f5e1a8e701@leemhuis.info>
 <20211116090128.17546-1-redecorating@protonmail.com>
 <e75bf933-9b93-89d2-d73f-f85af65093c8@leemhuis.info>
 <3B8E16FA-97BF-40E5-9149-BBC3E2A245FE@live.com> <YZSuWHB6YCtGclLs@kroah.com>
 <52DEDC31-EEB2-4F39-905F-D5E3F2BBD6C0@live.com>
 <8919a36b-e485-500a-2722-529ffa0d2598@leemhuis.info>
 <20211117124717.12352-1-redecorating@protonmail.com>
 <F8D12EA8-4B37-4887-998E-DC0EBE60E730@holtmann.org>
 <40550C00-4EE5-480F-AFD4-A2ACA01F9DBB@live.com>
 <332a19f1-30f0-7058-ac18-c21cf78759bb@leemhuis.info>
 <D9375D91-1062-4265-9DE9-C7CF2B705F3F@live.com>
 <BC534C52-7FCF-4238-8933-C5706F494A11@live.com>
 <5B9FF471-42DD-44DA-A9CE-0A83BA7A4212@live.com>
 <EBE48AE4-BCE3-42A6-BA8E-304C789C4667@holtmann.org>
 <47A8DBEC-322F-4C42-AF69-5FDB828B8680@live.com>
To: Aditya Garg <gargaditya08@live.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)

Hi Aditya,

>>> Bluetooth on Apple MacBook Pro 16,1 is unable to start due to LE =
Min/Max Tx Power being queried on startup. Add a DMI based quirk so that =
it is disabled.
>>=20
>> list all the MacBooks that you found problematic right now. We add =
the
>> initial as a large batch instead of all individual.
>>=20
>>>=20
>>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>>> Tested-by: Aditya Garg <gargaditya08@live.com>
>>> ---
>>> drivers/bluetooth/btbcm.c | 20 ++++++++++++++++++++
>>> 1 file changed, 20 insertions(+)
>>>=20
>>> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
>>> index e4182acee488c5..c1b0ca63880a68 100644
>>> --- a/drivers/bluetooth/btbcm.c
>>> +++ b/drivers/bluetooth/btbcm.c
>>> @@ -8,6 +8,7 @@
>>>=20
>>> #include <linux/module.h>
>>> #include <linux/firmware.h>
>>> +#include <linux/dmi.h>
>>> #include <asm/unaligned.h>
>>>=20
>>> #include <net/bluetooth/bluetooth.h>
>>> @@ -343,9 +344,23 @@ static struct sk_buff =
*btbcm_read_usb_product(struct hci_dev *hdev)
>>> 	return skb;
>>> }
>>>=20
>>> +static const struct dmi_system_id =
disable_broken_read_transmit_power[] =3D {
>>> +	{
>>> +		/* Match for Apple MacBook Pro 16,1 which needs
>>> +		 * Read LE Min/Max Tx Power to be disabled.
>>> +		 */
>>=20
>> Actually leave the comment out. You are not adding any value that =
isn=E2=80=99t
>> already in the variable name or the DMI. It is just repeating the =
obvious.
> Alright, I prepare the patches into a single one

two patches, one for adding the quirk to the core and one for adjusting =
the driver.

Regards

Marcel

