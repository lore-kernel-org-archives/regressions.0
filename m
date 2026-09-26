Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54826153BE9
	for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427834; cv=pass; b=ngzWIc8ycpXD9jn18Q1nMw7MOAQsh6D9EcMXzPYsxizdVXKJGXiPYUjFe7zD+r/fxEgT9rg0pgb+HfgHKsSZyl7OcWA+vGAzix6b87P4ltYq7xWOlV8QJC8CJciVG0C2SHblf0etIduwGoFY6wIqZsdp8mFUVMfHK3M9vrk5ZO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427834; c=relaxed/simple;
	bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rqh+dqgIic0Xw2q3J55jeVuTubqwqoGUNhVVT9eMG3tw03dWRmwtiI93XhGp17mxPFRZpgulyjx41K5DKrB2v2KI1N5BQuWQSTsKmJnqXjL92Ig+yyunjbCTzw6oLLjOgB/PsVdRGnPB/5VxkWWNWROWHqDB4+gt/IL/oDBRBKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=suKQ8fGI; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="suKQ8fGI"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so248632566b.0
        for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 06:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790427831; cv=none;
        d=google.com; s=arc-20260327;
        b=MOjIF9NeGOig65wTuIayP+nrodt82f2jRw/kZ/mIp/pncCQHRX9Lt2EN0/C0ZquOkN
         bgUgTyU5ElGkPsFFN0uyVXLPghOhZUAzlwgTUl0oQttTTH/CXLWW9gDNb12BLQkrWOd/
         lVL/8r4YrU0OeqW+4KiDZ5c7w/xyqahSBNTrgRYahziUDJi8kPj7XdBKwd4gbdv/PPKj
         1gISLX5zDH5Xic5QYD2F6TcdcB1dtF2wBXMXvh2ywuavIjxV9dCn7WH/1SscPnH1DYVg
         TGeuu4ZhKWOz8rfVhpXf38dMcJBTKtNFmePUBzPUDW1WixslDsOT+2YxmmhoGfaC5G8Q
         j7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        fh=ICGN9nnLs78z7wzfOAFmYlG0CtCWWo8R3sej5/829eE=;
        b=gKvnIMabBeII2pkH99lBTiiNKEvTfLUoIWLI4mjk1AAkTLLbD+ETL5b3CCKSBOXnty
         ASGEl7bvuTq/tBi5JCaRQMsLjB38o/11RBjpq189Wxk27qq4QS6nXL+Q6x8mSG/JEl3W
         Z0rgL64X8y6WCs1N4/ooHStoH1hrhyN9stlLtyx/6CX7PISiXRsD41F9Tg7yqckm7T5x
         9A5OThBx5GrF/LiiUWm6w5qleCO0p7T2yxgQbm13duNmLT9jVwycr6T19DVnlJUFvoz1
         nyjvs2C7RgwfKBpWWq/pDyBKW2u4hLb2+F4FQga0yuHTbGOpvMivjS5WtqMNj4KvZUs9
         FT4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790427831; x=1791032631; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        b=suKQ8fGIoFvDaRSLmoTRPWmHk+5jN/7Kn+OrCVur/tAXNfEm2K7tiVH++i53nFs9ip
         uU51WN5qa2EnhAemLQARbHoMrFVAiLkVMNuN5/em9rIzyErPm4x08upwm3377ZxrMMZ2
         zA2jlF6oyah6oJAtvNOSjtY5MEWEZwkCHQ7YtNfY7dEZ7jXZhMR6iVk78Ciu8Om6p6aV
         ku5fxXjRsRIGawQ1lAm3ngtP21K1d0XU0fbRy2WwVDPa8cJLdTRHq6Cz8pkXOiWSN2Y+
         5kAz0EbGVtbrEcfSJFrjmwbq/T9WDjO2PZ4WZNQyNVT/uIOr457JqAI1ioymHAfASH/l
         /Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427831; x=1791032631;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        b=qIdLb8lYks/E1C+JIuSYPCNVVd9RAzg1p4nETNvshuV1iRL3LajeRAXgO5pxbRX1yw
         uYf3gQODPfUyTYmboGvbluW7OvIy6/qxQdZMBdV92DuTIG85pH82RtbP46ajf5XOuJBG
         BiwKSuc3HuXkQFhsUUIt2EA0rW7oedtTpaSYvNBxUQWmOUSHqwg3spxQdti+WPZptGb4
         +l09+eW/HVSAIJV84zIo7JenBjzCnB7YX0I05AMqpGACX16Sw9FzVz0yhwJEAhITYeRq
         g+UvyENJsBpy0+KsahYAXWkbM7reULn9EM9EyjOhUYbe/99RNnTlzSslPP9rWcEZaKbw
         zfbQ==
X-Gm-Message-State: AFuF++lfcLsyUzErdJ9P0cWKyrFtXDxN/HAF9cr+orM1PzXZfdFht2Iu
	kgthB++b8WuUDQJDKU3DFbf3YlY/p2HsFNPO1IeVK3sZNnB/18vSoRcXiNnu+RGs4HDxr6hQCv9
	2z/njyDqftkRCN1AbbZu1ZUYlYl/XhgI=
X-Gm-Gg: AYBFou36GHyWxRxUzT0VPK3PEBzorZ/5zSYeMchtzoDriZkTSS6XaKyeO20l8vvdp48
	MTWkgPRg2KnA4idOdG2h9eNAYRktZG7cK1zgvQw5PnWzVdR6LNeJn04yEvE/2J7Tb3e45QUI7Uu
	jwUIP5YE+92oJggIpEJ/lhR0GExy3jNmS+tODCy4BlNcRLAr8FRUiT7voJwLqdKnoHeMrQdzzDj
	3fIX2qns5xPmaXlXu94aOGD2PM6seuRHPf+FAwKvaZwrvrLm9t5YwK6ou11WXU/6duKK2OD+ALA
	cqP7xpL0JHf67rtnWWw27Cob6Wancg5ItmKvR9cF9J0gH6X5ZHK1OA==
X-Received: by 2002:a17:906:dc8a:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c2ac233f3e8mr713822766b.16.1790427831544; Sat, 26 Sep 2026
 06:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Faaris Ansari <faarisansari@googlemail.com>
Date: Sat, 26 Sep 2026 14:03:40 +0100
X-Gm-Features: AclHuK952zT1VOkbWHfF6M_lj11z6Tzl9P8Q_FSCl8Jh__qj6jK24voSq9ltu-8
Message-ID: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
Subject: [REGRESSION] Audient EVO4 hardware volume control now requires quirk
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: v7.1.13..v7.2.5

Hello,

A new regression has been introduced between an update on my system
from kernel 7.1.13 to 7.2.5. When attempting to control the volume of
my audio interface (Audient EVO4) through pipewire / wireplumber, it
attempts to modify the hardware volume, then falls back to modifying
the software volume instead. This causes the system volume to be
dramatically lower when modifying it through software. However, moving
the hardware knob very slightly to change the volume brings the
software volume back up to 1.0.

I confirmed this is a kernel regression by reverting only the kernel
on my system back to the working 7.1.13 (now EOL) version, where the
issue did not occur. I also tested both the 6.12 and 6.18 LTS
branches, and the issue also occurred there.
I also worked through troubleshooting this with a WirePlumber
developer to confirm it isn't an issue with the PipeWire stack:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

I was able to work around the issue by adding extra modprobe config to
my system, specifically the below:

options snd_usb_audio quirk_flags=2708:0006:ignore_ctl_error

Does this quirk need to be added to the snd_usb_audio module or is
there an underlying fix somewhere else?
While troubleshooting I also attempted to patch my kernel with this
patch set hoping it would help with the problem:
https://lore.kernel.org/lkml/20260919151840.24371-1-arc@gmx.li/
The patch set worked fine but this specific problem was still
occurring. Using both the patch set and the quirk above makes the EVO4
work perfectly however.

Would appreciate further guidance on helping to debug.

Thanks,
Faaris
