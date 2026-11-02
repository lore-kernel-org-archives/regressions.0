Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793592432;
	b=kg5isSUt6MIeLx293xYOj+lJ4ZNcFBcfZEr5cdusLeYtDFWyfe3ilv9vPDyWmNxxRJoc
	 oUjLoY93pWwfv/Tvphvmv54ZVzsDjm9smC1c/lYU7dtknhWf8syyM2RI1RosVMOSSBZ0S
	 JitXAF5Tm39QB8bU2og6bzWWnwxQZ5EfeCov9B8prI2MYCYtNaPk10Eco7CH1qUsDM8D3
	 Xc2w/W1LZMLgin6WyVjdA0FMrbNXvDYKvlL3kFldW1Yucmq8fm5daT6QzBM5MMIAyZbwB
	 AqoBKHrC+sHn3bMO8DLxyOOZ2184SM2z5ZTwx6PaTMA18qLH7eFiRUYp9Hc+8IwcFKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
	b=TKizTpVAqO+fBhoiaySPFuHdQrNKEhO524p6fC9sqznE0TDHcPgeNPRnnUA3ordu1ftt
	 xYNkRszT2C5uzYS4x06JXO0bUuJ/tcxXtiNrbHG293cHGOXRqiWuKYvvZCJGAL/gxImsY
	 7gE2tEyzkhqDNIwaYAIoZZUYse0eoo86TYtGpB49OmHP74cxAdICtdD8h15ycFXHe7yRw
	 dLf6BrX2Ac9Y3kwAgZcQVYdOhKrWLoGdBEIXCdGttSJUk0yxVCIilxa++Gu9+V5k9A8dB
	 cHXKwKgnxhbKEdvus1hRK0s2nz/7P1C79M8O2NESvVOt46/VbTa6cOZRrhqxoVPPxyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMJsALto;
	arc=fail smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5741606A324
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 04:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5741606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMJsALto
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd69954c755so1817421a12.3
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 20:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793592431; cv=none;
        d=google.com; s=arc-20260327;
        b=BIZSC2XHKKph8QR/yIlEVqQyjoX4e22LuKa6Y36EtgDYOs5w3yRrjEPAis+s16Y7st
         mi4hobKEgIXrbWGYPJ4fiuzI7aAz81RzWnnAFaX3yCbDhBNHM+lcUwLsQmhpUcWrJSfC
         EoNhT6C+VwYmqXf5JKm72hPhmR9Gex//F11BJ06sBrRPXjwFiPquWNx3ZOrdYVldu/b2
         pMALW+m/6x4cyfbJ7R+oBGRz7pvt7db9jQS1WlEoRXnRQUJFZVAg7hDiYHQLG6p4a8na
         JR8+9cpd4hWsYzcUxmYH2OVrmXd1bD7GVyEbEyZ1lR2IPl6YoDu19PErayXBrLvFxuZ0
         QMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        fh=0ymvY+FodRk8JSLn4x2G7ryhreiGyTd8oe9ygmdr7NA=;
        b=IIwLrBOiqP4RWOLMXJAXzZr4IoX/sZ8U3C1YPTfFPfdaY2Jic4uv9qoz0Ehg3ysxjB
         mjULhGQMoGJELshJGg9PTXs4KczkiRR4dbEkwzrGXg9solBBM5Yg1MyZOg5v09dVpCNR
         eOREW9AiWeoHXOWMwVE+xWBtx90hTEIJrtXGOmgPyAYgSg9F8vkTwok+pCbQWeoD42ZL
         hqatiuQzlgwFED0DaQ/cvlC4v985yjYuNLkUnz4JFYJoCul19teQMKYrkUPJ9Ah7IXM2
         oE9XdfDl7ceDmesRuDY3xZroCLNOAUH09WI7lQPeySBwKTuoMTZ21dhAt98+tuQplO1P
         1bvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592431; x=1794197231; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=hMJsALtofgtZFDNN5qpdvuiJsSguK3cCoFG5JDPKQyL+cD3c3jN3ikg4nvtwVOAGaX
         YRwXXpnvcorxVeTWJtlbYC+pfYcv4+DMO/o0o2rLefNdSHpoiC3HJeCLsD0+aRCngWmd
         UeOEmcsEVoxOIOUAaWEb7PMxB06upvw5e4riqitlLM6V2k7tpt1Vgfebv010yq04/wNB
         SivPXUQ7wD90hOBhW2wVB5dljHZ35oJHTbv4W+Pz6S4j0HngazZqpAMBGtPgF6HgYfUO
         42CiEWC5IHBHt9SV+fEw+28l4PjhCIzrWFcx4MtnJwjIu1dsQFWXIbzqIvx8JkyRrwv5
         ZfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592431; x=1794197231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEjO7c3R3X2bsEgV7r7+JsM+DEZrXYUHNQTP6ex/oYk=;
        b=l5BYiQw00yBIoOYW6ZlF6QfQI3yc89WrpX+Rcm+FlUxQnlMBz0DRNF6vcqoa36s3Hc
         BFHJsjJkTYrgLFolAZa6jPoqh8PJ/2+ApZV1nmHW/RtgT1lptFl7FTZgEkrMdo+VWAZx
         AKXuSfH/Pk9ZqE3oFT12jkD7gYSndil7PdM0cCWZOM3SEBwxXYPGP0J4ga7bjG4sqr0S
         ypypgop6Tvvr7ZRRJ6ni8qdhzJdwHoG+vMjmDpVlqfgh3wmcjXCLefvugvKDbwMnaXkk
         nblINGuI9jBZoWmz+auVpSTFUSfMRlgBsMD5ooyHz2zjGe0CaqiQDrL99Y6c55yzPHrn
         6Lrw==
X-Forwarded-Encrypted: i=1; AKwUvBz5ctJfGlh/IxmmNYg5kkIuy9rqGfV9a2f4thHb0NH4kSHvLwJnK6xiFEzL36rqXtjHhJb40McrFYGpgg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0MvoHLVN/Cs0OuFgRFAdbosZ4lIU+b/R4iANri0R8rvel64dF
	ZpfJ/hSe7Rl/kIm2kJJszM0hVdxOAwt37NjNvBi1ZszU1/PPiQxQMMIEtwg+EgS19nVwI1GNImr
	9CtHqO9mf1y3Q/OykFgYEvu8aWg6RCxQ=
X-Gm-Gg: AYBFou1ITu6fU/R8vh+uTvYrMe91ThdKNeZsr6RKUyq+eRzUj94Sn7BXCFl52P2Xxa9
	LfRTTpQpuhRqv61wWLMMpYgdRGem26kcFOmBBPV1PfD7fm6p3WLolrN9srKsfdy4N5eAubJRwOT
	+jAvCGoPAT1v0fELKKD51eAhFFAumJ6QdB8YUl4JYCDf0MZvnFn0Ocr1leBPC+sQthTGevSe5+M
	UWgLajwPtd6WbP5SAEQEIoCwxsJe5j0lMyV3gqStliPT07Iv4FZlaHlUxbWCDJUDTJSDotYOr7Q
	d3kOI0R2aFg6VZI5BVG/PY6fp02HnwFDe1mxkln1Fz9uRFS/lKQ/Z/71aXHR2gF9Jeo7dM1n96v
	fTAZcnBHowMxKzBa36R58LR6YXwhzeLCQ92c2oN6/gOm49KLDpweEm/n+yQeHq60rmlEuY3sGQh
	WDXGckr9G/NEbO0Qh5siJf9CgMBETSy2L2/hr/vBL+ugS5Q+A3
X-Received: by 2002:a05:6a21:9cc5:b0:3e3:37ff:378d with SMTP id
 adf61e73a8af0-3e9289d48b6mr7780763637.40.1793592430971; Sun, 01 Nov 2026
 20:07:10 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <179301363708.752130.11323881261715222213@pm.me>
In-Reply-To: <179301363708.752130.11323881261715222213@pm.me>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 2 Nov 2026 11:06:59 +0700
X-Gm-Features: AclHuK-Gw2LzF3mHyz4xOxxQKV5R0e0KWfeLN-nORpS70vKs3u59r3GyDfpcj_w
Message-ID: <CAABR9nF+HekdvUboATGc71JJcA-DgYdzQVBzqb_-wx3QbvbhjQ@mail.gmail.com>
Subject: Re: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA
 since v7.3, jack PCMs cannot be opened
To: Robin Everaars <robineveraars@pm.me>
Cc: Egor Poderiagin <egor@crazyrussian.pro>, Oder Chiou <oder_chiou@realtek.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthew Schwartz <matthew.schwartz@linux.dev>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-sound@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

>> 7a0886826308 ("ASoC: codecs:
>> rt721-sdca-sdw: Propagate regcache_sync() errors"), later simplified by
>> 2df329044c61, makes the resume return that error.

Thanks Egor for the detailed report, and Robin for confirming it.

I wrote 2df329044c61. Besides simplifying the error path, it dropped
the regcache_mark_dirty() calls there. The commit message calls them
redundant, but they also set no_sync_defaults, so with them a retry
would skip entries still at their defaults. Without them, every retry
writes the whole cache back again, defaults included, and fails on
PDE23 again. I still think dropping them is right: after a failed sync we can't
assume the hardware is at its defaults, so writing everything back is
the safe choice.

Adding regcache_mark_dirty() back might make retries pass, but only
because the rejected registers still have their default values. I
have only looked at the code, not tested it. The first resume would
still fail, so I don't think it fixes the cause.

I think the real problem is that the sync writes registers the codec
does not accept. This was already happening before 7a0886826308, the
error was just ignored. regcache_reg_needs_sync() does not sync
registers that are not writable, but rt721 has no writeable_reg, so
regmap treats all registers as writable.

Maybe rt721 should have a writeable_reg callback. But I don't have
the datasheet, so I don't know which registers should be left out.
In Egor's traces PDE23 REQ_POWER_STATE is rejected. Can Realtek tell
us which registers can be written on rt721?

Egor's patch looks like a good minimal fix to me in the meantime.

Best regards,
Phuc
