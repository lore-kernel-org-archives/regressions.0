Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6865DF1D
	for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707926655; cv=none; b=Q0fp1NLZKjNSm6PQAsA4O9asps7ObWdgW6+iJMGyQhnAQ20bEMyazqss56k1c/S3uy2Wu1cWKYXN9DhuWaaXuRZOY11v5JiS/P7z+lmuI+wJ53kxbKdTsGOQ/B33BhfK6IovNGaivsJEEXe7Ysv6vRZlVbfZ1e9m8ssLvnTq2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707926655; c=relaxed/simple;
	bh=dhfPmhc19ws+8B+oLEigyKsvrbjeXwEIDd9y5ctR7zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qhm8W6dWdPZuKtHbMiWbGAwLZERv10FpzvcR6rvFnthzxtA2HaN1DCLLIBLT8ZX9DUgtXHeiKowAHCnnTV+igCGvrpBjKEOWTX0ioUB8ZAFcA5cgaJNdGE+nTJbU2YjCX2yvE2R0OQIZw5Rs9lmdi6vB8GBMS6KxMpfolHt+42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jScfaFtQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jScfaFtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707926652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUeWFwwvdEOL3h1AzebEsOOFcCr3CfteSwgIpDiWPf4=;
	b=jScfaFtQTG8FrRAsXkP+X0ggfl+pBkeRJm3OYpkRmzpFQ1UUdOHoIHg9m7F7GuY224GzIZ
	dLc0MUvinUZBYw9ZUjsCWnF25FRDwPa7bg1yzgi9KsQ8RL/5mbSJLgLspYF6eZ4ZP1KbvV
	TYqz0gpSKCIwBXFuUKdDPtbB1JdkoWA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-r1t_XWbAO2WGgnZ50Egmnw-1; Wed, 14 Feb 2024 11:04:11 -0500
X-MC-Unique: r1t_XWbAO2WGgnZ50Egmnw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d0908edbd0so51162831fa.2
        for <regressions@lists.linux.dev>; Wed, 14 Feb 2024 08:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707926650; x=1708531450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUeWFwwvdEOL3h1AzebEsOOFcCr3CfteSwgIpDiWPf4=;
        b=Hp0bA25VIi9gTtZ/udRpWPmQiMzYZdDB614Z+BOYExIYTXz5eATEWw5Mif3Vflh8PK
         RW0BgwrEKcmU3N0wZZsOZyct4sxtR4AwYUFH0AeruKG4V7/xiyBb/Q/w7K9wOjA6j3Zr
         VWIhIFud2/S5Xtfkce6oxj8kJfaTwOB1IRqHlulql4Ivl+bIOe5eiNBuYJliwayvYGYW
         o5W4A2ODfDy80BJo9TCY/9TXo0/x3PeqbcJaIFNpG9Ux80DMsIOJYwqhSdkJXKURHGmU
         k66UwEpS8oU4M6JKOoDFafxlI5EnY9+R29D4AvzQTxTrg2lc5xXFXNImzMGSlmtQC7oo
         sPCQ==
X-Gm-Message-State: AOJu0YwFbFDLGztOYk1fyNEzYLylKx0tMteWRb4mIM7aCfBbVJhJOQPl
	ksP8UA/9v9c4ucUxl0yOOqukPam1mJvICzmUZ6Spwn8CWyXrAOdJLliTEhIpN6GnGGqlDybl5GI
	oSiNlo7xOS8A51aIw9w3D86VpzCe+q42VTuegUVKmcr2kYo32Z8IGdTMHw61ZZpVzXH08IwyEAG
	gL+e82wJRA0Oh9ZkeLHqV3eqeTnmrk6LpWSXmEnR69F9q3
X-Received: by 2002:ac2:547c:0:b0:511:72f5:8219 with SMTP id e28-20020ac2547c000000b0051172f58219mr2363780lfn.29.1707926649810;
        Wed, 14 Feb 2024 08:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyKxl6BLOZ++hl9NgIaQs2rHs1zcml1wjPnjX4efI52CVOB/wUvqJKRSMm5yykeB+McLTC8g==
X-Received: by 2002:ac2:547c:0:b0:511:72f5:8219 with SMTP id e28-20020ac2547c000000b0051172f58219mr2363750lfn.29.1707926649419;
        Wed, 14 Feb 2024 08:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXx/7vmvr0a63CuE0VBXn+uSO10OQ33XUP3zGswqeYiE/uyRa+mnlWMAdGnDf6h7P919O/JA2fhBwyhmGTqK6O13ggtFxyR5VOuhW6UhFsufA1EbirdoHw60ccGKHjkj7wCaN/qAw4I64gpuB2xFDRlmV0jeBFQFh3EJhh1GA4biJKCY8ks6ZjIuOEQZZwe94AX/rMKnbnh1QkPHfSkM3hJoz7v5LoyO+4lHlCrKRG9tAbU42OoIaEAyUCm8W0M+tlCtdp48eK8+eTgFfkTVls=
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id eq23-20020a056512489700b00511503f9ac5sm305033lfb.231.2024.02.14.08.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 08:04:08 -0800 (PST)
Message-ID: <e752d061-0e94-48c2-ba17-3111a847785d@redhat.com>
Date: Wed, 14 Feb 2024 17:04:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] `lis3lv02d_i2c_suspend()` causes `unbalanced
 disables for regulator-dummy` and `Failed to disable Vdd_IO: -EIO`
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <5fc6da74-af0a-4aac-b4d5-a000b39a63a5@molgen.mpg.de>
 <ZcTmdg2qTq0bP0ul@finisterre.sirena.org.uk>
 <6e20e772-e50e-4600-8325-1878badbbdc8@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6e20e772-e50e-4600-8325-1878badbbdc8@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/14/24 16:34, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 08.02.24 15:34, Mark Brown wrote:
>> On Fri, Feb 02, 2024 at 12:38:04PM +0100, Paul Menzel wrote:
>>
>>> Testing commit 2f189493ae32 (i2c: i801: Add lis3lv02d for Dell XPS 15 7590)
>>> [1], it’s very likely this commit, it turns out, that Linux logs the warning
>>> below during ACPI S3 suspend:
> 
> Mark, many thx for your reply:
> 
>> The driver is just buggy here AFAICT,
> 
> /me reads that as "buggy even before 2f189493ae32, that commit just
> exposed the problem"
> 
>> it's powering off the device in
>> both runtime suspend and runtime resume so if the device is runtime
>> suspended when system suspend happens then it'll power off the device
>> again.  The runtime suspend and system suspend need to talk to each
>> other here.
> 
> Well, that was 6 days ago and nothing further happened. Makes me wonder:
> Who will look into this? And when?

I have a laptop with a lis3lv02d where I can try to reproduced Paul's
problem. I expect this to reproduce on any Dell with the lis3lv02d 
so reverting 2f189493ae32 won't help, it fixes the problem on
Paul's model but not on other Dell models which use the lis3lv02d
driver.

Anways I plan to look at this sometime next week.

Regards,

Hans


