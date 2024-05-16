Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A865F143885
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715854082; cv=none; b=rYJxvoaD9jWQwGgvpmAj32tt7nMWhuhVBTXTvUY8oWE1Y9vy8selctgD2zaOj69NPoKtBOpU/bf1Vt8enDV15Zn/TxAZzLx1T7+N8/sbJU1kQz7CWT4xEhUxjaqWQdxUu6A53zdyrsQmq+ZiyYIioPsBji0MVlGhLqyQLOASyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715854082; c=relaxed/simple;
	bh=VN+iz4MME0m7e1K23tweQeLzkscaLfxE+QPVGJsb6TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WePuo52Ms//PlF3bNc/ZqImXyVbdgclhH0jx7+uvBM/CRVS7i33s77GLWa7j8B1/SW27opz3EgKyrIAxj7+kkG2bC+wPE2x0BwLBhFIQuu4/64YeJ2znIXjgi1MFAMGv4boMQMmDygqFQ1CTJwJ39Wj7N5Wu0lYuBQSiZ9fJ6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASuFJdZA; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASuFJdZA"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2454bad9957so166059fac.2
        for <regressions@lists.linux.dev>; Thu, 16 May 2024 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715854079; x=1716458879; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z7URvtjqC9A8pKrxMzcq/a5L2iC+R+uiDHqz5CgzL1I=;
        b=ASuFJdZAKG0YrLHOdTHQ0GyMXvDit01E9HBcSwSWGbcoZkdsW1ExnbFM2EXI6y47qZ
         4EuV6SjiT2p5OTyisbNKVKq9dyIVJHkryqqa5uw/v+jITQwgKKYdz5DTqHsru7mVXOes
         PfHOtA7U3MgIQPGr/5p80id22uHiHSwvNfoV2WpfIkNANiBmDgX/ht+dBz07fCqu9rIC
         ygZqxI2il4aOe1ZQuezp2OP89PliKjK4zgKRBNWKZRe1mNVmRW9RDP4H7UMvVSLKUdXF
         hvxuKzDXzUK8rEf1I7SVjBM+3VLdZZSnun3MX2Pwanjl8OQsSNHxm4vGo2AxXoqSKsgP
         mq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854079; x=1716458879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7URvtjqC9A8pKrxMzcq/a5L2iC+R+uiDHqz5CgzL1I=;
        b=mas28A79F3D1fNvyBzqqlKmzRsyj6rD+TrDHEFs4Ci02kgHkS8g3XpYpKS3OeE8+Sr
         vsBUs8T/aGO7jWte9nJ5ol/LuJQyCYrZK1z9vuRsaTsirssh6TOyRG+GaeCzXg7dMYfh
         ZfwRKJeelEq4PxbFZ8IcLOZ9L8ZTxrKRSHDVvLEbc9hdPIbEB/+Jp9hrUQZYP8mAvjZF
         smvHVGNE/Tga06LkiU+lw5nwKjlSSkV6WRYbOBULlByJ96gQI1lbReOh4hWx03TR2l2o
         EkB1su0/592Odpv5K7Q7ZS7lbcOLVJEzBV22bx/RgQFwF23ywIe9h2q754rKJN+ZIQA+
         u7KQ==
X-Gm-Message-State: AOJu0YyzRsaq1LgoKBqaZ7lVuj8F4AclDgn3tPhX0vn+rI3UuyeiFS4I
	49qc1f6ouDtYziljivF7yM8rtxgso+hjiDR2zP1kc43U4jiIh9+r8VVHOw==
X-Google-Smtp-Source: AGHT+IGVHR9gt4zMtsMVDnhtuiiMsx1M3r//vih2hsGHF7q4DMvkYh9X/w7Hkh1EN0ngUM1C+zYoow==
X-Received: by 2002:a05:6870:d1c6:b0:23c:43d5:6025 with SMTP id 586e51a60fabf-24172e2ec4cmr21101569fac.46.1715854079483;
        Thu, 16 May 2024 03:07:59 -0700 (PDT)
Received: from [192.168.0.107] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6653fsm13051665b3a.19.2024.05.16.03.07.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 03:07:59 -0700 (PDT)
Message-ID: <453b71cd-7fa4-49ad-a2dd-35f63ea79979@gmail.com>
Date: Thu, 16 May 2024 17:07:55 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SATA ACPI SECURITY FREEZE LOCK (regression?)
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <ZkL0EIESAleNhVqr@archie.me>
 <ef803d3c-14c3-47ef-91d7-4ca498519bf0@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ef803d3c-14c3-47ef-91d7-4ca498519bf0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/24 16:56, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 14.05.24 07:18, Bagas Sanjaya wrote:
>>
>> doru iorgulescu <doru.iorgulescu1@gmail.com> dumped repeated SATA error
>> messages on Bugzilla (https://bugzilla.kernel.org/show_bug.cgi?id=218832):
> 
> Thx. I wonder if this is a problem at all. Acted in bugzilla for now.
> 
> BTW: you did not reply to my question yesterday: why did you start for
> forwarding bugzilla tickets yourself again? I thought we agreed to let
> me handle that.
> 

I'm just wondering there and see what bugs I can forward to mailing lists
(of course with relevant maintainers Cc'ed).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

