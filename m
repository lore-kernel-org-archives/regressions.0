Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794152465;
	b=0Ww/PZlQ6GYGzt68sFk29Y74So6NCUHMo088xdUqDxSijTMRYWObGlXEqUT/EUjSkCGC
	 rC0pA0/wCwimTEjWMZsQhv8Rs0My87rvAF9ZXxADgyGKlD+56imDMFpA2ig+ha0kZFVeK
	 abCJ34b4APnrbYsEdnbYyriJepYutTo/9W87bhjKsFAiBMGTcqyy53w5oIJ/ScKDHR0VC
	 lHBeS+cKQD+O7ZM/FXeMxWJFxX1xDlEa5OCBJYLEd03fd0FJmNPK+VAmLTV+eH2XXlhcv
	 eD7AvJSOFSJiICGbqFpAPHSSf695idvCCBXmvAJZrwP9l8g5mhOpFUyODzCZMUORVaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
	b=q4VLDJwVjGOuSS9B+YWdkpRLB/tY525Gafue+uMFBfA3+AiQ8ZPOmgEGZUCnxDjW9Kl0
	 oepswKGVI0cQX01pTlnZtDgqRtNXGQwalCGlur/N06m/etTBu+/+/z8cyIQNoYn2A66IU
	 4c8rgTbro4Y1bS6d+Uv9Kvls7Jh7kCuKSi3HpxXrvmQ5RUbZuAjAd22fPOyZqMtEwiwnH
	 OmnONLCf0NVNX6/u2TF9xK57ziBlKUl5Opx6Os/s2Aix9qJkzDTTXnJSJkL+3j4rWPond
	 WMNEq2UQrSqXx0N/JB2ejiszDsZtyI470aZxHjRmyJ0vN4+Rjaw2RxE7Q0WBj81Ving==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKdUjRWb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC62606A320
	for <regressions@lists.linux.dev>; Sun,  8 Nov 2026 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC62606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKdUjRWb
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso119642c88.1
        for <regressions@lists.linux.dev>; Sun, 08 Nov 2026 07:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794152464; cv=none;
        d=google.com; s=arc-20260327;
        b=VcFDooC721kWCrG7zis2iXdW/FdFMOVNErpqKcm4y/67YypcSvBrmf19SfYjSnp0KW
         WgVsyN3hyrQFgVWs16YIImSaS9UyqPBuzdfSmJSaYl9kVgNG4hhjrnEQ3jilzrzgw/XB
         ifkIi/AR5rmxyBFgSbs4rLHK61zYt/2m1m44O6RKHUAExHfnzXV6e5/qYBqegCRMJeQ7
         wyjPPIW3Eq91c8I6ac+T5s7mF+3VlJG6JTn5BRcsTRNQryv3PFMjmIJuuhIXrERVmnd+
         Q7cuK9R20t1LRhaMp6ZyFHxblFMu8JrFI4A6d4vu6h+7xzpc50jzUhcz6tFPmg/beMGC
         DFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        fh=TD/o+mlfd8mam+8X+RQGXBdK/8dx1lgb89a/xL8zzz8=;
        b=chph+ofAAKBETkOHaIjKdZ3BzUAo6m/iWgckAhURQSvXj7/zJ1yz1LCXbVcP9ni80e
         U59oBpqpkddE5J4MfonczBTbZeJhZxOxyt3LdFzJIvzsYRBGE6ibu6iPO4g3u7T1a9Of
         fylTp4BYlWYTIXPtV7A+DYcYcSm4BWNtMiTM9n1pTQm5vStiG2ESnoV2Qp1EDZOPe0N7
         fmcg7eWLiWI8t/ZtRykn5T0B4BPAT9Gv+JdwqazVwiqgru6/NTMeYqhpazQ2qG1nl33d
         mSOw4C22wy4qU9hiA3FdtcNvChuoHuP1s75V3Gl6lzW/dD4aIV3WwhWJGmQDnYBiQlle
         Opcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152464; x=1794757264; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        b=jKdUjRWbqCA166Q/y7KVpSXZnqlF6pKf/voOoTn8X+neJ3/mRoiG1ahioke5X/IIvt
         n3mUhUCLcsdQFKovemNCpjcuZaF/cTqPshiR12gbb57IfLGAIii74p0Nsshk8ojGtNq4
         XlI/hoZC0awvLqQYxVTsbpjOyHV39tErbyDdmSpxohipSHIJB7HjXXgnt4MJa+f0++/Y
         N16z2JJLp7fjk8nI5d53VzL9p5wtLF+4wjecuxl2MIUZ90/fN1ciNZ36IA0EyBdbd7XK
         g3nhyu+Kj/UFueXg8R5RWCSK7ZrOb5Swsd+PFLCCxc6gUvv5jLh7VLbt2Bi/W9m/2jSi
         Jq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152464; x=1794757264;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TI/AUGZciwVPY9wI7Ypz9QfScP10dM/co7oPtuQApfg=;
        b=nDKe2KzV9VUk0d9k3glA5rAoIzzQmD3Oo6+aP7dffVADJ2naZ5gjYZCQDhBR4Bh7GQ
         QxC0xbFaUpV75k4EfM10I0SdCUbIvmqnCrrqBpMMM6cD6B0sPYuX3bVXmkqHgXfR0BD2
         To079H4JYHELQlVTEH7cnwfNkg8IyADVTt/tYIMrQuPXhNrYYHxU8wwSUiHxMSLU/Ooq
         wETmKIjtD19pDsFpKheF7I1WlT+3wre3uwcSym26bZfL1g+nrd9DwbYzvTOwkT8p58Qf
         j+y/Dv2ghz+wcGR38Zca+VsoiV+drQI4kkYtgTupJFdajX3do143oj9NifzMm+V0grLW
         O09w==
X-Forwarded-Encrypted: i=1; AL+hErGzHTfsPoKHC+7FYArNz/FzkCG9PfbxOpOeFX/UPrqs59OLZLI9BTM0+Q2Puf0HM6IQIC4/m6EibDrOEg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9R81NDTwhkDw8NR3Z/viPVYdToex3Rb8KyjUUwtKzyPl/dJJfi
	3BWAv0fsMfaHGmpdq33NcMEkYNgZk+/ZsofgpN4Cr0KfFFnDSdHgHf16mNGCMMZIqT4RwCnY9Wt
	/QYcYcJEP0OX44lvq0uVQIOZoKVoKlKk=
X-Gm-Gg: AYBFou0ziEWr22aV+CAhDSZQ1jL+JXOIot9HsFoH6fu3++EI5iYTShAdR92ChCt32LG
	oa8uaIaMbTXqXLsm8MRSBVsVNddzz/S1FYlFNbiLnM3B0S8ORXHFgVoOOd6C7Z/woZsTvQ6lK98
	l7WkVXw6c0CyT+Yj/tYW0vhXh2FuV82EPQdQlq/8wh8gXn1TOpYKtz8oxkGV7cLvHh+ovyRXRTP
	Y5fSUrTDo7/QY+mV46sKv6sp9h2u5tE/z4STNDCdNh8uu52eEyq+duaCt1uWuTDt99wpd9cXVG5
	1cEjyBb91R1kA36x1AZrZV/dBK98KUgBZe8pJE+heFVYY6+OOhSCd96x1/dP9Dl+ENXeoZgoJkj
	R+g4+UkwMuTCdbiv9e8LXdS0Ds//n5JD+NQKnOWW1B86VqSXBf7F0JzlYhExg
X-Received: by 2002:a05:7022:1309:b0:148:bc4a:8356 with SMTP id
 a92af1059eb24-1b39feaecccmr2228737c88.28.1794152463457; Sun, 08 Nov 2026
 07:41:03 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0J7Qu9C10LMg0KDRi9Cx0LDQu9C+0LI=?= <rybalov.oleg.dev@gmail.com>
Date: Sun, 8 Nov 2026 18:40:52 +0300
X-Gm-Features: AclHuK-WFGDHmxIeaNgit3IU_Q4J-eaaoStqVsY0uA2NoDy7gva41C3EZw72eME
Message-ID: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: qby140326@gmail.com
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
Content-Type: text/plain; charset="UTF-8"

Same model line, different board and CPU vendor: I see this on a
RedmiBook Pro 15 2023, board TM2209, AMD Ryzen 7 7840HS. Adding it
as a second affected machine plus a few observations that may be
relevant to the quirks table.

  XIAOMI Redmi Book Pro 15 2023, TM2209
  BIOS RMAPH5B0P0909, EC 1.9, USB-C charging only, 100 W PD adapter
  Fedora 45, kernel 7.2.15; identical on 7.1.8, 7.1.13, 7.2.7

Same symptoms as reported: performance and balanced-performance
return -EOPNOTSUPP while charging, low-power is accepted but reads
back as balanced, and --block-driver=platform_profile restores
working profiles via amd_pstate EPP.

Three things I have not seen mentioned:

1. On this board the platform profile does not track the effective
   EC power mode. The budget is set by the Fn+K OEM hotkey, which
   cycles three EC steps. Measured at the package: ~15 W, ~35 W
   (the state after every boot), and a top step that bursts to
   ~65 W and settles at ~54 W / 4.4 GHz all-core.
   While the top step is active, laptop_profile_get() still returns
   balanced. So relaxing the AC-type check alone would not give
   userspace control of the power budget here.

2. Ownership of the event GUID 46C93E13-EE9B-4262-8488-563BCA757FEF
   flips between boots on the same kernel: some boots redmi-wmi
   (input "Redmibook WMI keys"), others bitland-mifs-wmi (input
   "Bitland MIFS WMI hotkeys").

3. Writing 'balanced' to platform_profile while an Fn+K step is
   active is accepted and wedges the EC: package power drops to
   ~9 W, all-core to 1.0-1.1 GHz, Fn+K stops switching modes, and
   scaling_max_freq stays unchanged so the cap is firmware-side.
   Only a reboot recovers it.

I can test a TM2209 quirk or any patch on request.

Due to a language barrier, this text was prepared with Claude.
