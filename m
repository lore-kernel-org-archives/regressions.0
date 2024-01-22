Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838146456
	for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705942521; cv=none; b=X0XmOjiL5tCk9lb0gEmy+f3FCDzoXXPvlK/IC6a9PQFE9xb8e+i3su0qJs723RO0aD9Dn3GIfkoD7N+Sy9Snt7FmDNGG3jvtC7Sh3L4oeQ+uOoE2uX6q5Vaq2mD1Zw8LqUFLGHtB0h7sUD4EocxwLw1Ana4k4J+uLalA4cAuDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705942521; c=relaxed/simple;
	bh=8CXEZAI9p+rNkSoJMtDxmMwVqX0l1AUSjTzoof5EcMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O1Cqf38DGdQNHMMO5G27vKyIu/pYZ9TcBUHVjnXxaOyBzCENw1sC473Duo/O9akOLsKvUbCWrxWLa3KD4dz38u/AJr2M6iiWb5fzzkzXUT/QBSQPpIV07+wEpdJyVWnB+KbwEmdkJ1GGEVB51v/XFsAdeD4lsnOdf0TR8iJtjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=redwUopk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="redwUopk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28da6285c1so598023266b.0
        for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705942518; x=1706547318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eviaarrHpSZeGPBJGMW5DVT05MBy6NrnL0kFpqfkPXM=;
        b=redwUopk6y5NNOCpvkc+PVFOcqTRE5EZm5SjO4W6Lgj5roFvBYvMoIXETQPmhfT12K
         L8WQ3wq+9QKiOgulP6E2kPbssJJjvyuByEFp/hSrBIzFK16EwVIOH/QgQtDvoPiHAcVz
         ONgBpkxgd+BCigxtUuMtlfz5yoBIYn5+sjPrYyQEmHHF6/Mx+G1EE5LFrZ122XmWX7Wf
         GEPmBk+0GlAFRwP1GMR/sckL6GnDIvmHvgdW+bH8G6u4O0CZ9iGMiugfdd6NU/tuQ6xE
         tWFOVOQsZ/8MUzp48aAy1uJe+jyR7T0oQK98r+fpumwmtxwark1VnzFPdulyNJvfVJiR
         9Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705942518; x=1706547318;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eviaarrHpSZeGPBJGMW5DVT05MBy6NrnL0kFpqfkPXM=;
        b=UHTW080TtMQlXEPQ/3+HS63DMWO9iKdfXNG47EC5QlsFPOwWtA4VFv/mnttLEAdyeK
         gaSk4yaAc+U5/j4RL6arS1vNKwLYW2t2w16IgymuCP3x+rI512S5W2OAf0NF/1qw8QuU
         N1z3TKvRX4CDg38zhnEHfykD7R/3ZGK46ZcLTRk2LRweMFunv/vNgRT7QTTH06TYukNE
         QI8Rc2tpJ5WQcM34+Byl6pFoRfYdBUxH7fj9v5h0Jkdclrxhe08h8jKKWxtKjZOS17zl
         uIuM+Pr9/RLzE5vH41+EI9D1h3c45AFeZLBciiWp3MuJHSVUvHP2YvrKkfsKdcnAdOLY
         O4/A==
X-Gm-Message-State: AOJu0Yx0Evgh123RtFm54uF1S77BLryLJ2QN9gz/dJ/JnM0TkDXN3/r1
	8wRzExKHBGwaWuR1lJ1HAs5fXbIUoVvZb4f8VzHeDXeOfv2jE1IdJEBLBSfMCnA=
X-Google-Smtp-Source: AGHT+IFOG8Du3dt/lDW1J4M+ULamdNrT6bybVDkUdNDMHDaJXtSRu6jRB4UlD4OtxBYTEA6yaVPF9A==
X-Received: by 2002:a17:906:3044:b0:a2f:ebb:f200 with SMTP id d4-20020a170906304400b00a2f0ebbf200mr6058747ejd.9.1705942518382;
        Mon, 22 Jan 2024 08:55:18 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906538b00b00a26aa8f3372sm13401726ejo.27.2024.01.22.08.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:55:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, regressions@lists.linux.dev, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
 Sven Peter <sven@svenpeter.dev>, Michael Walle <michael@walle.cc>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240122153442.7250-1-arnd@kernel.org>
References: <20240122153442.7250-1-arnd@kernel.org>
Subject: Re: [PATCH] nvmem: include bit index in cell sysfs file name
Message-Id: <170594251756.17335.7078970144473561827.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 16:55:17 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 22 Jan 2024 16:34:10 +0100, Arnd Bergmann wrote:
> Creating sysfs files for all Cells caused a boot failure for linux-6.8-rc1 on
> Apple M1, which (in downstream dts files) has multiple nvmem cells that use the
> same byte address. This causes the device probe to fail with
> 
> [    0.605336] sysfs: cannot create duplicate filename '/devices/platform/soc@200000000/2922bc000.efuse/apple_efuses_nvmem0/cells/efuse@a10'
> [    0.605347] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G S                 6.8.0-rc1-arnd-5+ #133
> [    0.605355] Hardware name: Apple Mac Studio (M1 Ultra, 2022) (DT)
> [    0.605362] Call trace:
> [    0.605365]  show_stack+0x18/0x2c
> [    0.605374]  dump_stack_lvl+0x60/0x80
> [    0.605383]  dump_stack+0x18/0x24
> [    0.605388]  sysfs_warn_dup+0x64/0x80
> [    0.605395]  sysfs_add_bin_file_mode_ns+0xb0/0xd4
> [    0.605402]  internal_create_group+0x268/0x404
> [    0.605409]  sysfs_create_groups+0x38/0x94
> [    0.605415]  devm_device_add_groups+0x50/0x94
> [    0.605572]  nvmem_populate_sysfs_cells+0x180/0x1b0
> [    0.605682]  nvmem_register+0x38c/0x470
> [    0.605789]  devm_nvmem_register+0x1c/0x6c
> [    0.605895]  apple_efuses_probe+0xe4/0x120
> [    0.606000]  platform_probe+0xa8/0xd0
> 
> [...]

Applied, thanks!

[1/1] nvmem: include bit index in cell sysfs file name
      commit: b40fed13870045731e374e6bb48800cde0feb4e2

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

