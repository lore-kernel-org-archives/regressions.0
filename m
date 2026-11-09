Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242584;
	b=BzvRJCff8Z0Qu4S0XbRORMcgfBbl1nLYbmyu46LMLwA+vdZ5jprxjjVuxx/uBfyAysmx
	 IdK+wc6G4vpOpTfPXKx7hoaMEFPNaxasVBo7bJ6bLLmCM1isxCv1qBIkQnJkUAlN/0GAR
	 Ax/cAGJu1Zso+1J5UkRauQrM44D0GV6Fz5VlzHHHjrplcYhSA3ZHCbxt0oqoVPkZxnSVN
	 lAUvpXB9pDWU7X3d/SLyXcw87BzkMC8yxNaLOEaX9d3g5CNK9Z2kokUYmYL5FHlQXjvN0
	 0hdbi7i/EngqB8O/lg49RAMUfn6nYenLh2Idvhdj4PdB5GOmj6epW21vzQ8nDWCYNUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
	b=c9tJrPh13dBofRTtVI611C3Bw7YsgUt+qApWaokvpJp4I9YEPbtMMwCogQyE5onTlmnc
	 FPV1v4ic61Kp289RrL5pVV81GjG9Pufow38DzaLWvcYfHN91R57nW2QhMx5TaJQh4vreL
	 j6Ds3Su1KZEnXburbgA0Ae6Kl3EaVIZSQ8AO6n5deWOIic9mx0D1pByDjjsgKoI44FIL6
	 ejg1B2Bbv81EuiDkJDnVLIVb/VMp60JTo+w2sZX9nCieiSRGJKrI9ZLEG4d4NNGd2hkUu
	 DlMt+oXW7wZqF/MgLog4NgKBdglutpWWmXpjH6Uw6v6VM76M0+ad+o/VZtw6Z58boyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JEgpHmM;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1E1606A33E
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1E1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JEgpHmM
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11278695e9.3
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242582; x=1794847382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=0JEgpHmMLPOelbfzdFWaoWXhXeq5pzzdX+/ab7demVoAD9sa3glwcvyFozBSiLYat1
         /fW9rkyA2AGJlNDXIKIRmbdfmuHtxuXgakyg2oz75+OYAhyAIm+qJOlEyaZ0x6tP3ail
         mkN5ozUcB2GG0EVBldjeIT2cseN+pVGE0BR8R606Yo+TPjbzEG0iIq1VkGEsHshC5LaQ
         na54NWR3Nr3O7b5qUnjnEQh220+Zuqx6A0Yl4+OwQ0CCgO5PXouhiVvOySfmMHxS1J9I
         d65cr1OA4oaALSY3zEUMl15dw5T13SbeiB2YRX4EYbQTsAJeBWxUGojeEvGvyRDdg9Lc
         iMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242582; x=1794847382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1p3sNv9U0haI1WuvGOs57nA1tjZY34nraLgEt04/CiM=;
        b=qEHzWvffZ2Vh1YNo/AymYkFH3fA3ffvpmadXwEqOlDbBRh4U8q6FQ0hKFwXXjqFNKk
         3+Xxlc4oKyk5kHmKATHXt16PVpPBsDRdeZkUiBXoVq0UIxFn2C2vsXpx3C2qgtuGZWJt
         V36sES0SdQcFAkkCIWblpl7EJ9sGI50h+3bY8OyV9e/vCnqfLW7dSD67ek2iUxBnK260
         N9RT2cLWumjI1M4IhXvx4PXI1lZ1RqHmAjIkR8anziy64wpEkTG61S8TA/XqRSXY+Aro
         M8rru5LCf0Poa70vlvFnh+2MomCxZbS59vzgtXqEiDGz5uxP7tF1NVVzSa3Ephw0PvWY
         YIOA==
X-Forwarded-Encrypted: i=1; AL+hErHJByDADOMfzgMluAzFgGq+E6tpJygAjicrLbLhjsuWr5xFplF2ZBqPRX10c146/0XS3k94uGtTnd5B0w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/W9yG967WhoqK9J8I3Y/U2L6BJl4V01xkUBorfyosFQ/lManWY
	eHmBiKTK4fFKqa+EQEX0R0jpkjN3+uvCsITGZ33luB7Deq3myBzQwUoPIFoD+cEnDQ==
X-Gm-Gg: AYBFou1Fo9GibhT7kxEBJQMZL/3mFqYC8zFGETdJiOr5GfsbkdBNoWhrFvpKy34m18T
	D+cfZeIv1gtu9nZ+TG5vSRVRjzTuVCdVVr2+FLCOOQ5zljKcvP/1yBoItGK1f1TPGr68QtDpEHb
	jZvsF1oqhVn/VyGpAenAA5FrZf6K7ylEW+HvUyD2TwZIPTxTs0jRUyUnGz1LTXeivyDJN/hw2Pg
	H1fASjsn0wFM5YycqC0iPoPfOFRf2p4DKl6FUlqgKSgqcPcdr7tRJBX4Sb0Si60mAtr7lGYJMsM
	TutIYa4Lgvq8dzYtHqTOI/nZOf6i7eYI9/YeJSpzjbRENo0SRXS9lhp1JKn0X09z0pRsRAgcdDW
	DN6Ocro2b0FHB/EwEoIZcatef6G5i4WxxKyah74ebdjYsuC3sZry58+545rUXEyJ8e/Mf3qoKHV
	D7em3Bzjc/H+ToCCxRMHZ+yu9W+eHOiQSaQ9lyUSdWYoA2NIr6HgBfgBooDPls1oxMqN5MxjZnJ
	z+tnPiL2aED7lvXtSj5QpjZUoP3VOZmMeYmVIurn0X19jwvUJQhbWZcC+iuodQFh5la1rSg6f5b
	oa73r5RkOOdCVZff5yAxW3cQXQvMeVcJDDL6aY/04Cdzag5GY77414dbbMb7FBrRZPiVJMY4BTh
	Bz/b6p7ZQe46qcAIY9hV9qu/YlyqXk+jkj6lQwLgkJdnb/FPDNUaExM5BpMfFSrtGXc12/Nv3SA
	==
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr96080385e9.5.1794242581971;
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm441798645e9.11.2026.11.09.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:43:01 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arpith Alexander <arpith99@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:42:49 +0000
Message-ID: <regression-followup.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
References: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
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

I won't send the patch I mentioned: Arpith Alexander already posted the
same change on November 4, and I've replied there with my Tested-by:
https://lore.kernel.org/r/20261103200226.100989-1-arpith99@gmail.com/

A correction to the revert option: there is no HM1092 driver in
mainline or linux-next yet, but one is under review on this list,
including ACPI enumeration for HIMX1092:
https://lore.kernel.org/r/20261106121907.42745-1-j@metarealtyinc.ca/

#regzbot monitor: https://lore.kernel.org/all/20261103200226.100989-1-arpith99@gmail.com/
#regzbot fix: media: ivsc: csi: Add sensor node in bound callback

Thanks,
Sergey
