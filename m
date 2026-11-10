Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794334909;
	b=z5KVX4r/jHduv6s+6Uq/GRhnloCdQcfXfXQylaty+Fn9K6QJ3DKAp1ZhSzdF4QlTmVS1
	 lfLIEJlaBf9TJQAosg8MO0VLRxFtewJqng7pzYWxYyvykPxM7WaKnEkl3Q1LTx2Y0Wo2B
	 v8WL9AWDbI5KMQ9VKmIXyS+gJjDZmkaxYPNvfStDVxvIud1nU1suVeRAPp78cgWxyW1Ed
	 8bgHWAWAxmZ1r1aJBMxbKNLQQNvTg+bKRny0WDoilqXPsz9zB6TZ9j+laAiVTRfS7ZAkz
	 ouX08ZStHcDW2Ob6CyTUmbki9HNmU2XsIEc4wxSwn15TQxSYmYUcncX8feodk/XqhOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KkrLPYmWHC65m+X7h2ibulaxDmjHUX/XoIkIgUVS8Ng=;
	b=MB7XyypVaUa0+gXfxRVxSxUfE1RITZTJlox0xTIKKC+QdmQkNe8NO+yiBK/xM46Y04LW
	 ESfAa0YkFcw3m1CE23OlWtArhxutv8sfDcRl/S5M1mut4Agl8MJxnCwIgJO1aNm9YpCPC
	 jaEOypRpUKd9vtaXSBE08GwbBdX9/Fk2z3ALG3zGX0dgrAHC/yUM2R8gXiGihh9xQa2vd
	 DOHtGP1/EA/8gqEGrYZ6zDHLn77QG2eNPPJg0PP0KgG3fiXFmKXRTAEVvhbl1r6jabTwE
	 sK5Rvl3/2ASV6ACDqOzxKbUN1Csm/LOvnbRyJhwlSaD1KHZKHo0/ef8jZlloTlpnqpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vblX2o3e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116560A2600
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9116560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vblX2o3e
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c05273c38so2843502d50.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 10:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794334908; cv=none;
        d=google.com; s=arc-20260327;
        b=GTzmrp/xFVrZyoVivJe6QlHXE/V6Ee/SNn3tmmxcRnpmD1A2V6bXY5zF5n7+TYljGM
         otKewuejrEEdx27j116GxFKgoZ7qYnnqr4Cf0kys7lnMqutaZa5i4lb2WtJF43169+c2
         fgSgZ/tXu5bhos9LQWJLxjtVHpRObEUP/PRY7UQwKVyDs26FM7l75bTJGnAlttCQ5cBc
         J2UlC8CqU9kRfIfS62Sys/obN/80DKkh89dT8uSCSx9eM9jxf8jf+ifF/3hNQWfW9xX5
         ZPbjQb1lC4cCR0P4ovsTr3+QXLK6i/gZWuTRNXAy9kYOyNLBZIaM0MdZ+HIPpCH/Utif
         IO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkrLPYmWHC65m+X7h2ibulaxDmjHUX/XoIkIgUVS8Ng=;
        fh=dw65tRtFQGQXMPqHyqOMfJDsl4EEmeQkixtAT8UjWTE=;
        b=OeOnEZD6+1jmdQv1uTyK5Tud90Pr8sjxKcogg/S4n59s9Egi6a3d4x1nByRI1LEe6B
         CiV9lnEP523M/zZimavK6kXYqF+jqV3OSnLDAB+HI9X5MWygoDelFNlBx415topa3I5Z
         /hxqxJnDBSHbY8MRIngXGCnose+1dLSzKidePc31LeBWTzHWDRa9tBN8QDpO0oo1Pkob
         TFba5wgCw1nDOMpSeGBvt0CVe5p9bkLQKI3irxZonsog6zAj7WwcXWKq8D7IqEvMgKVh
         +KOLOJUIc4xxEU42alp83zbp5r21kJIl8nc7C2e+3PKLrFaAWboSOjgGOxhzFgwi0gLc
         XP6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334908; x=1794939708; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkrLPYmWHC65m+X7h2ibulaxDmjHUX/XoIkIgUVS8Ng=;
        b=vblX2o3esxFgIJhI9Q08F6xSbn4VUA8d8vHSk+tf1uNE63vr+jQMK60ijnDvYMnJxT
         Jy3L4i0p+ZB+b5izqVi5JvTBUx+vxALht878z1P31NxLlA/wY+QtvBe+GgjKNtGN28kg
         0/pStrmKRYhWXG0iop0BwlyuiO4agi2sbKNRuh1pVwn20tEx63gnRuQPJnlNY4iKC4rn
         83/piaXJUfTU+b6bAQTYUbIeGvt0sORMWYw0rRoZ0kXyhNLgAAhcgWNvvxbXYWb8S39d
         bIx7FrandH5wC94lZsTe6uMPp0RXaAL/AkV/c1ucwRxvKZjUiZpUZ8NYjLEpEq3sumik
         ZsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334908; x=1794939708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkrLPYmWHC65m+X7h2ibulaxDmjHUX/XoIkIgUVS8Ng=;
        b=B4e8iQGPtl4TWOLULxYkHfabffxmT1rmvgCYrkm4cH3D3rOFK4Ix0QVSLrw1pEV7gB
         osN3DjX0kR9zHUssIt8xqqWssfzmuBYRPwTjm1WeKmo1Y3RyrdbfArLcpAxSakZlD5/V
         ZqczS9y6r0dsRnqOELZ1IpJSqFJ7vq/6VGVdvYtVxt4ODO2db3mSBbGZpDxuMaa1Y2s9
         nbxq0/ynHYuiQK2WJoSCjKOJDV9uZcOgpDJwxwDrT3EskZcIHyuy7XZcbPWhIz3F13sX
         R/HDmkmS44gtNlnQNrGrdpMQjFgEaoN1f6IBrcGb1noCqx+d/jVYBH7sPR7tYr6cAFUy
         q7iA==
X-Forwarded-Encrypted: i=1; AL+hErGXTYGXb4WIVs4N3UTsN1W0fERHyOoJGZqYt+QegrSVXW5owqg1QL/ai3dbdk4NeQWy66bUqFs1rRylnw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/hE++5tLaUt07qyC5nXGaHyv/krC8jQTqLO+mTNFhyF7PcG61i
	GrfLouliW9wdVVr+SdvhAMhUTSNNSEc2GHfOpA/84TK4/VOTj2dTQUGxpSY8RzkvF5EsboGYEux
	ODQI2yaqqN83GNTR5S7351yUSPP0mnns=
X-Gm-Gg: AYBFou139xF8bUcerTMQ/HBFAF/X6MATrIptdd2UzC06ZhKAYez5E9+3Cjykbt+SgyB
	lk0XkdsvYg4Jm0WmllT7qcdaaBL6HwtfleZCDWDXpufiRWQwql629BQnczQakmyX1pET9yHHdBv
	KGg3AbgJcS3yS7muGuYkxvbQJeU1ayK+G2CK9XB/7PwSXV2ySUl+Kf2uFfbrsNzX+iAN4uR4BeI
	xHJlPsoJdDVA+ubo1z4VYAmTBL7gItsXWqW035LEp4nqm32+wy1uLHVBUUZPDbWbmKLTx1F/peA
	nW0I29xaVcoF3K5iRMXn9VJfqz7h/uaF/Uue+QOhOQy/cr8q5RLbKtDyZq6f6vNfPco9Pkri0iq
	YiVVoOImtQgbVrb+1bIitBrmr1TERr24BwoeblKhACJvQ9fjtO6HwTMUjSLiQbA8VLX+w
X-Received: by 2002:a05:690e:4594:10b0:67c:7c1:bda4 with SMTP id
 956f58d0204a3-67c67cb9d9dmr70993d50.10.1794334908283; Tue, 10 Nov 2026
 10:21:48 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-r730-disabled-rom-fail-head-v1-1-88ef813d125e@gmail.com> <7b7f0266-693d-7a9e-88f6-e3c60ec5c3fa@linux.intel.com>
In-Reply-To: <7b7f0266-693d-7a9e-88f6-e3c60ec5c3fa@linux.intel.com>
From: Kameron Markham <kameron.markham@gmail.com>
Date: Tue, 10 Nov 2026 10:21:37 -0800
X-Gm-Features: AclHuK_aO1WoLf_mc6s3Q_9KJC6d4UFmp61bf8g8NhbTYYKqft1g36X2w17Wz5Q
Message-ID: <CACpBZmUoSU8Emvego8sEce5AbB4+48yMLbs=E-5HKMh=65Zq=A@mail.gmail.com>
Subject: Re: [PATCH] PCI: Don't add failed disabled ROM BARs to fail_head
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026, Ilpo J=C3=A4rvinen wrote:

> So all resources that were assigned prior to starting were assigned
> succesfully? Which would mean there was nothing wrong with the fail_list =
&
> ROM resource handling.
[...]
> This might be more a quirk territory if the resources were assigned just
> fine but some device fails / crashes when given a valid address for its
> BAR(s).

Thanks for the review. You were right, so please drop this patch. I went
back and captured the end state, and it is quirk territory: the final
assignment is valid as far as anything the OS can see, but the address
it picks for the I350 is already decoded by a PCH function that the BIOS
hides.

Dell R730, BIOS 2.19.0, SR-IOV Global disabled, v6.17:

- With igb blocked (initcall_blacklist=3Digb_init_module) the machine
  stays up. After "No. 2 try", the bridge windows and BARs read back from
  config space match the kernel's resources exactly, e.g. 00:1c.4 (PCH
  root port [8086:8d18]) window [mem 0x92200000-0x924fffff], I350
  07:00.0 BAR 0 at 0x92200000 with memory decode enabled.

- A single 32-bit read of 07:00.0 BAR 0 + 8, without any driver, resets
  the platform. The iDRAC logs the same ME error and CPU IERR as when
  igb probes.

- With pci=3Drealloc=3Doff (firmware layout) and only 00:1c.4 and the I350
  moved by hand: at 0xa0000000 the I350 reads back fine (STATUS
  0x0028038f); at 0x92200000 the same read resets the platform.

- In the firmware layout nothing visible owns 0x92200000, yet reading it
  returns data instead of ~0. Exactly 0x92200000-0x92200fff decodes
  (0x92201000 onwards reads ~0), and the contents match the PCH thermal
  reporting registers as laid out in intel_pch_thermal.c: TEMP 0xa0
  (30C), TSC 0x80, TSEL 0x81, TSREL 0x01, TSMIC 0x80, CTT 0x12c (100C).

- The thermal function (00:1f.6 on C610/Wellsburg) is hidden: it isn't
  enumerated, and conf1 reads find no device at 00:1f.6 while 00:1f.0
  [8086:8d44] and 00:16.0 [8086:8d3a] answer. Its BAR keeps decoding.
  Neither the DSDT/SSDTs nor e820 mention the range.

- Its address follows the firmware layout: it is on the first 1 MB
  boundary after the last firmware-assigned MMIO below 4G, i.e.
  0x92200000 with SR-IOV Global disabled and 0x92600000 with it enabled.
  A fixed per-DMI range would therefore be wrong.

- Stock v6.17 with igb enabled plus memmap=3D4K$0x92200000 boots
  normally. The second pass still runs and places 00:1c.4's window at
  [mem 0x92300000-0x925fffff], and igb comes up.

Before v6.15 these bridge windows were never moved, so the overlap never
happened.

So the fix I have in mind is a quirk that reserves the hidden thermal
BAR before resources are assigned. What I don't know is how to find it
properly: with the function hidden, its BAR can't be read through normal
config space. Is there a supported way to unhide D31:F6 temporarily on
C610/X99, similar to what drivers/platform/x86/p2sb.c does for P2SB on
newer PCHs? Or would you prefer a different approach? I'm happy to write
and test whichever you think is right, and I can run any test you want
on the machine.

As this is a regression from v6.14, for tracking:

#regzbot introduced: 96336ec70264
#regzbot title: PCI: Dell R730 resets after realloc moves the I350
window over the BIOS-hidden PCH thermal BAR

The serial logs, register dumps and test scripts will go to
https://bugzilla.kernel.org/show_bug.cgi?id=3D222253 once bugzilla is
back.

--=20
Kameron

The investigation and these tests were done with the help of an AI
coding assistant (Claude, by Anthropic); I ran them on the hardware and
checked the results.
