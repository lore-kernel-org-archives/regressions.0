Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4928EF
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715661283; cv=none; b=rZswhsAlJvZv4RWgrM/v46M7fBjaCqRrj61GMk7C0rVgd/UeA3+yf7yCckf5899F5DAwQmnVwuBD6BBMoJ5plKlyNpaCUtHPqHdhM2aCX28xsqboety/gdKgB8nRYWjfN0iIVq1JKfIMMKOmsUb1lpriqOW/GQeXHu2n1o0MX4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715661283; c=relaxed/simple;
	bh=dGUECzmT71vk7yUXupEDNgZTgp6YkFQ58WJ3CImg2IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfegyeJYh6PRNX68x1CUHlFfMhdwp06UkY1D3mJckTNVch4Xlo6c4j1XstQlUvzyuKnqn2BkfBKFY5FsiBa7rKX/3wL9Wgu1SPqzBh+EU6nIU6ExYXPqs5jqrS6wh7LcWB4lsMhgZFRP/c+rerIqeLec8kvTRO0Yf7F11Y7JoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOio3/+Z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOio3/+Z"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so4071927a12.0
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 21:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715661281; x=1716266081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpL9ckhM2YONgCKwIgIxImKCVVLS7o9hHr+mnWRzhqs=;
        b=iOio3/+ZBdnGTLCoPyIr8jnPCigVsmJh5wezsFeKQzfnkFOIj0eyjQThf6P966Kxfz
         SgaX6iVBhZKUncwOc+gxnaUtGA8p5MO3gu/0wdK+UNGXzt70G/MFXxPmihdFRKM22nDT
         eSLCh+hiD09NCLNrDy1AtKp15sxwxkUoTaqerrKdK3gNA2DAh+332VrUNAyNe4Wr/LgA
         AjyutWUHAi9hU9hF8Pw7jPN8M7qg/NaBwaOWPGpA0vCIk51Lem5EVQRfSzWANVvJkGub
         C4fKnIdoANF3Bm5v4/iCR7jfqGeO4LOv0rQkLOv97HxPRly4TcML2Vq0q05+Q0qB/ZSY
         UtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715661281; x=1716266081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpL9ckhM2YONgCKwIgIxImKCVVLS7o9hHr+mnWRzhqs=;
        b=mIG4J2R2NOhJxEzYfgtwu4ezNfJK78XYhJE4J5Gl+h6DmYTdLwQ6V/mIZRUPtdCb0L
         ZFxjyTKq8SljMPXkYrDP0Yzb5f29YhBHYZkfGBZweIjSE97D83e8lpI6IeZ6vA+wTPDd
         jlBYQ8jpjow4Z7S+C9jaD135SrgoJ80fxhUPXweB4xUJHRQmV3KIpLiFuZJcBpqf+/2+
         UhY+AUR/RPU6pKjYuq8YGlzMXFdq1usr1KoPHSQ7DPJWsO+W/LVJVKCVAUN4blfRZYCX
         4/a2g7rcgKqn2stQKkBCcHKRts3U/Vvt3X4E2EKCLMLKaDLvSQBbc+97AkijSvZxJyrM
         1OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCrmQtQ6G5xKDXMfb8Hy9b+IoBCCMbKlxb6tdphdjdhAvK9hu4G7vHtQVoJgQMw3vB9nhWz1D6DG5BF0M6GqEvXBbQ7fC0yWnf1Q8=
X-Gm-Message-State: AOJu0Yz10eqk1DfaZXpC/UxasWOonmTpk3CxDBm5zp3nymTuTO+bPhZ8
	mccc4oBzo99HkLIm/7RLbh+Cdik3Wz9/OYhNZFA+dpD3fZdK7mGN
X-Google-Smtp-Source: AGHT+IHXgL9debFvWZAoCQrU5U3M+829xjnxkEz0F7kqoip4AF5ZVEbhUB6ydMsOHSFm+eW2DZtPlg==
X-Received: by 2002:a05:6a21:628:b0:1a7:9cf6:6044 with SMTP id adf61e73a8af0-1afde0dc45cmr9412708637.27.1715661279888;
        Mon, 13 May 2024 21:34:39 -0700 (PDT)
Received: from [192.168.0.107] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d47e0sm87638805ad.5.2024.05.13.21.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 21:34:39 -0700 (PDT)
Message-ID: <56463a97-eb90-4884-b2f5-c165f6c3516a@gmail.com>
Date: Tue, 14 May 2024 11:34:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression of e1000e (I219-LM) from 6.1.90 to 6.6.30
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>, intel-wired-lan@lists.osuosl.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 lukas.probsthain@googlemail.com
References: <ZkHSipExKpQC8bWJ@archie.me>
 <b2897fda-08e8-40de-b78a-86e92bde41db@lunn.ch>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <b2897fda-08e8-40de-b78a-86e92bde41db@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/24 00:17, Andrew Lunn wrote:
> On Mon, May 13, 2024 at 03:42:50PM +0700, Bagas Sanjaya wrote:
>> Hi,
>>
>> <lukas.probsthain@googlemail.com> reported on Bugzilla
>> (https://bugzilla.kernel.org/show_bug.cgi?id=218826) regression on his Thinkpad
>> T480 with Intel I219-LM:
>>
>>> After updating from kernel version 6.1.90 to 6.6.30, the e1000e driver exhibits a regression on a Lenovo Thinkpad T480 with an Intel I219-LM Ethernet controller.
> 
> Could you try a git bisect between these two kernel versions? You
> might be able to limit it to drivers/net/ethernet/intel/e1000e, which
> only had around 15 patches.
> 

The BZ reporter (Cc'ed) says that bisection is in progress. You may
want to log in to BZ to reach him.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

