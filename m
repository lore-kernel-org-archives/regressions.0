Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233F37D32
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT1iGDTD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6cdd13c586fso83426b3a.0
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215248; x=1701820048; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoJTdvnUva0vOEP8D6/hcODd/TZNf7EsXrddDwBiX0Q=;
        b=nT1iGDTDRlvBmrhMagbulPjSofbkFWSI0yGJ6LgQuqIR+MWu/SdwDf3rB9p9mVQBzh
         UxHl2NVXV2JO/Ue69l6dMonPcb4A54IXrbl2mIt1pcDelQXScc98aW6MvIzyCe+6w2U5
         RX5llknuqvH1qHytXd8bNNqnWW2pWjdImaTsH2xMGeWuGcq0h0Lh67e53o872G5fn/ET
         KdFtN/q8C43k6yWOGxHgHhsy7Lpi2i3mRifzI3N5MDy1CvLWfICnC4HG37KaV8O3EkGp
         f8WQ0G3Hwd5zHPx7AdkKgclWwDtBjNzNnhKmRYy2tjf7iWgBz+4CahD5ovgsmIlRdZWd
         Kwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215248; x=1701820048;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoJTdvnUva0vOEP8D6/hcODd/TZNf7EsXrddDwBiX0Q=;
        b=EHpsxQ0rPsZi8buqfDbuZwUH0Hh5mEQDXYWY3LKrAFULQ+4+5ZZiKTL1Z/5dRorkB+
         7rs9mOyHNCNDXVCu8AVlgDyv/wMmDxfTCNV1g3jUKe18QlTP9WGeuaPxhQkZWctn/REO
         cCZ8Nafvc9qt+W8ZP5zVYHtm0V6Y/o0Pkg/apGkFcnibT67wkPpFWnvQPn0i9LZOFMfP
         Jtix02/mXBg7dYS0PX5kVeuw8DkZqH8NAXNiLexulnnADBlJ9DP9MCWoBVD4FBtpjb33
         v0MpfJDtoxR6l9SKlHxgEHBqm+h/Zkf2EU/EbpYu+TtOmuh2feljGONnEdWrhuuq3wPY
         WPGw==
X-Gm-Message-State: AOJu0Yzb0kUJT+io+ViH8l6THNXGBP5GlAPM7+JxLdIDWBI/OMKWG3RR
	QFW5DbmqBVeUBueOWNaaaNM=
X-Google-Smtp-Source: AGHT+IG0ToBag8VkYoAH8p7bmSYPEOYkke5pJZNFz0uaMrE6AdCr1IG7P+8YPR2dMp9dwjbggk5bbg==
X-Received: by 2002:a05:6a00:1d01:b0:6be:4228:698b with SMTP id a1-20020a056a001d0100b006be4228698bmr19323394pfx.20.1701215247817;
        Tue, 28 Nov 2023 15:47:27 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id l65-20020a639144000000b005c2130fd8d7sm10038106pge.91.2023.11.28.15.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 15:47:27 -0800 (PST)
Message-ID: <562a2442-d098-4972-baa1-5a843e06b180@gmail.com>
Date: Wed, 29 Nov 2023 06:47:20 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 Linux RAID <linux-raid@vger.kernel.org>,
 Linux bcachefs <linux-bcachefs@vger.kernel.org>
Cc: Coly Li <colyli@suse.de>, Xiao Ni <xni@redhat.com>,
 Geliang Tang <geliang.tang@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Song Liu <song@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 Janpieter Sollie <janpieter.sollie@edpnet.be>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: block/badblocks.c warning in 6.7-rc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report that is rather well-handled on Bugzilla [1].
Quoting from it:

> 
> when booting from 6.7-rc2, compiled with clang, I get this warning on one of my 3 bcachefs volumes:
> WARNING: CPU: 3 PID: 712 at block/badblocks.c:1284 badblocks_check (block/badblocks.c:1284) 
> The reason why isn't clear, but the stack trace points to an error in md error handling.
> This bug didn't happen in 6.6
> there are 3 commits in 6.7-rc2 which may cause them,
> in attachment:
> - decoded stacktrace of dmesg
> - kernel .config

The culprit author then replied:

> The warning is from this line of code in _badblocks_check(),
> 1284         WARN_ON(bb->shift < 0 || sectors == 0);
> 
> It means the caller sent an invalid range to check. From the oops information,
> "RDX: 0000000000000000" means parameter 'sectors' is 0.
> 
> So the question is, why does md raid code send a 0-length range for badblocks check? Is this behavior on purpose, or improper?
> ...
> IMHO, it doesn't make sense for caller to check a zero-length LBA range. The warning works as expect to detect improper call to badblocks_check().

See Bugzilla for the full thread and attached decoded dmesg and kernel config.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: 3ea3354cb9f03e https://bugzilla.kernel.org/show_bug.cgi?id=218184
#regzbot title: badblocks_check regression (md error handling) on bcachefs volume

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218184

-- 
An old man doll... just what I always wanted! - Clara
