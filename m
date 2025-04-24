Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF24143895
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503303; cv=none; b=QYrJwNOT+1vbZ3LVczt5IsjMg/EftDHQKJKhuZPZ5gwyn1S2odEyjy+nvcfg2YxTAhXG3N/bNdpUSqkq4PzeAVZmO3BfjInZMUmufOKMDcs8ld1UVdn0AK2nV4ZKcG6JV1KkLQYyuxGj2DifAI61g/Y/ef5LFbJ8HIEFBRozt0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503303; c=relaxed/simple;
	bh=Bn7qKgmVirMnL4HSoD6+ySbU242thJzaLTltDmOvM9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qbjV6pRFRU9RF69KQbMPTG9/JjxFkW4b7Ppr0XpfJhzmePPJq51Im922ho9T+sP7DjRE70+sL2GtD0xfDVEhNBmfrxv25mJyalJGHqL6TepX0w8kW2u69GLh1HK4Q9pgYpbrJXQJ5OP/A8KWxTMV4tazwxN1KomVRk++SQk2+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=fOoVMBA9; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="fOoVMBA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1745503266; x=1746108066; i=christian@heusel.eu;
	bh=BiYoI3t07zEC8MRuyXYTtYuABNrGYYjjjTp7cv/tN5k=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fOoVMBA9xSHqDmz+KAtGbkC03RIn1oc6Vqyoh63Le0iCrYA5LMHw2q6OvACFsCgg
	 RTUhGuv3c2EKq/E9kWAHzHPrJMKkmaMtplUdTNszexbzjkrse/5hwqXpmYNzr9gAW
	 HRiaZEDoYrK0MdDmIOYpOIM6HTcqC9VNNWLnfBT2tjU0I+YOvRmtcDq07kwFS2auk
	 6BxOPApH1++GFl88j1r8Y8Q8d2QcbBxPdvJuOA7dx2tSsCp+BENHIdDet1st+CsSR
	 LAn6V5vEbmmd6ftwKMqVG/DHhAIbma4OjSI8u+c3iERdlrbaaXYvqkKNgHEhMG+1A
	 p9OylIuBImBKaEQT8Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from meterpeter.localdomain ([80.187.66.147]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7auL-1uBYB23HSf-0093Pm; Thu, 24 Apr 2025 16:01:06 +0200
From: Christian Heusel <christian@heusel.eu>
Date: Thu, 24 Apr 2025 16:00:28 +0200
Subject: [PATCH] Revert "rndis_host: Flag RNDIS modems as WWAN devices"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20250424-usb-tethering-fix-v1-1-b65cf97c740e@heusel.eu>
X-B4-Tracking: v=1; b=H4sIAPtDCmgC/x2MywqAIBAAf0X23ELZA+tXokPmpnux0Iog+veWj
 jMw80CmxJRhUA8kujjzFgWqQsES5ugJ2QmDLnVbNrrBM1s86AiSRY8r31j3pjPG1trNDqTbE4n
 +n+P0vh/8VO0nYwAAAA==
X-Change-ID: 20250424-usb-tethering-fix-398688b32dad
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, 
 Christian Heusel <christian@heusel.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318; i=christian@heusel.eu;
 h=from:subject:message-id; bh=uCmWJ08d3T6sqzruRhhWDBmrpAmhzZjpMdT+4kKwQso=;
 b=owEBbQKS/ZANAwAIAcBH1PMotSWFAcsmYgBoCkQYdLRPMzkf+QHfzbvX3tEyVNKkXCfmnJZ2b
 F3yPlBdc5+JAjMEAAEIAB0WIQRvd5reJHprig9yzBPAR9TzKLUlhQUCaApEGAAKCRDAR9TzKLUl
 hbkUEADVFJTdIYmV70vJOafWG6Q0MJ2+D744VIi72htiDZaU5KXXnhjhgcCkc7ERzzc6EPBdfvh
 fT0tSm0OSj5EmPxftgKRfnKpuSzgUf3JrqszWBjc3b1VS116beAeKyBSL3CDxn410Qgefxq6ONN
 Snx4HfR6mmQMdYskMAmBfXcnhZumZbOs6E79j4Rgo9aGyhn8e5br9Wjydvdaha6ofhalKG4/noI
 3V1sxjlLAtItMZN6x8K/Sw//g6oOpKeUarSXzINs2jE1KE+KM9iEL0ao23V7D/Abvx5j8uIOnsH
 Zd3XTbOumKO9MwGhRFcWscVXtTbwcwE4l08BvhjLrNQcx1CCXK4r1NDkqEvmCEQPkEs5gOCKe2s
 KcH2umRSOXY3MdEFn6MfOaswwA9qB3GYfklyjZJ5sFsZ7B/CYK5taj4ZBdF2B2mJN+n8ZZJNOTa
 GRQh2SZ5wcR4TfSt/UO8xGbvngKYeHzj1PVMBar79KJNDpwolwDF4Q12CUTfP0aPs2kCuWFaeTA
 qSq8esVlTmrAYmpstcqq5ggZHK12aTwAgzo137jYyjctXFMGjwAMeHZ2/tAEHRQKYF/x0xp1J8l
 rQvN2uVtySCduj5BGS8ibjNrLYHIy+QSEWgpYxK7DTRpQcR+TXmmojhXCma6F4AKINd9+Xit5sO
 aVMbYywjdZ0p1AQ==
X-Developer-Key: i=christian@heusel.eu; a=openpgp;
 fpr=6F779ADE247A6B8A0F72CC13C047D4F328B52585
X-Provags-ID: V03:K1:inbTguRCRiMzNvBapqeKfvNgoRAp4ykFIM+J2mJo0gamsw0VmE2
 SCWeqUtxg/rShR/rwfRc771bqCWDaQuMi2EiSCFU/1U7cbNqcuOcfj6n03OKFnTz8PoT3Xy
 cj3rVVGs0Lo8CPxQbCb3CxFRkiY/ojr9BH/QlvXlUFPFXIBABy3qJl/IsDYJqUiFt5Q2FTk
 /8AdAL1xp0bS9+MPHtEHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rhl6VMnDmjA=;x8XwOb5V81HrnoRvccaDf8T9wRO
 IDpWW9E4BLOq5ev3wPaPWZWZ+atWTdQM4rfwCNIPRdtg4hJQV2NbHVGcR1BQPmBlC3KbfavsY
 qaR5HvC23QcfY5AnnPYVx9ru5ag38ipHIUYWqYYoMAMgnET52Y0Y6SF5dtlHFltKP/Ld9s6/r
 kFRpJAqKMfCrfX/9K6Hqp+e8TITIyUxtrVyfhXsYk8me5auLTiHOrPCWnzBBGZHe+qP41TQ2r
 rEKItvcLQTxxrpyKy1dni+jZWDvEt0Btojqve74QlSOKcLwz9MUvOuBa6y+AsGv5NzkCE1KXa
 rzXVVVJ38Xfxp3UhlBBuzvFq88/pdnb9x34m5QKqTxtry2SrJJqy/PU/HokYrXpoLs9wVCRQ5
 xeS2wQqxuztK5evUkAq3iJo/Z+03rMZ5BtUToQWf2GlonE4Ij+k9QkKmqrn3gPltt9xdOpDJu
 kSwMvOjMcqb+sJz+0lVtfI+VY9QN2AwAkyFEGrsG9FrVf8OVsubkMEgu0OSJEaHO+4Ye7/j0f
 TYMx3w50OawYTtS/MDSkOM0M9WNqeS1UTPpNpRpzTaopswJT5/fKfmddNNTiD0ZXgYI8jqvXc
 jkqeQXV8BkgAEw0QL79cSBTYwlSHoQevvPERojk1pl73IjzHcLa9EM8sPsc+USkBb9qSPj9Tj
 mflv3pVbiSB6plDQVMa6J+sPJf+LxRjn8W5jfOOd7/I21jQNuT/V5pPVeku0mU+FeIxWK8PCs
 KcaKvzSgtUWmvYkFNUabzbIFY0fh6pDeDH6ZtP63ep7J6w5tQNVHWCi5+Gtez8Urtck/hSd/e
 oU0Lr1pKPAIHvMBIR8gVw6j9u1oUzsMIm0GCJJPr2SUDb6MdtaTkAe5MZOl8KpAOJ9FhyfjGj
 GirmHvf3RNkxpic7CnFYrGKM0xX65e8ZKFBdc03KOuowUkQkxO3Ng9S7hFn4mBZpNAhNak9U9
 0Thf5F5yyHBTfV9w2BNVvBaDLOGwB3cff2bYQNtBDDlSJYE+jS1y0VX4Zs8v84V0qw6fmGA7m
 FDUO2aP1UgXjaTlHCM37eMNYssJZ8N62GU8l76fit+TlFh8v+z/wLnPwzaWtbV9BgwbkiTObe
 d6EPyl3LITXBxlbBPbno4bd1wsV5Bp5TkED7Uw/MBNDXq1vEDT/f2RRS4rVFXxmIH2HAPgEAb
 VKMLOOBr2OGCJKUmhj64KUryhFoL7rtjuGgVaG6qztGQDSPJHlhZbAFEZHxgCnbS6AHGPynb4
 r/lFWR311HQKQhdvjzVpkRJNUZBiPgvoFfciPI78oqHB126gD9dPN1O0+XsWyVSoDiN7hLc3m
 kTiaIZUOgWXxeBVBJX1pudlbYr1I2o0DG1H/XZcXO8QxzzXGVR0IxvCMc4wRACKb0bxSW2tHg
 xHqupIigoEF1EkM8Z6FlotdrNDXlfayMuTO2Q=

This reverts commit 67d1a8956d2d62fe6b4c13ebabb57806098511d8. Since this
commit has been proven to be problematic for the setup of USB-tethered
ethernet connections and the related breakage is very noticeable for
users it should be reverted until a fixed version of the change can be
rolled out.

Closes: https://lore.kernel.org/all/e0df2d85-1296-4317-b717-bd757e3ab928@h=
eusel.eu/
Link: https://chaos.social/@gromit/114377862699921553
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220002
Link: https://bugs.gentoo.org/953555
Link: https://bbs.archlinux.org/viewtopic.php?id=3D304892
Cc: stable@vger.kernel.org
Acked-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Christian Heusel <christian@heusel.eu>
=2D--
 drivers/net/usb/rndis_host.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index bb0bf1415872745aea177ce0ba7d6eb578cb4a47..7b3739b29c8f72b7b108c5f4ae=
11fdfcf243237d 100644
=2D-- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -630,16 +630,6 @@ static const struct driver_info	zte_rndis_info =3D {
 	.tx_fixup =3D	rndis_tx_fixup,
 };
=20
-static const struct driver_info	wwan_rndis_info =3D {
-	.description =3D	"Mobile Broadband RNDIS device",
-	.flags =3D	FLAG_WWAN | FLAG_POINTTOPOINT | FLAG_FRAMING_RN | FLAG_NO_SET=
INT,
-	.bind =3D		rndis_bind,
-	.unbind =3D	rndis_unbind,
-	.status =3D	rndis_status,
-	.rx_fixup =3D	rndis_rx_fixup,
-	.tx_fixup =3D	rndis_tx_fixup,
-};
-
 /*-----------------------------------------------------------------------=
=2D-*/
=20
 static const struct usb_device_id	products [] =3D {
@@ -676,11 +666,9 @@ static const struct usb_device_id	products [] =3D {
 	USB_INTERFACE_INFO(USB_CLASS_WIRELESS_CONTROLLER, 1, 3),
 	.driver_info =3D (unsigned long) &rndis_info,
 }, {
-	/* Mobile Broadband Modem, seen in Novatel Verizon USB730L and
-	 * Telit FN990A (RNDIS)
-	 */
+	/* Novatel Verizon USB730L */
 	USB_INTERFACE_INFO(USB_CLASS_MISC, 4, 1),
-	.driver_info =3D (unsigned long)&wwan_rndis_info,
+	.driver_info =3D (unsigned long) &rndis_info,
 },
 	{ },		// END
 };

=2D--
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-usb-tethering-fix-398688b32dad

Best regards,
=2D-=20
Christian Heusel <christian@heusel.eu>

