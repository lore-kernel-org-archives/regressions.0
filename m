Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557316;
	b=5fCmhL4TfkX1e0nAk6CtbBN63/AiyQkk8sbBoP2bOgv5dMWiP9N2rUYBq2jxjWuWGg5u
	 umxF596LlfXhOV+D3cowT4TT5GYz30YwcsagFQi8TDsHpwA+AaPu5JZHrfWj8psdB0QaY
	 nQqZePHpaF5zFUiAu/b+EAmMdN0F0AnNV96Txfh4S3O3+d9geA4GJs2yc+8cXzdWXZ+gw
	 P2rPVP1QsmKOCy/tGTHkxEx+gTUn3wm42TfrBL5Rrmgy4PAv3eEEVzYekM+gTd+zMXEgs
	 a5sODf258RlhIf8nK+gClCaTwvWIJL/ZIvmwzyBveRRvyDwWsHXP8hks6Q8PUqVtr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
	b=Flwh0C1Z2peRRU8B7yB46EbeTsXjZ5PspvA2ZoGY7i0ctzLlLvJ43FfDtA/Hwp+zWyM4
	 3CBivbcUG+J2sKECRGiHmIpgevu1DSde5L8VZRKlWafl4SDyZuRgO19sn+sywu16oFhyU
	 g9bjq66L9FesEbU9FoZk15tqS4vPrl8XAIcW/lTfhpbHmO6Q8A+BHgX+XXKzEPIvQkqD/
	 rsXmA1eIimDwnnN1WtV93ny/ev8G0y5mpu+VNb69M9a1D9/9MdmP5vX2tQh+jJLEC7yE8
	 MEx4mG7LOIn6L6ZG+wS1f53E/sPGUJra26jlRBboopPRaiZy5HOlOuu9u/MOu870U8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDeWA4+i;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD8606A31C
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDeWA4+i
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1012041a91.2
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557315; x=1795162115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
        b=bDeWA4+iaQewTAcgX+YoIPm/fDbPaOjcyXbsWde07D0t/2vSqtchZGU/09O/6MgByL
         ZAM/doe5q/jfUktpCIfRkIc8OvJo67Bc3YL4vBHTEChDKuIKuJchWQFu7xop/DkH38An
         48OHsERbWx3uAz6FVDj/cJyKEzpGn6y99Qb8lYcZcu3PxmfdC+4YYP8JxA8MuCZjaMi8
         qarTspniZ4kjsQYpBRdBfX1WpPUddRFQrxNiTCOC5fccTDMqqQmTrHNwkwcfaW8asx1K
         BuoQwIUuJl4oHDHZDTtlPsvVbnA+7aNIy+GBL1okMBsfBIQ2K8f49Q20Tv5S0Z0UCu4w
         9mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557315; x=1795162115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
        b=XiZbP5+SQUm8bhXeeGdK/AP/ZXtJgbC1bDqq8H8ecZKwyvSgSM2mp1Cdyoav24g9n3
         xgqPsff3sYHvNuVTMxPOFvdPx2RC7P50VbYycyLkWimFTBOW9l848TTg7yKBY9Pmq47v
         d9Fqvqb4LB8+yQsLh1RAL4xrmen4L+h1voS3gb1w/JL4m5OAsD0jC9H93Jp/l0uZj2Zk
         UqJsakdLyrZvlx9JIEQCZ6DQc2QptCDR3AjRSpksE2iefNzo1IS5pca8KrjXD2mwWLwF
         8wv+2xUoXUH+okDsbLxaYh4ECuItcd4+9PJgoVKHAFmGnQlsm7tIYapfbk/y+moPrjfh
         g3Kg==
X-Forwarded-Encrypted: i=1; AL+hErEADNkBKIeB+VjD2Ud3C21ONZVlNulyGiB2T78SWGhv8b2MvrR93Yk7vb+i/BWmMOsi5j24vIs4q/wl1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9TnrNeSIZlkfiQfc2+cbjvifZjtk6rDW4uthN6CugAXYaTczMh
	0ZKm4rjeCp8DmA5iKpONNF8JechW7yfv9X2NAQATvhoWrMHMbiN0GWi7
X-Gm-Gg: AYBFou3X5RqnxfgKwBqFeUmC0bc9m3WPMQQHIot8JHUp65+w0vjptGKsvwBhKSdGz1W
	8N5H7niPGj34/atJFVzuRwANfH4sMe6155t8+4z6x1z17Jzj7ozxw5iugG6G1PdwF+9nGnFA+/4
	u3+CPhKwO7+DlE279eykvxHE7zf2NYznAKBPLMi7tvch8I8eOU3956q1jLgktl4+BeyJcc9uOLf
	QT8OIoL6Q8X8snKWeMorCJ2eHYbG+GItrP+VFY3rY7Un7jd1UzD1MpLWHShlzFWlPiXalgd4sSG
	dXV1z/ShP10HdIqdHaSPYw8oA1oQpaGk6QC4VNBdwuSy6wqwFvinDO0+vb90KmOyETbh/XIYZxM
	S6B4TTKSgLHDGwKtmyd/zXYZga+PwRu3ztw6mGfz5fn6LXpw048sVA/BpZ78p81c0YcqGH7/TkM
	w7SLtcof/VNgihR4OFXwqyuVXfcvQ9HQPA5PGSz69URgDDLSpXwFd5+ZS7zZAPtMVXXf5TXIe9z
	i6DUFV+tYkcZGJbHtvrR7JTswv1T3zoT9Yr1vBZxOWn5ekpVKiq2jEvAYgD5YVOOTD2RTvZhZDZ
	EoSvtU6o1iWL+rpb4MPK2uiTQpd9OV293skDVAXIYLwkHe0juxQO65RZkVyGyD5Q/gVMFM6ca0f
	JQ2tt3pAZdL3TLNBvlhVUPmhRxEoAmgv62UysOgJwtnmDJvu+DR+u207vTbWE2A==
X-Received: by 2002:a17:90b:3d44:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b1b0cac9bcmr1635031a91.41.1794557315458;
        Fri, 13 Nov 2026 00:08:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d282fdsm8593956a91.14.2026.11.13.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:08:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
Date: Fri, 13 Nov 2026 17:08:29 +0900
Message-ID: <20261113080830.1459856-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e320fab5-d4d4-40fd-b032-d64554e5c0b0@leemhuis.info>
References: <amzVtgQb2p-_nShU@debian.local> <DS0PR11MB78800B96A0FE637DC5390E4AA3D62@DS0PR11MB7880.namprd11.prod.outlook.com> <e320fab5-d4d4-40fd-b032-d64554e5c0b0@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Miri,

The same happens on a Dell Latitude 9420 (Intel AX210, firmware
89.123cf747.0) with Intel VT-d, on 7.4-rc1. It shows up when iwlwifi
stops the device, on driver unload and also once at probe and once on
suspend entry:

  DMAR: [DMA Read NO_PASID] Request device [0000:a4:00.0] fault addr 0xfd8ed000 [fault reason 0x06] PTE Read access is not set
  iwlwifi 0000:a4:00.0: Master Disable Timed Out, 100 usec

ty-a0-gf-a0-89.ucode has the TLV version 0x00000059, so
IWL_UCODE_MAJOR() gives 0 and the "<= 77" check turns the reset
handshake off.

Your "wifi: iwlwifi: mvm: properly check the FW version" fixes the
unload case here. Unloading and reloading iwlmvm and iwlwifi 50 times:

  without the patch: 18 of 50 unloads hit the fault and the timeout
  with the patch:     0 of 50

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I could not find the patch in next-20261112 or in the wireless trees
yet. The check also went to 6.18.y as 9dca67624721.

I ran these with Claude Code (Claude Opus 5.5).

Best regards,
HyeongJun An
