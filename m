Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF9849C
	for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 22:41:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id w4so6029207plg.9
        for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679352061;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewcHUOsRMqDzv2kXLhMhSBwIIrce8cI7RuKCFd/Xr+8=;
        b=PeDypUk3NoXF1Kd+G1TqgsaqhYWFaLHsdnCd2WZ5e2SCgDB6b/otkvrtnWlo72f6JQ
         oqDnZIwzDmUOcjfx+rDd5XqrQ4d7kofjXaZKIFI7kzsVZwdcacDj0bbjMA7A2Q1IjQt6
         UKptea8I2jewBU95nBSdnPs61Ki7kqmdfVDHcf13b/j0KvOlRgtCCg+8NLuAlQufz9N2
         ZL1qd0CZUFPxjgYbbgZyIQO4kPU6syLvmfRk05kXsU/Pe/P7HhaapWmIvQWuPh1vJlgt
         8ogydsoOEdtGICCHF5INu0Ba6gGENMTe8348GH79LwYs8cpUmmmhybbOdVZc1SuuyOYO
         aooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679352061;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewcHUOsRMqDzv2kXLhMhSBwIIrce8cI7RuKCFd/Xr+8=;
        b=NcqvjrTooKfy3RzbOZWFpQ5uP7ACS1ICDEh5THjgyeUyqpPdM8ssb0o1isJ9Xlhzky
         +1MNrvjBUjzaQSmCNbeq9sMI1aR0eoeGBdTnjnX0PPFqZhpr7wlSd4iFjgp0jvSnggQn
         TEglkc1NFReEPGTaD4traUZQRX4L8ZIUHObJw+QSfPE+Cwlk/uD3Nks/Cm3PIm1lBya2
         NWNP1OUIgp0114xHdPgYaPCTiOTrfUB7wcvQTJpW5YxFiwqx/acJHikYxp7tYB3ggwtV
         MMV4tusrTviq+bBr5j7SEYxWhwia9dej6h3LCemoRR8KDq7LTGPuDwORbjdHoWh435Q/
         OxIQ==
X-Gm-Message-State: AO0yUKV9xzusoVDNWCcOidAR93+sW5PAHFkv5iMlQ23E6hpJSJgvWKI/
	pZsdJrUgZX3yDU59sJiFdxHdx3yKhyK/sAMIGH4=
X-Google-Smtp-Source: AK7set+cm7w23+5mhEcI6tCtH9XabL8/Le/HX33mBISDAlSmTrsIGGZCSRE0Xz4UkRvzSEk+imcIi4/NpMvohYFP1T4=
X-Received: by 2002:a17:902:c944:b0:1a0:52f1:8ea7 with SMTP id
 i4-20020a170902c94400b001a052f18ea7mr1045pla.12.1679352061307; Mon, 20 Mar
 2023 15:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Price <pricechrispy@gmail.com>
Date: Mon, 20 Mar 2023 15:40:49 -0700
Message-ID: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
To: slyich@gmail.com
Cc: anand.jain@oracle.com, boris@bur.io, clm@fb.com, dsterba@suse.com, 
	josef@toxicpanda.com, linux-btrfs@vger.kernel.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I can also confirm the issue occurred on and after kernel 6.2, and
confirm the workaround setting btrfs discard iops_limit works for my
device:

08:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
NVMe SSD Controller PM9A1/PM9A3/9
80PRO

I had to use ~6000 for my device, instead of 1000.
I'm currently on kernel 6.2.1.

I am also interested to know what if this is expected.
