Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792882063;
	b=D5ZcCskYSOF8zXoAe4eU9h+ZL9LtUIZFO27VnChf5gpahpuMYen7qnmTUGdDc8e9LsGn
	 XemTmxmZOEzGvQtlz5MgIYdHCRkXXc3ORz6wCBrAmOlI1aanL/YP9EXpN9hSqSCXinqBY
	 JMYqydMP2tWJGaASXZJ6rsPuTFQeYse/Ibs5iw5aUy/PGTUqJbBbszWA7wn21tdwh4M3t
	 JJV1dH/sOOTkh0p3aURGNLuYWTKfOYKVDNe96E93vVTgT6dg0I2YD2fDFTgTlerA6v8wl
	 XGMVCd05q8bKuST7Y0b2MWDPzfu2z3q0q6D8yqlbYdHHXHRdiquENyYq94bW+LPnfWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NZCf9o2Rj196Ew4/tcSd/wzVTA4Lk6Bgp5J5f2wGqdU=;
	b=F5LJDZcGJnI0EXf+N0kv0QJ0LU7bNVkS79+eWJNpyudOHxeDvTVbKeB+TQKPHJ4lBxFH
	 yEC5fWwSqVG7B5RZ4oklPvbcu5wAw5sCc0bXowp4vlKM/aueIGrYe/w+izWNLNkOyzUGn
	 vUs7RJXovYFbbQNwGs3rXHxwvEwgV1kvfqzENvlu+vMdzLUOtD3XLmuJHlFMuFOljuMfu
	 etNDqeSbuKojlY4FyPXeypq0jcxqHFRhvmb8SCi6XFZBfQCLWqWuE+zTD/NiiYbPGRvAh
	 mURJ2/qdc2mUMzxUOqjaipL4pCkG3zq1yMh86Xx6r9M28Hz6FoMBvM3V0JvLkXkff9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZX+LLFB+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF8606A31D
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 22:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZX+LLFB+
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso2701673a12.1
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 15:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792882061; cv=none;
        d=google.com; s=arc-20260327;
        b=GuGhWbtOUq61JBa00prs/MBnB7q+TfADzNhCFxfDO+1mzbSjs4Qip3KEh9xxuKaJql
         iutMImW0XHedV7e3ZFCi7/L77Oq/7Alg3CcdkYT4w2F3gi4giy30m6Pe6K9+QjPR1ji3
         M20bYkTsI8Ruz4UHhgYOo3IRE68JUmlfFTeIQ249f7bMDoCpxJ4eVUi4FogOWCUd5GMY
         g5LUaalmWujWC7vFaxFzNmnDnb6wYhdEDjwZtH93e96XaVxZkVEEszVtWOV/klXXhsAC
         K2TE8fC9cYuHcF+ipua5YTxItgahKD4/a4G1WjGKUHU4t+fZqgelNZxf4U07YaNc5bRh
         R5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NZCf9o2Rj196Ew4/tcSd/wzVTA4Lk6Bgp5J5f2wGqdU=;
        fh=9oDb4orRLRQtn5U+EBJNyV4x/94P6Xf4ruOABv9SMxk=;
        b=pIOYEiiCrTi4zYo2lYCJD78S0qYKOF4NP7I71+7+Al0bIgIUeAlQd64fY3xOYAgyTx
         2WitEzielofexCaQieUEaM+UjMsCtVVmjk3JnoInvdShqlA46QNEPZDq0GGfpld4sGv3
         7pC5/K8eapx39EUUxk7/fPGm56Np2RFY18c/eM3IkdpTXwbG6pGoFigIvdPkEI/ikNAB
         nuebVRINvJqCA92EyQ7DHbMyENztlmapC3b/CR2zFJ7dbOGhWk/GlDzSiLyGVYiuq/XY
         HQJCOs8xE3wVvtWMCkn7vlg+A7WksXf19eYlsq80AWVpf1oPeruN2wUYpE7O4FYPo/uu
         vTjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792882061; x=1793486861; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZCf9o2Rj196Ew4/tcSd/wzVTA4Lk6Bgp5J5f2wGqdU=;
        b=ZX+LLFB+gagZqcuv7PcHwMFMIaR2XxEcQQbnyySYAd3wOT+iUXl3X00IRJAn7mj9Cp
         4c7vwhXEkhKXuWlY2sRBwvtezw0YnUvnrVXWPNaA0JkD6kYXsDY23NKyoQtdbr+c6Kg7
         gehKvYUg3PCLHYxOc3u3ZhH5L17IupUYe8BxOlJxPe6HFRfwJF+qEGvRAxHjMMZJ5nx/
         /btL2pYEqle0q9OrpfF34saAlOOmxW4wWlGt7X9cxb59GU7kr+2QkmwgfAf32tnoeUkw
         YmJiGIViVj+Qgx9jiKvDb/45wSv+GiRctC/RJk9oTguJUTS3Q1ztzpKOAZj1u4qApO3m
         4+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882061; x=1793486861;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NZCf9o2Rj196Ew4/tcSd/wzVTA4Lk6Bgp5J5f2wGqdU=;
        b=ZOaGNryXIEkp970oUwYKjMapwKkR/LvCGZ3hrGrG2ZrY86Dl2d5nGrcByjMzrXHhy7
         6/257ZuEiZy0cPth3npvWcgLlmB9DHYbc+i1tyq4RMd+2B5DP4tmE5tJvdpFDz/YTiPh
         MgNMK+1MOtHnpqvYa/oHoSg4PSYDLAxym9AsQ6jZDyxdtS4uinR7/UBx1osPMNqJxyAB
         ext+nYHQi7vRCK2UM1Eo//RKfFLTi/5Hr4tmnSH00417ZG/veQnD4Z69GSyZCQXSPX6f
         hB385SM8LXnVUfN18veNfGKcl1jigq+UnmckAPyW3N9YIFI1dYdQGIffqmnLo0dRvze8
         G7xA==
X-Forwarded-Encrypted: i=1; AKwUvBzlTNcn2fLgXvEvZo3chDCgC4sZTz3LXsO07UK7DrgZyqWyangjsqFJ6TTvx5pvvY07eYgyeO66LBLAMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKlzvmMENuYTUkjEw1Ab/sRpDzY9bHqGWKmDy9gSFBzri0wnT3m
	1oqOAcO1C640LcTJjKn2/oDBMRI9anDaTkgb5X6WhL3phOeB+yn0br9o9y941N4gknHZtqX5lSW
	EKuxrSYWhEG+/PTvSRhv/06UtBCJZUCU=
X-Gm-Gg: AYBFou2pzmvKPvqgu98exYfn+eGtXs0IXVGqrzX8yuSN8nND88uTTlRy8QipWg8dVK6
	Ze00pd+xFC/HcdsXcJSTLoKz+5KWaq2ZKDKaQbh3xJLt7CD7YPcCuLBm8g80v7pbBbAmWSr7Dms
	5hU+HXRac1G7Xu2AWa8fCI4TRjYfLZu0UzHV7VK0iWmG0yt/KT+Ydbdg3Mnq/m7ebE7Ca7YV5uc
	5PjV5/CyHkzRFnCW6zvbPrf3Z8gOIINYPo8Jp0sjp36v76fM8UmcJsj3OYg2jyb+nRM1jj3g4dg
	293CW/9xWgwOumXftBl/hR/Coq73pxfDf3BdtiLhEzuoe1vbFGEKa2w0eVwjI2xo/r62BbUkP6B
	+ZwQe4ePHR5rGUlRGzHC2lu2yAdtFfMr5F9h8Zw==
X-Received: by 2002:a05:6402:e08:b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b443a2fee7mr3591780a12.10.1792882060790; Sat, 24 Oct 2026
 15:47:40 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Domenico Suppa <domenicosuppa@gmail.com>
Date: Sun, 25 Oct 2026 00:43:52 +0200
X-Gm-Features: AclHuK84iwYwcADuMVCUOUYb8Pad-bbbUjeJBTQvX6wwjDeQ-jqJnqjt6Unj6PU
Message-ID: <CADP5X9J16EYxO94eH6cGJT70k1s_QguPPPGEzH=s8hfQ7dknQQ@mail.gmail.com>
Subject: Re: [PATCH 6.18.y 0/3] ACPI: scan: fix the fixed event power button
 since 6.18.57
To: Ting-Han Hou <ue081723@gmail.com>
Cc: Domenico Suppa <domenicosuppa@gmail.com>, fredericmariejoseph@protonmail.com, 
	Greg KH <gregkh@linuxfoundation.org>, kernel@ametros.net, linux-acpi@vger.kernel.org, 
	linux@stwm.de, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, regressions@leemhuis.info, 
	regressions@lists.linux.dev, sashal@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested-by: Domenico Suppa <domenicosuppa@gmail.com>

Hi Ting-Han,

I applied the three patches on a clean v6.18.58 tree and built a test
kernel (6.18.58-acpifix). The patches applied without fuzz. The power
button now works correctly on my machine.

Here is what I checked after booting the test kernel:

    uname -r
    6.18.58-acpifix

    dmesg | grep -i "power button" shows both lines:
    input: Power Button as /devices/platform/LNXPWRBN:00/input/input2
    ACPI: button: Power Button [PWRF]

    readlink -f /sys/bus/acpi/devices/LNXPWRBN:00/physical_node
    /sys/devices/platform/LNXPWRBN:00

    cat /sys/firmware/acpi/interrupts/ff_pwr_btn
    enabled (was invalid before)

    /proc/bus/input/devices shows the handler for LNXPWRBN/button as event2

I could not run the evtest check because systemd-inhibit is not
available on my system, but the ACPI state and the input device
registration are correct, and the button behaves as expected.

My board is: ASRock H310CM-HDV (Slackware64 15.0 Linux x86_64, Intel i7-9700).

Thanks for the patches.

Best regards,

Domenico
