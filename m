Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA3D7E59F
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624490; cv=none; b=FjOcMLczBIKyKnBT4Vl0GzXLYwuIYc7W7gMns3lXTNfCQ3Aaby2SITVTnKSzmRY2b1ZlUiikN7KvzQLHpUGp6h4AFoIClPe0CYlVhHkf055Er8p4SzSLezIyCWfy5pZQYoZffX2c8YAWE63g9e2yMCCQ99G6M0rr+6Sy+V93VPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624490; c=relaxed/simple;
	bh=fHKIBMJO6+04Qzr1rbAIqhpOdxcrJuDSSuqFtTdx4t8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iSUnR1x2xnFsfP2WFN9JP8S+NV6caeEpaV8MRk1y0qTJEBO7hQVQuINMBEu9zLNCb5zAxwg/x4RGVQCm3rk8YqmqECxmW//v5kGW3wqHHwnF1nC3l1i/mGaSl1VJ9WCXJURHk/bMqcPD7bUw/4zTPlMxPuRt6CaHWV/uNaafaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xjgu1A28; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xjgu1A28"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc09556599so50953045ad.1
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 23:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709624488; x=1710229288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rj6H16qrNOWw0BmwrUEhfXf67q1pzJuusXUTp9cqYaQ=;
        b=Xjgu1A281I39RYicCyrM2MYmJ3/rUUIqwvbNGiFSGe9fuD4wnrzX6mSUx1eG8u9HyY
         AiE6ZbZVUnarHHwsZv44TufZXpro45BTAL143QCX4ohVQFyBaa9KF47ZUWwIHIdB2kzz
         ESOYUr9YAMBPE0b+/cBw2Qb621kgjJckd729q25TFiDnwhv3FJqjU/6GBGLdctTUl641
         b/vv8aQxng1jzIOEEBRAUyPWzHzfgLbGXz84GtYjqajwsii0zAv6kOSpStKv3qdMvm9o
         YX/W0jH7n7P5c1YUw+DUVVjBlGivq3PsuhwU1T9Z+4NQKas56uV9g6+oX3BjravM5f0O
         w8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624488; x=1710229288;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rj6H16qrNOWw0BmwrUEhfXf67q1pzJuusXUTp9cqYaQ=;
        b=tNcsGe+CuzGM7ygjVacmuCnzZl4gVNRMbjU3hey+Q7B0eoGXcLzJaRbnOCQVdEsBdr
         z1ygYWLQrwGmGxRg7o/nK87TRZ7h8YQRu6TYVg2FEqQIhXEteiFnT+rhRJlHBowX5ohP
         LUoL5vcEVaazCSPUpcktNMugQL52YHltLvB1hfLZANeqqAXrVeo8igRR3nR85DVTYcqG
         eu13wIPI4yTjmm3Vj5zu9u9MpVCxFnBtRdATi+Ps+32ho2SswBA77cDqmnS6ImvPtsZv
         2AYOCgqy82ui2ClWRvL3kXBdRTgMyJpWMkfej5Rxlu6urW7bjhmE8dPGKzALam7fvWl/
         Xr2w==
X-Forwarded-Encrypted: i=1; AJvYcCU6GHKcEUgH+qiNiTahEm3c49hskvjkrgu+PUDHAe5aW1mXmxLmDio2vKZYjOwko3zrBLPgPzF4cQvu4OxrwbIVcYFD0HWWdKfP3y0=
X-Gm-Message-State: AOJu0Yx1SA2MDOarQD/3g8DD4kAj/PgZWBua3OMSocWEpoBoFFY9q4ts
	bajhlTGZBMI1dvAM5ehsQ56evTsXCM7zrpa/iSc8tZkj/NSPgBFJ
X-Google-Smtp-Source: AGHT+IEewqxAegsU0vq7eh5l5+spdyVUh5uaeeigpkLQhYbcbsLwkxfUywTOiTl31QEpyiMcfh8uIg==
X-Received: by 2002:a17:902:7806:b0:1dc:5d2e:c18c with SMTP id p6-20020a170902780600b001dc5d2ec18cmr1129291pll.67.1709624487707;
        Mon, 04 Mar 2024 23:41:27 -0800 (PST)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:9509:3d92:c4ae:bb92])
        by smtp.gmail.com with ESMTPSA id mm6-20020a1709030a0600b001db67377e8dsm9787009plb.248.2024.03.04.23.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:41:27 -0800 (PST)
Date: Mon, 04 Mar 2024 23:41:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Jacopo Radice <jacopo.radice@outlook.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_Revert_=22Input=3A_bcm5974_-_ch?= =?US-ASCII?Q?eck_endpoint_type_before_starting_traffic=22?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240305-revert_bcm5974_ep_check-v2-1-925ae9b188d9@gmail.com>
References: <20240305-revert_bcm5974_ep_check-v2-1-925ae9b188d9@gmail.com>
Message-ID: <04E6C7D8-395C-4DB3-B331-B79215DE6B40@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 4, 2024 10:38:33 PM PST, Javier Carrasco <javier=2Ecarrasco=2Ecruz=
@gmail=2Ecom> wrote:
>This patch intended to fix an well-knonw issue in old drivers where the
>endpoint type is taken for granted, which is often triggered by fuzzers=
=2E
>
>That was the case for this driver [1], and although the fix seems to be
>correct, it uncovered another issue that leads to a regression [2], if
>the endpoints of the current interface are checked=2E
>
>The driver makes use of endpoints that belong to a different interface
>rather than the one it binds (it binds to the third interface, but also
>accesses an endpoint from a different one)=2E The driver should claim the
>interfaces it requires, but that is still not the case=2E
>
>Given that the regression is more severe than the issue found by
>syzkaller, the best approach is reverting the patch that causes the
>regression, and trying to fix the underlying problem before checking
>the endpoint types again=2E
>
>Note that reverting this patch will probably trigger the syzkaller bug
>at some point=2E
>
>This reverts commit 2b9c3eb32a699acdd4784d6b93743271b4970899=2E
>
>Link: https://syzkaller=2Eappspot=2Ecom/bug?extid=3D348331f63b034f89b622 =
[1]
>Link: https://lore=2Ekernel=2Eorg/linux-input/87sf161jjc=2Ewl-tiwai@suse=
=2Ede/ [2]
>
>Fixes: b516b1b0dfcc ("Revert "Input: bcm5974 - check endpoint type before=
 starting traffic"")


This "fixes" tag looks incorrect=2E The patch fixes itself?

>Reported-by: Jacopo Radice <jacopo=2Eradice@outlook=2Ecom>
>Closes: https://bugzilla=2Esuse=2Ecom/show_bug=2Ecgi?id=3D1220030
>Signed-off-by: Javier Carrasco <javier=2Ecarrasco=2Ecruz@gmail=2Ecom>
>---
>Changes in v2:
>- Add "Reported-by", "Closes" and "Link" tags=2E
>- Use shorter lore link=2E
>- Link to v1: https://lore=2Ekernel=2Eorg/r/20240305-revert_bcm5974_ep_ch=
eck-v1-1-db4f0422588f@gmail=2Ecom
>---
> drivers/input/mouse/bcm5974=2Ec | 20 --------------------
> 1 file changed, 20 deletions(-)
>
>diff --git a/drivers/input/mouse/bcm5974=2Ec b/drivers/input/mouse/bcm597=
4=2Ec
>index 953992b458e9=2E=2Eca150618d32f 100644
>--- a/drivers/input/mouse/bcm5974=2Ec
>+++ b/drivers/input/mouse/bcm5974=2Ec
>@@ -19,7 +19,6 @@
>  * Copyright (C) 2006	   Nicolas Boichat (nicolas@boichat=2Ech)
>  */
>=20
>-#include "linux/usb=2Eh"
> #include <linux/kernel=2Eh>
> #include <linux/errno=2Eh>
> #include <linux/slab=2Eh>
>@@ -194,8 +193,6 @@ enum tp_type {
>=20
> /* list of device capability bits */
> #define HAS_INTEGRATED_BUTTON	1
>-/* maximum number of supported endpoints (currently trackpad and button)=
 */
>-#define MAX_ENDPOINTS	2
>=20
> /* trackpad finger data block size */
> #define FSIZE_TYPE1		(14 * sizeof(__le16))
>@@ -894,18 +891,6 @@ static int bcm5974_resume(struct usb_interface *ifac=
e)
> 	return error;
> }
>=20
>-static bool bcm5974_check_endpoints(struct usb_interface *iface,
>-				    const struct bcm5974_config *cfg)
>-{
>-	u8 ep_addr[MAX_ENDPOINTS + 1] =3D {0};
>-
>-	ep_addr[0] =3D cfg->tp_ep;
>-	if (cfg->tp_type =3D=3D TYPE1)
>-		ep_addr[1] =3D cfg->bt_ep;
>-
>-	return usb_check_int_endpoints(iface, ep_addr);
>-}
>-
> static int bcm5974_probe(struct usb_interface *iface,
> 			 const struct usb_device_id *id)
> {
>@@ -918,11 +903,6 @@ static int bcm5974_probe(struct usb_interface *iface=
,
> 	/* find the product index */
> 	cfg =3D bcm5974_get_config(udev);
>=20
>-	if (!bcm5974_check_endpoints(iface, cfg)) {
>-		dev_err(&iface->dev, "Unexpected non-int endpoint\n");
>-		return -ENODEV;
>-	}
>-
> 	/* allocate memory for our device state and initialize it */
> 	dev =3D kzalloc(sizeof(struct bcm5974), GFP_KERNEL);
> 	input_dev =3D input_allocate_device();
>
>---
>base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
>change-id: 20240305-revert_bcm5974_ep_check-37f2a6ab2714
>
>Best regards,


--=20
Dmitry
