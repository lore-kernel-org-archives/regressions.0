Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD92B9A2
	for <regressions@lists.linux.dev>; Sun,  1 Dec 2024 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733080479; cv=none; b=Gpu64fi1qkuOC4kuxfnOHo66QkE9r3d2AXRfdJckRrsvJenPzL5r5tIiDKImMzqhLIOAZhMsN7L7AK4I4d/EQCiWL8OjdwAJDz8NRfWvgcnrZOrnfpt7Xi1ysSa9TnjBTLK3MhJdeEWJ4BABHdYbeo82TpVgYL5kCZYYO1pb4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733080479; c=relaxed/simple;
	bh=1N78DNIl+ed1XDP/lYCCDhCyTyOMKf4yX6b0KquIuOA=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=duBorKDy40ygdmyDVKey2ds9cR1tYAGLo08VVqCXQRH3wK6hJQ8cUxrviwNWe0afk+VosSlY8fMea6QymeSKrEAVrr8TguFSsptIab6jCta+98/aeixPvAJumvlIOZIRq51CVVM+vMOb9SHccY8akDrFwij6X94VQdKzdk0eQa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ8tpDyh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ8tpDyh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0c7c8cd6cso2504171a12.0
        for <regressions@lists.linux.dev>; Sun, 01 Dec 2024 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733080476; x=1733685276; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cBgN0DXc0e/15sj0e0kTs7/C+rgSCSYUT4C/Y1b9U=;
        b=TJ8tpDyhtsgsSHRtf3y+V5muhjhBKhk2amFovMAGeDxbaKig6QGY5mCibdTWEPWCfd
         TUIl6ym598lgf3u6sBc51nEyMJatM5+EoME16cQUQCwEVy1CDqSwR2aZ7D9l2AwZyWUp
         X3TnkVlLGNgqe8U47qFvV7dYEyYoCWEowo0dDxiHyxBR56awmzXqwvmQ00WHkJqZLJu9
         OcdjIeAZHxRR1vnZ1oqUBTJ45DkbQbxkDUy/DCmClyukrJRTFaBYdK9jRxeHvAOmjMCn
         led15Fp6dalcYc8OfqPWhLgxVPmYlQt9y2mfxyrxoA000au2pbjp4L2siSwmiDQ4X1Hl
         zRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733080476; x=1733685276;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0cBgN0DXc0e/15sj0e0kTs7/C+rgSCSYUT4C/Y1b9U=;
        b=ftHe6KCriD/6n8DZ/JGqsy1Ki3xRqKuvGSfGZh8pH+UnRSNN230AAfpXNd+uf191sK
         pHKN6NNzPqkTekh+bCaMuOH0RkQDU85xitW6FkbffanhDn7FOvqMdCL4vzdS78NGVDcE
         yqwITjV3zQY1mWFkbe2f10DhRX/mq7H5u/6IzXpKOgBcs2ikQ7wBAQYpXMqD2m7SoIgZ
         lFYjeeSIqFqV6TeygvMoGwO6d9frpxWmz/VU8JNVa3MW/rXEBDoSAx94PPh0+NFBBwjp
         BptzGIanbn2FreK8yZi7wIivhfsxTtsm03Oog+YV9OKIuPOyN5IF3CDQY1Q1ghxrUB3z
         GFlg==
X-Forwarded-Encrypted: i=1; AJvYcCXJWjQvCri5tE8y9sSj8rxLRbV3iFmR5ZLOjno4x6/36pJdhhjggrfkdCpbWn0wlgXOlZmD85yXngW6Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoMIHH/rzZyozcYElfc+INZ5T5U+ki4NYw+skMqSGYJhIiVUp6
	BngbB3Y93vyxX69dkqkE+kaHYGD4xzaO06ESyC2xH3j/QzJfROlM
X-Gm-Gg: ASbGnct2Dzq0COQmQwp9tQh44G86UYpcu+8u2eLIOBZMlphx8fJRWKUXC7NK5TGRES5
	+yOLMrJc7UbtlFCgv+HJvtl3Se1uaPfk2LI8mlkUet//SsjCSfzQEbP9We3BKpXEIn6JrmeLFDW
	TDL9sdX604fLuPSzp0DmQSSe3OO+6mEwDXs7DVGGbPuZEmmNT0qyiMOOIVzfA0p6CwfqPV0R5MD
	NG4AtACs86yG7C3il3AxyebXmBPHV2wqlaZruzWUWJdnLBIrvdEQE/KTHAOmuI8rXGrNGkVTLYD
	O3K4afkTGPjtdosXNEPcK8//XOgeKDtW
X-Google-Smtp-Source: AGHT+IEbMH6bMLy/g7Dm2xw13TYYMh/jY8UDMMiPwK5FFCOEneUVCpf0MzU+CyGIYBN52X5AJpQ3pA==
X-Received: by 2002:a17:906:23e1:b0:a9e:b5d0:4714 with SMTP id a640c23a62f3a-aa5945fb940mr1627560466b.21.1733080475702;
        Sun, 01 Dec 2024 11:14:35 -0800 (PST)
Received: from [192.168.10.116] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a8f0sm423109066b.160.2024.12.01.11.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 11:14:34 -0800 (PST)
Message-ID: <d64d354a-4787-4836-a45a-0e7f5b3e6c64@gmail.com>
Date: Sun, 1 Dec 2024 20:14:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergio Callegari <sergio.callegari@gmail.com>
To: nicholas@rothemail.net
Cc: hao.qin@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, marc.payne@mdpsys.co.uk,
 Linux Regressions <regressions@lists.linux.dev>, sean.wang@mediatek.com
Content-Language: it
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> On 20.10.24 20:04, Nicholas Roth wrote:
>> > #regzbot introduced: v6.10..v6.11
>> >
>> > My Framework 16 laptop (Ryzen™ 7 7840HS + AMD Radeon™ RX 7700S)
>> > recently started hanging when I open the lid after resuming from
>> > hibernation on the very-lightly-patched 6.11.4 kernel that Arch ships
>> > as `linux`.

I am seeing a similar problem with a Zephyrus ROG G14 (2022) that has a 
not quite unsimilar hardware to the Framework 16 laptop from the 
original reporter (AMD graphics - internal and dGPU, MT7921 wireless).

I am observing the issue with the Manjaro kernel that is also quite 
similar to the arch one from the reporter.

The last kernel that is fine is 6.10.x (tested with 6.10.13). Both 6.11 
and 6.12 hang on resuming from hibernation (tested lightly patched 
6.11.10 and 6.12.1)

Blocking bluetooth (rfkill block bluetooth) before hibernation seems to 
work around the issue.

Interestingly, in my case the updated mediatek firmware (241106...) does 
not appear to be enough to solve the issue on kernels 6.11 and 6.12.

Sergio

