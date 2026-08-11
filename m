Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A592443ABB
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451193; cv=none; b=HB8sVbOifqHIG8BKGXCzj9SBBp5uNZXltBiAJkzqX4ViPjHcsR0f8ocxkKq9BXPp4XLof6xK0tBdtrgwKvJT9zglsdyNyPo1VSWK9+VUnh49rq+Q6sm/8NSB0gZbJX4yytXxl8bP7s93xUf+r6hq00yFzgw7KhnLPQuvvILN1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451193; c=relaxed/simple;
	bh=FhK+PPdEUEsR/M3kiMix3JnW50mQEytqxeqxwx9Vaw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axi2vqvEuKHfuLyhcD/Ud+riN13HSX1lF374u073d7aWFi8ac8uT3dFSCodjbQ4PZAChY3b33S8b7w2oLpbDQ71OmUFQkSKBQl4V1hlEcefL0EpEF9C12AeBszowf5FVMvKfXib3S3HM0fOOHlfvIdZkS6E9WG8OMlQ35HVGk+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/s2D3iH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/s2D3iH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f6609c657so1542708f8f.2
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451190; x=1787055990; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcp9Xyy2hoh4eNF+HTy2sWu8AKCbGo8+F9Skb8g8ERE=;
        b=D/s2D3iHOUruniopHx7L7WekxDybXYE0aSFTrYIgQwV4s2jKZBRzmUFVoLY3OgTZiX
         fcNKVRNanVJYjy6PdktUY8fBuZUf3t0ISSCyrOFaBQJrRcy3jbZSvK8KtNA8/Z4pK4W0
         KsWQ5yfbYzjaM0zDGTOUYA/3TsGG4tqeL48SvHDHpoqQ3aAS55EsFNnunemQ5AkV4pDi
         Pa+3gCniiFgTP8Ha80wwjteUIzCW6Sk6BdUi43lRDuRbzn9GUAMrTG8+TuigQW3EpH8j
         Bifa/4VUAaFW252djEboZBWWGhWuk9V2q6nOoyOF8G1htLhrjdVhYpS6IrU+3aFceUXk
         1jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451190; x=1787055990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcp9Xyy2hoh4eNF+HTy2sWu8AKCbGo8+F9Skb8g8ERE=;
        b=UTOcCUMQwjbw4F5EC/EFSqtMGw1iUXHA7XR2cuUFkTBcpVzQZ5LfJAwVpliEW27AXd
         LT7sFm8qVcA1h6NX1zpx9Eu/AMrk/SS0RKs6S15SMwiOU5i2MZLvK1fakkpMMnmpaQtu
         g8PpB+FNEs0kYQFQ2A7SSHyIux5TNgp3VoLZqg3BMUuXe5FS4BDIMrhpiVs3ozMW4Ze1
         U1FNy4gttjO7Q9kz+/Qf3LJzcTwfrQqr8nyKa7EedVC3ItuOqbwMJDTNH4HX/72fTmvC
         FMYDw2+//NtKVi1tkdx6wTn+QEnF3nWnJYoBhbsiVuDfHmSb+0Y0R77cFde6kcepXQKp
         FPXA==
X-Forwarded-Encrypted: i=1; AHgh+RqVioaPeW/gBsuqXwSLPp0F5Imh2M5N4tnJxxVbD+OM7eTLtAEPMdbPOTF+1VmZgOhiqAvE+gllUvb/sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOzC0AIBBqNj2OtVc4ispGGN85+qvS/MzD3HGaEInJpFZMKgK3
	bS1YSowla6UzLgtSglM2H7sg7EDWozWPthbPBTvn0MRjStahsC1mSZ7Y
X-Gm-Gg: AR+sD1235YQPADwoem8uNQUaYHm4TtUBi9OW0TOEJAwGAa0iqv+oENHLO8+t8RgGoq7
	GtWe56sRlHGD1abJNkbxcSvU8dS/SAXsfK2p3r0yAeiKs/zVsZ6cnX/ZHwlCGMFTa13955UQFFK
	4ye+xjsAprBvXjm5rV4ZkzL2RRatMK83otPrfM/okZuynE0ZQWzoNZ44rU/tUoqyIMvDoodC7Y+
	U5vyxEZqGO7vHJ9T+0I5VtgvQfNw8YUg1UznWWCeB8vs58JEp19ml8n2dUjCbmM3jsh/n6HSoke
	hQrF4n7jFDl6eOMc4sRk9kH7UkvMfYEM64kxup2MVPubPq7fDqQqEYdIaxGlq7O6NXybwAlgOae
	TEYHL6PmBpEiM/L7UXgDPxOUJHLA2gSfn8bUd2Fc+rwstimuJ+X90yapVtQCkOfDuOwDmsGJich
	SwJNqlfyVQ/46uFlncNa8Oq1n1LIYe7WvMkcLInyEMVFDGg5a2tQzGo7mLAqBi8NnnXsOVs6NmT
	XTX
X-Received: by 2002:a05:6000:22c9:b0:481:4810:d701 with SMTP id ffacd0b85a97d-4814adbb1d1mr4452767f8f.19.1786451190140;
        Tue, 11 Aug 2026 05:26:30 -0700 (PDT)
Received: from [192.168.10.195] ([188.216.175.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a7096c5sm4247773f8f.24.2026.08.11.05.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:26:29 -0700 (PDT)
Message-ID: <8a0fad2d-788a-403f-a880-2f97c6708275@gmail.com>
Date: Tue, 11 Aug 2026 14:26:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Please revert 1191285ecb42 from 7.1.y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 George Zhang <george.zhang@amd.com>
References: <9c6acb62-4080-48e6-9ba2-d1c457c4ec88@gmail.com>
 <2026081106-pebbly-cahoots-37a7@gregkh>
 <23db5f95-c2d6-4712-856e-28f647e184f7@leemhuis.info>
 <1caea72e-b9c8-452b-a3ff-5690d948b4fc@gmail.com>
 <2026081151-reabsorb-calamari-7442@gregkh>
Content-Language: en-US, it-IT
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <2026081151-reabsorb-calamari-7442@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2026 10:08, Greg KH wrote:
> We aim to be "bug compatible" with Linus's branch, otherwise the
> "pressure" to fix those bugs goes down.  But I defer to the maintainers
> of the code involved if it is being worked on, and they want it
> reverted, great, we can do that.  Otherwise we prefer to leave it as-is.

I understand. Sorry for asking about things that might be obvious to 
most people here. My expectation was that only a selected subset of the 
patches on the Linus' tree were to enter in stable, so do we really need 
to have stable "bug compatible" wrt this bug? The original behavior was 
not free of issues, but they were rather minor (a reporting issue). Now 
we have this very bad behavior where the display remains dark.

To make the matter worse, on systems that have encrypted root the screen 
remains dark also on that password prompt (observed with plymouth).

In any case, I managed testing 7.2.0RC7 and it is fine again.

Looks like the Linus' tree has more changes wrt backlight, and the 
interesting ones are probably those in the cumulative fix 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=973fd9493ec21f12e760fbbedeb7b0b2317c02f4.

Best,

Sergio


