Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21436B98F
	for <regressions@lists.linux.dev>; Wed, 29 Oct 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740610; cv=none; b=KMBXUlfFbZVJpoY9ZxWi/byWfjwXMWsfIIGgNPDMce2kOd84vz9BwYPUfpB2ZINi6xeQQK0HKMxQ0YVyvd+kATSKY2f3DMPZeH0QVLE9KiEzMgVjgqei51ouPTZV/w2+alkEU7jycfGJwUr+w9RRSFk0zveI8zO8ORO1ux5Cbv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740610; c=relaxed/simple;
	bh=GHebTe5G7CtxFjuUCS9MwRFp7u787YUWK2Q8YSzn0h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1pLc9iSy751Unak+M9CdNSA7mqOr1CQEz5mvdNzXzoB62mgyFN5fnaKZGFoZf0ArxoDBTdv21tmCEhKssqpPQDGX2P4ZApVdFVZ/obc3t0eIV+exF4JjtMyUQ0ejM1vjZVfQ02Q8kJL5YBnqBLrQq5GDydqLtUQfSmyzDUMnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYQ7lhYR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYQ7lhYR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d83bf1077so490053966b.3
        for <regressions@lists.linux.dev>; Wed, 29 Oct 2025 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740607; x=1762345407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=aYQ7lhYRO2v3GN/9C6Sid3E3XXXKXzBa6qhrNU+tutnfxtuU6NI1y+t8z3gzjtW6V1
         bvGqNcvRPgGJk/N6a+DAxCHalDS8dQZa2ZIrTDDEu2fFoB1711S6EJFSAZe0vR4Q9n/c
         RkQt2DxhF/lveWbzRvIgmZ/5YoMS8JYVQEVW1mzUq4vT2nLKJHt45Dxo9235WPHGWRCJ
         OHJtercZY9uLyLruAKE2FOjZPKFnvfrAR/1dpulSAkaBh1tp7CY3EiZACl7qKUcUJV6T
         CZ1jS/6JKzYUWO5s1+J25m2XeY/pO4lmjRXUf+Do4RSxl4Jn8c0YOBHcwpryR+RAVmZQ
         4INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740607; x=1762345407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDFNzSZSOfNylxri3WZM3/PhA4N5a3TRvkg+xuhc0cY=;
        b=RwHWsljAGPTosmRu7PRTcuj+D5/U64wrtWKDETg2/Pu1OAj4NdUlUq/YZRfSaNSp/Y
         KqeRYBqcoPuhnkByCGVJFvGMFXmTclWYCcFUYzFw2q8QYCrViqd4jMiwdGQBQUOPV4XQ
         EcZF4Uyjv/CBE9+QgV/CKO1xuAbVfhpG5qt6oSZJKlBb8q+owbEfh65+mEbj+MGBQvdx
         R26nS6UUzhFTiTyBfgaYA2hKLL5nuoEgcTSJL/2n4kXo4fW7iVJtfJKfJ3IdCRXJHCYz
         Lym+yoSCJc2/ckrlch0J3pv80mo6NkDLcsam2/s4xWHh1quGhz+4gxZmIU1x4QxrP0w1
         dYEA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRkJ+GBKSP4DqfTj4XeyRJoLhl147G777zLJ7arXpYx2lgg72A2sUp6AOMLUoYbGrsC88szldDpJ1wA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+bJ8TYJRr5H/7zuPMlaMEzbYBCDbA300Qke3zFHIqTCUeZeG5
	O6blo9ArbUGJ/FJy+i3PQyD3S4TNahXkT5cLQeaZkegL2m/cB2xL0+sg
X-Gm-Gg: ASbGncukzPN5FZdH2Hf0QHe4zcKIDxF7tQz3mrFatESgr5N+PELBpJgpJ8d2Xp/lSm9
	nZ22V01yQSY7KEEJVDqtc8yHgYMCfjmokq/w7VmxEsYLoP5Rgvnf7B+MgHo5AFn8mtMj7kbY8TW
	axAWXbeZsXJyRgqFWNFxrnH+Khh4fRAUUU7Ik3vGCCAbENED710Xlkqpjbk39sNlERRD/At77wk
	Y/mBD73Eu4EjF874GBXXZPijpjAzt1iDc96meKXxLgwXx/Am8keBm+WVWcwXoaS3jTD9amSoPeQ
	GrWU83NGH42CLOKKZ3kzn2zSw9PHtIG7BfQd+Ya0mfAwGH+8rm0jm8OhEzZ6WGdSpnFe0O/JAnB
	0yfIXt/YyGnXVKas66+TsJA5K/952RIK7lDkFlG5YcYzxgSzzqQaCTxqWB9hhE1B4/B9FKR1IHl
	7E
X-Google-Smtp-Source: AGHT+IFZ92S7NaPGWXm45s0LWGTqMNYg+U+gNAWRIpECOO59GP6wM/kQVqXjgCnLzIvK7qpJfcLAlA==
X-Received: by 2002:a17:907:728f:b0:b3f:294c:2467 with SMTP id a640c23a62f3a-b703d2cdea2mr273434766b.10.1761740606866;
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b704d7a9867sm39889766b.46.2025.10.29.05.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:23:26 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	dxu@dxuuu.xyz,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-kbuild@vger.kernel.org,
	linux-sound@vger.kernel.org,
	masahiroy@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 29 Oct 2025 15:23:21 +0300
Message-ID: <20251029122321.2872-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <878qgvgrk0.wl-tiwai@suse.de>
References: <878qgvgrk0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I just noticed (when debugging unrelated bug) another thing: whether audio
works depends on what initramfs
generator I use. "initramfs-tools" vs hand-written one. So it seems that
set of modules loaded by initramfs affects whether audio works.

-- 
Askar Safin
