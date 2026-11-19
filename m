Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057269;
	b=Jk9mFZbasZ9AMWwi1ujflNl5VGzz2l6ZkJfIQzxzKPS8PJWHIUZ+sbKJp3PXJ3qPoICu
	 U9fF5gDyuAihCVcyleJTjm+hZfpM9auRM+HXmbhxeWPNBcQBHxh6bNx2TMuEETUxBEjKx
	 ZoW57ZCo6cEqE00NHYCQ1J+P4+LFqNJINkngC56SLWnRPur4g1yJTa1ctcABcyD1tfse8
	 +GxzNrvxr1c1RgwtewOIt5OoMK87N56zdol2jgunTJplVD+DjznpzNI1o6ZpEtwtKf5cp
	 /eZthrgUOwE3zXsm+yuVx5ZrZIctCohNa0gm0rJV00skFL3BTj5xcSVm/04ZirwIb4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
	b=CjBpFhjPtznCIjPdbqaf5ymgpDCS+2dv0uWtdG5Pr9KiD3WCaKa6ETlai2sH/0yU1F6N
	 QA+sH4VBgm2UJ8iItSxfeopPFILKu4NfrH3WhiYZZ2sJQq2PYK5YnmySwoa5lU60ZtpGA
	 1lQ+IibxwynwmJre1mYyeX1bMDETO2bFs5OhjwegtxSHRNzeU2u51QfD2aQqBM8uUTZrh
	 jKRmea/ZHLXuOtAAlbWqxRjKdq1UeqUcCTT5pYJLxkjffMojKwHVQmgsxcYhnXUqJTaqL
	 4LJH761GtscjyLgveK/KIZN6k4T9bHI74FQ0yE+DGPJaubFh/5nZzIrx9nDZTLQ2tuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IN2XwD7l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193460A2629
	for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 03:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7193460A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IN2XwD7l
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so2723637c88.1
        for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 19:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795057268; cv=none;
        d=google.com; s=arc-20260327;
        b=KDB4lnHVV8K3bJ7ARYe1DUIANY+tJMwZo1iyhE3Rj4PmWDQulBhKLJcDPNAVk8bJPA
         qSnyNMQ6tW+Jxw0dLkpFA+fvqER9OKSp+u1gdeNx55i59wSYVJaxkhPqy7onPnmKlRki
         0UeziF6Y7mpmXAJa7vUt4ubMNQwdrGfzTuM6iMaCxIoJqj9FUXcYaMVKkC/j2ykWW51o
         +OgxY5ajbsOUMOPeAZNLiYD2gtVRqgbOPWsDvtmq0dj6FntkD3LlyCWD1h+685UYT0rh
         YipehKp2+2+mAIrv536L/5pPZasgIvFvJYcs8T96i0mj5fR9h/W2ofo0QhGAqEMBwndc
         Pgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        fh=d4A8P56guqEX4WY5v2mYDKXR7+b/1IT7FLIjzWm9UG8=;
        b=KUg6YguBfYuMHkgzPxXVs3l2vD/GxFDEwg3bYkxipDJFruJU6nDKIQ1xx+1bgouvRF
         husFK/Y63YU6T5mFwpTCDVQY2nREPZGYqZAJryeRhBcu3ifzgMQHlKeuzms/N2503RH1
         pLPePZJPRlyHUdpYJ+xLuvZvipS6jFSKvu5Djknk1w9pOXQ8Q8Yckpwa4o1CrAddOIjy
         DK6QCIw2a8cAH4mr3fzPkWh6CTqV9aRioDKnvpULQD7hbO2e47sWq8KFcaPxbNiSGjg3
         TgLgdKHktkayqXRsSB+QfGGEQ+1Z6RRmv7viTrvh+C4g5xvUiinDMe+lMw4V/gQrsM4S
         Hi2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057268; x=1795662068; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=IN2XwD7lXJ8BA3mt76REvZJ0VZRrfWo0rt0UHgczVeFAsKu8N/cH83JQclvX7ugCvJ
         FekXpmMTneaoPoEPrfkh/glItFZVFwXtctQzL6FzyIvWWnrEVMgPnXfJC5+EIvweYapj
         6mdXzbXR7yDcGBgpeVLRP4Rrc4zH5uTKvL8A4dB/HbpA4czmVF/e3Nc0YS/NAIkzu8tZ
         KgK84ie7QaSX5HM/wzQ1OGNLMKXOJxU1AaUjeJgjBdfl1FPgor9JM6Gez5JELgTcwkyO
         dQxHi3pwuf9oiajcXnONXsf2BXwbNV9/MFByVIjYw1+fpCIiX1sswdm2ff04Jr0x8ARR
         n91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057268; x=1795662068;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=TWQG6+3EWc7ODRfMJwIZQI4MwzCb8+SQY6MM6uD++4CdZd0c8NRjqQwFJ0DoR6A5wd
         bSjO0qm9peR597OCjxRR7X/elnTcWKOMYA7+k02nO+CEr8vCZLBZOoBpeh8SZ8UdRPCD
         UZ4LFAZGAGBz6oky4eVNasCYt8bFLV9IP46N6VZtIjeLgUSvRtQLWseHCCyehxHG6JUF
         o6Ssq4Qsn4FIjbRsC0r8aNj0mZxFc6jmdLNsrtn0jwr9Ki2yCzTZzIQ3MWSk1p9b58Pu
         3rjA6As2pwJ2NLklb1hwFse5I6FUBUE/w8n7pQVFutyfUnxD6JE1g0D4OAsn7UfyAbzO
         HlLg==
X-Forwarded-Encrypted: i=1; AL+hErFcUL2YZHvAWMZK/ZXnrKXZH2oOgz/f04bgS4L6/KCJdYg56KZLN4LmwF3FZlGTaP4zK9P0G4WKESK/Bg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yBrwg9oi87CxjThlssw/xn2eEe+EUahaAhGW+/NPEqCwgK9Ks
	86YWjODEpO31NIZv9GXDNT3wBfEh/eT404UAAlMi4hlUx5LSqtpHcMKYPsoNSb+bV2QpELJIBld
	Mr++R98BW6J/L1Ylsnap9ISjEFFF+qqE=
X-Gm-Gg: AYBFou0N1JXYZYufRP1x3Tbqup83thu/bmL5vUuXeu8S8m3CbtmvihH80dzMtXcP9f2
	PIdiufUnouC/PYpEnavwfWkzpDc1Jw9cB4e5iw0Z9XJgCnh9BSG0qGwk5r1/jDoVB1Y3t8k4MAb
	TrV/GWtXqWRVZPQ87ZwEt+FTXTShm8jcuNJ4NeC9ZAvV1iT35OZztzNBSMmJfsXa/6acmhfjVwp
	6oozToOTNA1tEVntUlj3mm1l/fDDIm1qCUd0cgw1VZnTt+rsKsFU4AaHB6K4fTpLor36xsuUUPv
	QDkVVz+dEdYRvBVThXWVWv8qYtlsiW90doA993tg0DsEQpAXXj3Q05z0U/NydTB8RnbFx5FWX9D
	e6zw0FxYfbpXwyUFju2yo/ZGWW6gmCqSNCbUc+887nu7t++EkSo8c3gILI6qRjdhr7qQznb/EA8
	QdCZzbNJA9Dzb2hi+JJetXc6hDKPZwGoH7SNUndyooIghRJLHkjLU1EvDHiCemW+YURXA6AHFsa
	1xeSQJ0IbtmwAD3qdXOVP3to2FoXRNdBoqdzvupc22AE5r2OKv0eqPMMJeOhagTJ28S5AVkR46Y
	/V8=
X-Received: by 2002:a05:7022:f51b:b0:18d:9eec:e0be with SMTP id
 a92af1059eb24-1b543af02d5mr3572408c88.2.1795057268368; Wed, 18 Nov 2026
 19:01:08 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Jeremy Bryan Smith <helamonster@gmail.com>
Date: Thu, 19 Nov 2026 03:00:54 +0000
X-Gm-Features: AclHuK9nXomkhmMPmwPPA7MC9ZvJFm-hb8h2R8UJUevCW9DF2BMhpq2yU1eWGPs
Message-ID: <CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to
 Headphone on ThinkPad X1 Carbon 6th
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz, zhangheng@kylinos.cn, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[REGRESSION]

Hi,

On a Lenovo ThinkPad X1 Carbon 6th (20KH002RUS, PCI SSID 17aa:225c,
ALC285), the speaker and mic-mute LEDs stopped tracking mute state after
upgrading to Ubuntu 26.10 kernel 7.3.0-10-generic. The mute keys and ALSA
switches work, but both /sys/class/sound/ctl-led/speaker/card0/list and
/sys/class/sound/ctl-led/mic/card0/list are empty.

Both LEDs follow the mute state after manual attachment:

  printf '%s' 'numid=11' > /sys/class/sound/ctl-led/speaker/card0/attach
  printf '%s' 'numid=7'  > /sys/class/sound/ctl-led/mic/card0/attach

Commit 108704eecab9 ("ALSA: hda/realtek: Rename Line Out control to
Headphone on ThinkPad X1 Carbon 6th") adds ALC285_LENOVO_DAC_RENAME for
17aa:225c. That fixup is not chained to ALC269_FIXUP_THINKPAD_ACPI, so
snd_hda_gen_add_mute_led_cdev() and snd_hda_gen_add_micmute_led_cdev() are
no longer applied through the old pin fixup.

Chaining ALC285_LENOVO_DAC_RENAME to ALC269_FIXUP_THINKPAD_ACPI, while
keeping the rename at HDA_FIXUP_ACT_BUILD, looks like the likely fix.

Full diagnostics are available at:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2174970

Please advise.

Regards,

Jeremy Bryan Smith
