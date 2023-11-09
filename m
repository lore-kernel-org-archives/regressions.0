Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44620B34
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="sSeEPw52"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-357bc05f94dso682515ab.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 09:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699551491; x=1700156291; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5bewZsgLoaEmPwLV1OcKnRe1560vBmH3lHFBpwA6Zw=;
        b=sSeEPw52OSmZNE2zxwBus7SssQg2EdSGqACezT0gwb9C6cVJsFwOC1nGtF04g4BwHo
         N7wdlGWzE+D5SLhaNMphR9mT7OvQqBd07XTathcZu4gyQVZ26ESUPrjlZdp+0ABlCEap
         WGfEnAr8s7egv7LpsmzTBefS3lbxulOfinop/3WdOnXlX2Adse9y/lr4G/AT4Fqus0qv
         KqZ1e/QqhPxwJtAfKRA7pujyew4SATWTm7wSkqXOa1lJfL7jLqmz75B1WMIL5BkYjNTj
         jSBH6HLBahPWbufovSHAUDi72G0Tw0ftgc5v3xyL/ZGTNEoLWvF9Q3MF6eFrNMq3WAja
         Qv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699551491; x=1700156291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5bewZsgLoaEmPwLV1OcKnRe1560vBmH3lHFBpwA6Zw=;
        b=GyIzAx75TabMZk3paaL81lcfmZ+9Hfpxi11AX3g/wG2CBCKlEnewHKf2pJyCxu77jl
         x9t3/Q2l+1uuxNim6Oh1ncigeiMIyH0hUuHKFCyG5UnxvorL6I1hItqAJ2s5KROZej4H
         DjcVjhLYkmJnKtLRQbmnuz/A06ZVSKiTy+brLKW10Ii0BXHr4JYSGA5RwdsaXN4wLhjh
         6sSqPURprvriX1VQUSfgQtpSoufRo0QwHssvOcirYYYhf4yXujKCThQqxh+zHHDgoV/i
         hbPZJOX3vhxtOPk3103qglNSHqioDAit7Fs9VKCcKT/LnUY+e/iMv2JOOS4PlmyzCIVH
         PEww==
X-Gm-Message-State: AOJu0YwwJUQ3wJqpNDPKUgsM5QCMRw74sS5tPDbvXpKM3XPMlAN6x5bv
	Y2Uaq6k0xJfMdaoUmR57b7Eyxcn5fAgu5f+Z77dymA==
X-Google-Smtp-Source: AGHT+IE+5N/5m/FvvAfRXAygze9AflyEkuzjv8UhZa4DoJld5kOHWXMUzmgp6Y3/SsHC/U6dag7Ikw==
X-Received: by 2002:a92:2610:0:b0:359:3fd2:adcc with SMTP id n16-20020a922610000000b003593fd2adccmr6060353ile.3.1699551491545;
        Thu, 09 Nov 2023 09:38:11 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id p8-20020a92c108000000b0034fd4562accsm4504358ile.28.2023.11.09.09.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:38:11 -0800 (PST)
Message-ID: <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
Date: Thu, 9 Nov 2023 10:38:10 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
 <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk>
 <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
 <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com>
 <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
 <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
 <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
 <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/23 10:36 AM, Timothy Pearson wrote:
>> Hmm ok, that is odd. How quickly does it trigger for you?
> 
> Almost immediately.  Third pass in this case, which is pretty typical
> -- without any delays etc. it will normally fail in under 10
> iterations.  When I add other delays in e.g. the worker thread it
> becomes less likely to fail, but still fails.   Only adding the udelay
> in the one specific (IRQ locked) location allows it to pass all 200
> iterations.

What specific IRQ locked location? Hard to know where you are adding
these things without seeing the patches.

-- 
Jens Axboe

