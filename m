Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88672136E09
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256274; cv=none; b=Ic6i1pWE8klM0mxLadkGdJMgRsF8bB3k5TBr+c4NnX26LzeDVEUC1yHXUJPtpPtS7BhtVI82FO+3VKDjlhhTK4q/zmRXQNhlxoXw9SE/x/UrIDlwYipQAfqtUsCHaD2BnP/mqusDSvt915aVuZcpzTN7tmE/JQGeS53DI9fz4co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256274; c=relaxed/simple;
	bh=0+ktvaMb9+xdI3BvRNEJgnY+N0roVpt98Vg//lch6Cs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WbQIe4HtxXyLqd0040QNgC+qPxS99hyNl8QuFIujZb6wzUWi8v5uI6zp0KF+f/M/ANGllEV6m5cdlJwpt4rLvl0u4dEcTvpgdRY4Ny6FL0/eoKEfI1Pfnqz7+hhkVp5esfh+62srlywhGdd9erUGlNCAJC70rboV8NWurN47+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBZ2qFHC; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBZ2qFHC"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7141285db14so1461501b3a.1
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256272; x=1724861072; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+ktvaMb9+xdI3BvRNEJgnY+N0roVpt98Vg//lch6Cs=;
        b=hBZ2qFHC5No0xLJR8vyRKqieRX4s6dbylYZJ+ZWC1aBzK+YhUJD3ZsN8Jiw7nVZYMG
         PIUvuU60z5QUrV9O6l2uAMlsqwl7Trx6g+OM4ZRPlYWowCThHGkNy9B9x+QZSQOnS2gj
         R69oup78Lkuuoj03b0E7m820Am6SmcSKpDyRMqHbCjlobWkL4DrydPJXCNJXpQ/FWrph
         LkODMXY1BbR7nSSsf/JYEiTFlUJkBsr2TG7lhWoEZ6HQHxG6CKv8L7OuuykYu+8qwPNh
         CYQOv7t806T16Rc6d0gVJULuEdofdb49xWtUV8tbe8WClVCGRUT7HH/WrA1noRmpjF7j
         /OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256272; x=1724861072;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+ktvaMb9+xdI3BvRNEJgnY+N0roVpt98Vg//lch6Cs=;
        b=C5pUhAY2A7wzWSJII5R9pJdPY1QWEeBnsCcYCdbsyf0JE6JQDQ8PdceSETDfEgjamN
         U68PQ2Pz4UqWa45aaokP5NN2jGyufCMuF8aYPbM3GVHeZYu4v9VK0BT6z25yoxTurKNv
         LV9DlOrDE8TmshPPYD+B06i4x+dkf5beSrEEgxpmkU0BkhbPyJdmnF8HMCKeRgxZU5Sk
         Yfekd5+j3jMlAQHS3TNe1KwJHyNQoj8emdEABX94DcIlPFyjUeXoK/qWy/BlTnA6Cy4I
         /oEOC4jeu/5URGz/T5ktT/Wgxv5FwhfBeCK+7H1xcY5EHdRBQVbXvBFrjDLKb+afFm4P
         Ez7w==
X-Gm-Message-State: AOJu0Yw6lkdbOuixSyGcg2mlHm1dDPsN7L4IX9t01CTRmRxFGWISgcAP
	4jYNJ4CLwraHtmKBdHYSz54UDdBLgG3EmGgadhAZ+W2YQf9vBfPC
X-Google-Smtp-Source: AGHT+IG/rbFlFVuwrw+YDsQyuuBns2vfsbiCf6DnPSaDf3Ohl3baq7iQSNHITEkd1eaXENVMWU6SNw==
X-Received: by 2002:a05:6a20:cfa4:b0:1c8:b145:29cd with SMTP id adf61e73a8af0-1cad7fc7118mr3702775637.24.1724256271557;
        Wed, 21 Aug 2024 09:04:31 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6365afcsm11222944a12.87.2024.08.21.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 09:04:30 -0700 (PDT)
Message-ID: <2449825072217d392b5b631e8fd394e91b22a256.camel@gmail.com>
Subject: Re: KASAN: null-ptr-deref in bpf_core_calc_relo_insn
From: Eduard Zingerman <eddyz87@gmail.com>
To: Liu RuiTong <cnitlrt@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 Aug 2024 09:04:24 -0700
In-Reply-To: <188a0d1310609fddc29524a64fa3c470fc7c4c94.camel@gmail.com>
References: 
	<CAK55_s6do7C+DVwbwY_7nKfUz0YLDoiA1v6X3Y9+p0sWzipFSA@mail.gmail.com>
	 <badd583d09868ffdd48a97c727680ca6f5699727.camel@gmail.com>
	 <188a0d1310609fddc29524a64fa3c470fc7c4c94.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-08-21 at 04:46 -0700, Eduard Zingerman wrote:

[...]

> will post a fix to bpf mailing list shortly.

Status update:
apologies for the delay, the fix is trivial but I have some problems
with test case not printing expected log on BPF CI, need some time to debug=
.

Link to wip patch:
https://github.com/eddyz87/bpf/tree/relo-core-bad-local-id

