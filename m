Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A42512FD
	for <regressions@lists.linux.dev>; Tue, 20 May 2025 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783297; cv=none; b=OfqUGuB16QNu5sS906RzRrnxgiLlmsXmhji/rVYP3zt3YFBehIzxylrqUkFOWz+QGc53O3OBxve59hPi0YbqlsmTs4fOFxdPLikU6lNTxpIaGXHKQiDYnGzuw+c+PZNBCm/oFgv5lGbdm/8uyzlW/EYTYfUiC5/HEUa0Mx1I1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783297; c=relaxed/simple;
	bh=v+aw4A9SVyQbVRBn11MetQ5cCqPeUWCsuwuqMpbLSCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lo+/vEXhYoZh62tNnncn04cjkdRTUJBnjSwk2Wy96PRX0XSdQMoQCr5xu7lw77WKytCLEpwT6sR83knLDVW78DMxGHgYypxfTUbbYMk3VaFv2f0n1VB7zJAi1uyV/MymTH4TN5huc2MP8/g5lZHtYJISXAuydkmcPn1xLdFck+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd48xK0Y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd48xK0Y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so6158464a91.2
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747783296; x=1748388096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13vGDqZ7RwWRyNFMS7/xqSwKGFwa26hb3FHB8oIIxCQ=;
        b=nd48xK0Ypn/0WjwWna10D7ZrRI5IL+K7hrPClZOdcIAMNRu/hlDJYoWJDyantWtNff
         AXE5tC/Lie3vE++Log51KfZ+uwKmP2xc4SoPE+q4K5w8C2LaCCcmE248x/45ORZ5nt8Q
         rcmDwY0Syt56v55bwhm7N1blNYq93JnwBLWm35iSUt0PKbFm9yiqNM/hF+MVTln+tZ+M
         eBFXcKH3MmDbzDrp7EsY+ouixrsAyHO3DHkqP6/0dXBbsfr1KPU7ZWITuZd2SWuFFZoO
         lt3/MD1puLX1L5KMo6ll4ABWR0nAOgA0QsqPAHo45mjek4JoJrcZbZLFtYtBfToMYcoe
         pYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783296; x=1748388096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13vGDqZ7RwWRyNFMS7/xqSwKGFwa26hb3FHB8oIIxCQ=;
        b=WRKcToaSj9vGI2Bm6oHI+h4PYkyczfHNEiUskS7hlzBTwF1t3rPtgjEhNdOVLPPG6a
         lxTYMK71X6e69Sr/f4XsYPAQqn4lhVPRSi7UkgW+DbfE+ExPxboB9/eQ/rWYO1Qghzc6
         GEiC6hDNlN4o2RD8tBq1clh5r/U/rOiYsO+9rrAYs6/yWsgWcwwRVpDHmz/VQODNgnjI
         wNtMUwjw+FMbF88LlT7lESI+oY17hGZCw49XSCw22lbopVHFOpU8Snpk0N20PCZYMQ5e
         d5+KN0Sps/5wSkRTpy/tn1m+hzY8Y32wcgZ6gRSxT9fD6fQQCvQQfLZUs6V0TQThWPng
         4Nnw==
X-Forwarded-Encrypted: i=1; AJvYcCXHriWQvEwpbn9SHy1JUKZ0wHgroLE8VvJPX/NMVyU/QuoGTBzUE/81Mrhrv1ITUofK/xqrJCW/8MDlGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCAxn4yV2Q7O0SjhjdiSczwCnjurafWJfddJDmXJkNlfI84Lhm
	4KvnnHnnOJrWq1aUK0Rj4oAgHPWL+rdBAzLERJDPDjn/miAd6VwA+Ymb
X-Gm-Gg: ASbGncutrphBK1gissPK8V84IH9E/Db5CetR3ozOVdX+m4iyc+/arVq0+1unpJ/QnrK
	HkfPPGM6OLkDdV/7VCH5rguwPE2awLX8BOY0P+l0l3/IxPtSsEpko6niy45hBAoylcgdq+/zBi7
	Nbp9pAiPqM8BC2irl1wLGOpNIRaFiq4kA4Kv8NPoKwHohiB+jNJLSkoGlzmBCvWLprnXUj+bapI
	vWXb4GT39LRnoromDW9phck+nPG6aBszg4p6XR3hKCOMf0QFEXaC7UEuCcq4Fh4WdQ4IfNJHGIV
	Nu9LEXtVFGrM+x5blmDhCsnosofuuSst5v+1X3CDFMsHEzmh+J/eXLxm6NGkoA5cCSOVZGnelCO
	SvAEHgdIGisUoWnkOut0ESQ==
X-Google-Smtp-Source: AGHT+IE3nMttAsLuj9+BdITBotd8XjY1uDiBh7WE/LVQB0nDLoooCJQzDkRie44E7ryKQmG8XimTkg==
X-Received: by 2002:a17:902:ea0f:b0:22e:72fe:5f9c with SMTP id d9443c01a7336-231d454daabmr244744965ad.42.1747783295688;
        Tue, 20 May 2025 16:21:35 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed195csm81509475ad.212.2025.05.20.16.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 16:21:35 -0700 (PDT)
Message-ID: <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
Date: Tue, 20 May 2025 16:21:33 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Alice Ryhl
 <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540>
 <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
 <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Naresh: would you like to send the diff as a formal patch since you
> already tested it etc.?

Hello Miguel and Naresh,


I went ahead and sent a patch to Linus directly since it seemed to me 
that this was about to fall thru the cracks. I signed both you and 
Naresh on it since it seemed like you both were happy with the small 
patch. Apologies if that's not standard, please do correct me as I'm 
still new to kernel development.

Btw Miguel, thanks for introducing Rust to Linux. I'm not too good at 
kernel development or Rust, but hope to one day. The modern Zulip board 
and documentation is very nice for newbies like me. Looking forward to 
making my first Linux driver and Rust driver soon. :)


Thanks,

Rudraksha


